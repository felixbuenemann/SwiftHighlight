import Foundation

// MARK: - HighlightJS

/// Main Swift highlighter engine (state machine port of highlight.js core).
public final class HighlightJS {

    public static let shared = HighlightJS()

    private var languages: [String: LanguageDefinition] = [:]
    private var compiledLanguages: [String: CompiledLanguage] = [:]
    private var aliases: [String: String] = [:]
    private var allAliasesResolved = false
    private let lock = NSRecursiveLock()

    public let options: HighlightOptions
    public let safeMode: Bool

    /// Regex helper API used by language definitions.
    public let regex = RegexHelper()

    private let maxKeywordHits = 7

    public init(options: HighlightOptions = HighlightOptions(), safeMode: Bool = true) {
        self.options = options
        self.safeMode = safeMode
    }

    // MARK: - Language Registration

    public func registerLanguage(_ name: String, definition: @escaping LanguageDefinition) {
        let key = name.lowercased()
        lock.lock()
        defer { lock.unlock() }
        languages[key] = definition
        compiledLanguages.removeValue(forKey: key)

        // Remove aliases pointing at a replaced language.
        aliases = aliases.filter { $0.value != key }
        allAliasesResolved = false
    }

    public func registerLanguage(_ name: String, language: Language) {
        registerLanguage(name) { _ in language }
    }

    public func registerAliases(_ names: [String], forLanguage languageName: String) {
        let target = languageName.lowercased()
        lock.lock()
        defer { lock.unlock() }
        for alias in names {
            aliases[alias.lowercased()] = target
        }
    }

    public func getLanguage(_ name: String) -> CompiledLanguage? {
        let normalized = normalizeLanguageName(name)
        lock.lock()
        defer { lock.unlock() }
        if let compiled = getLanguageDirect_locked(normalized) {
            return compiled
        }

        if !allAliasesResolved {
            resolveAllAliases_locked()
            let resolved = aliases[normalized] ?? normalized
            return getLanguageDirect_locked(resolved)
        }

        return nil
    }

    public func hasLanguage(_ name: String) -> Bool {
        let normalized = normalizeLanguageName(name)
        lock.lock()
        defer { lock.unlock() }
        let resolved = aliases[normalized] ?? normalized
        if languages[resolved] != nil {
            return true
        }

        if !allAliasesResolved {
            resolveAllAliases_locked()
            let resolvedAfter = aliases[normalized] ?? normalized
            return languages[resolvedAfter] != nil
        }

        return false
    }

    public func listLanguages() -> [String] {
        lock.lock()
        defer { lock.unlock() }
        return Array(languages.keys).sorted()
    }

    public func autoDetection(_ name: String) -> Bool {
        guard let language = getLanguage(name) else { return false }
        return !language.disableAutodetect
    }

    private func normalizeLanguageName(_ name: String) -> String {
        name.lowercased()
    }

    /// Must be called with `lock` held.
    private func getLanguageDirect_locked(_ normalizedName: String) -> CompiledLanguage? {
        let resolvedName = aliases[normalizedName] ?? normalizedName

        if let cached = compiledLanguages[resolvedName] {
            return cached
        }

        guard let definition = languages[resolvedName] else {
            return nil
        }

        do {
            let language = definition(self)
            if language.name.isEmpty {
                language.name = resolvedName
            }

            if !language.aliases.isEmpty {
                for alias in language.aliases {
                    aliases[alias.lowercased()] = resolvedName
                }
            }

            let compiler = ModeCompiler(language: language)
            let compiled = try compiler.compile()
            compiledLanguages[resolvedName] = compiled
            return compiled
        } catch {
            if !safeMode {
                print("Error compiling language '\(resolvedName)': \(error)")
            }
            return nil
        }
    }

    /// Must be called with `lock` held.
    private func resolveAllAliases_locked() {
        allAliasesResolved = true
        for (name, definition) in languages where compiledLanguages[name] == nil {
            let language = definition(self)
            for alias in language.aliases {
                aliases[alias.lowercased()] = name
            }
        }
    }

    // MARK: - Highlighting

    public func highlight(
        _ code: String,
        language: String,
        ignoreIllegals: Bool? = nil
    ) -> HighlightResult {
        let shouldIgnoreIllegals = ignoreIllegals ?? options.ignoreIllegals
        let requestedName = normalizeLanguageName(language)

        let (resolvedName, compiledLanguage): (String, CompiledLanguage?) = {
            lock.lock()
            defer { lock.unlock() }
            let resolved = aliases[requestedName] ?? requestedName
            return (resolved, getLanguageDirect_locked(resolved))
        }()

        guard let compiledLanguage else {
            return HighlightResult(
                value: escapeHTML(code),
                language: nil,
                relevance: 0,
                illegal: false,
                code: code
            )
        }

        do {
            var (result, _) = try highlightInternal(
                languageName: resolvedName,
                code: code,
                language: compiledLanguage,
                ignoreIllegals: shouldIgnoreIllegals,
                continuation: nil
            )
            result.code = code
            return result
        } catch {
            return HighlightResult(
                value: escapeHTML(code),
                language: resolvedName,
                relevance: 0,
                illegal: true,
                code: code
            )
        }
    }

    public func highlightAuto(
        _ code: String,
        languageSubset: [String]? = nil
    ) -> AutoHighlightResult {
        // Gather all candidate languages under the lock, then highlight outside it.
        let candidates: [(name: String, language: CompiledLanguage)] = {
            lock.lock()
            defer { lock.unlock() }
            let subset = languageSubset ?? options.languageSubset ?? Array(languages.keys).sorted()
            var result: [(String, CompiledLanguage)] = []
            for languageName in subset {
                let normalized = normalizeLanguageName(languageName)
                guard let resolved = resolveRegisteredLanguageName_locked(normalized) else { continue }
                guard let compiled = getLanguageDirect_locked(resolved) else { continue }
                guard !compiled.disableAutodetect else { continue }
                result.append((resolved, compiled))
            }
            return result
        }()

        var results: [HighlightResult] = [justTextHighlightResult(code)]

        for (name, language) in candidates {
            do {
                let (result, _) = try highlightInternal(
                    languageName: name,
                    code: code,
                    language: language,
                    ignoreIllegals: false,
                    continuation: nil
                )
                results.append(result)
            } catch {
                continue
            }
        }

        let sorted = results.sorted { lhs, rhs in
            if lhs.relevance != rhs.relevance {
                return lhs.relevance > rhs.relevance
            }

            // Break ties using supersetOf relationship (already compiled during candidate gathering).
            if let leftLang = lhs.language,
               let rightLang = rhs.language {
                let leftDef = candidates.first(where: { $0.name == leftLang })?.language
                let rightDef = candidates.first(where: { $0.name == rightLang })?.language
                if let leftRaw = leftDef?.rawDefinition,
                   let rightRaw = rightDef?.rawDefinition {
                    if leftRaw.supersetOf == rightLang { return false }
                    if rightRaw.supersetOf == leftLang { return true }
                }
            }

            return false
        }

        let best = sorted.first ?? justTextHighlightResult(code)
        let secondBest = sorted.count > 1 ? sorted[1] : nil
        return AutoHighlightResult(result: best, secondBest: secondBest)
    }

    private func resolveRegisteredLanguageName_locked(_ name: String) -> String? {
        let normalized = normalizeLanguageName(name)
        if languages[normalized] != nil {
            return normalized
        }
        if let resolved = aliases[normalized] {
            return resolved
        }
        return nil
    }

    private func justTextHighlightResult(_ code: String) -> HighlightResult {
        let emitter = TokenTreeEmitter(
            classPrefix: options.classPrefix,
            classNameAliases: nil
        )
        emitter.addText(code)

        return HighlightResult(
            value: escapeHTML(code),
            language: nil,
            relevance: 0,
            illegal: false,
            code: code,
            tokenTree: emitter.rootNode
        )
    }

    // MARK: - Internal Highlighting

    private func highlightInternal(
        languageName: String,
        code: String,
        language: CompiledLanguage,
        ignoreIllegals: Bool,
        continuation: CompiledMode?
    ) throws -> (HighlightResult, HighlightInternalState) {
        let emitter = TokenTreeEmitter(
            classPrefix: options.classPrefix,
            classNameAliases: language.classNameAliases
        )

        var keywordHits: [String: Int] = [:]
        var relevance: Double = 0
        var modeBuffer = ""
        var top: CompiledMode = continuation ?? language
        var modeStack: [CompiledMode] = [top]
        var continuations: [String: CompiledMode] = [:]

        var index = 0
        var iterations = 0
        var resumeScanAtSamePosition = false
        var scanState = ResumableMultiRegex.ScanState()

        struct LastMatch {
            var type: MatchType
            var index: Int
            var rule: CompiledMode
        }
        var lastMatch: LastMatch?

        let nsCode = code as NSString
        let noMatch = -1

        func aliasScope(_ scope: String) -> String {
            language.classNameAliases?[scope] ?? scope
        }

        func emitKeyword(_ keyword: String, _ scope: String) {
            if keyword.isEmpty { return }
            emitter.startScope(scope)
            emitter.addText(keyword)
            emitter.endScope()
        }

        func processKeywords() {
            guard let keywords = top.keywords,
                  let keywordPattern = top.keywordPatternRe
            else {
                emitter.addText(modeBuffer)
                modeBuffer = ""
                return
            }

            var lastIndex = 0
            var buffer = ""

            while let match = RegexHelpers.exec(keywordPattern, modeBuffer, from: lastIndex) {
                if match.index > lastIndex {
                    buffer += (modeBuffer as NSString).substring(with: NSRange(location: lastIndex, length: match.index - lastIndex))
                }

                let rawWord = match.fullMatch
                let word = language.caseInsensitive ? rawWord.lowercased() : rawWord

                if let entry = keywords[word] {
                    emitter.addText(buffer)
                    buffer = ""

                    let hits = (keywordHits[word] ?? 0) + 1
                    keywordHits[word] = hits
                    if hits <= maxKeywordHits {
                        relevance += entry.relevance
                    }

                    if entry.scope.hasPrefix("_") {
                        buffer += rawWord
                    } else {
                        emitKeyword(rawWord, aliasScope(entry.scope))
                    }
                } else {
                    buffer += rawWord
                }

                lastIndex = match.index + (rawWord as NSString).length
            }

            if lastIndex < (modeBuffer as NSString).length {
                buffer += (modeBuffer as NSString).substring(from: lastIndex)
            }

            emitter.addText(buffer)
            modeBuffer = ""
        }

        func emitMultiClass(_ scope: [Int: String], _ emit: Set<Int>?, _ match: MatchData) {
            let maxGroup = match.match.numberOfRanges - 1
            var i = 1

            while i <= maxGroup {
                if let emit, !emit.contains(i) {
                    i += 1
                    continue
                }

                let text = match.group(i) ?? ""
                if !text.isEmpty {
                    if let klass = scope[i] {
                        emitKeyword(text, aliasScope(klass))
                    } else {
                        modeBuffer = text
                        processKeywords()
                    }
                }

                i += 1
            }
        }

        func processSubLanguage() throws {
            guard !modeBuffer.isEmpty else { return }

            switch top.subLanguage {
            case .single(let rawName):
                let name = normalizeLanguageName(rawName)
                guard let subLanguage = getLanguage(name) else {
                    emitter.addText(modeBuffer)
                    modeBuffer = ""
                    return
                }

                let (result, subState) = try highlightInternal(
                    languageName: name,
                    code: modeBuffer,
                    language: subLanguage,
                    ignoreIllegals: true,
                    continuation: continuations[name]
                )
                continuations[name] = subState.top

                if top.relevance > 0 {
                    relevance += result.relevance
                }
                if let subEmitter = subState.emitter {
                    emitter.addSubLanguage(subEmitter, language: result.language ?? name)
                } else {
                    emitter.addText(modeBuffer)
                }

            case .multiple(let names):
                let subset = names.isEmpty ? nil : names.map { normalizeLanguageName($0) }
                let result = highlightAuto(modeBuffer, languageSubset: subset)

                if top.relevance > 0 {
                    relevance += result.relevance
                }
                if let subTree = result.result.tokenTree {
                    let subNode = TokenNode()
                    subNode.language = result.language ?? ""
                    subNode.children = subTree.children
                    emitter.addSubLanguageNode(subNode)
                } else {
                    emitter.addText(modeBuffer)
                }

            case .auto:
                let result = highlightAuto(modeBuffer, languageSubset: nil)

                if top.relevance > 0 {
                    relevance += result.relevance
                }
                if let lang = result.language,
                   let subTree = result.result.tokenTree {
                    let subNode = TokenNode()
                    subNode.language = lang
                    subNode.children = subTree.children
                    emitter.addSubLanguageNode(subNode)
                } else {
                    emitter.addText(modeBuffer)
                }

            case .none:
                emitter.addText(modeBuffer)
            }

            modeBuffer = ""
        }

        func processBuffer() throws {
            if top.subLanguage != nil {
                try processSubLanguage()
            } else {
                processKeywords()
            }
        }

        func startNewMode(_ mode: CompiledMode, _ match: MatchData) {
            if let scope = mode.scope {
                emitter.startScope(aliasScope(scope))
            }

            if let beginScope = mode.beginScope {
                switch beginScope {
                case .single(let scope):
                    emitKeyword(modeBuffer, aliasScope(scope))
                    modeBuffer = ""
                case .multi(let scopes):
                    if let wrap = scopes[0], mode.beginScopeEmit?.contains(0) == true {
                        emitKeyword(modeBuffer, aliasScope(wrap))
                    } else {
                        emitMultiClass(scopes, mode.beginScopeEmit, match)
                    }
                    modeBuffer = ""
                }
            }

            modeStack.append(mode)
            top = mode
        }

        func endOfMode(_ modeIndex: Int, _ match: MatchData, _ matchPlusRemainder: String) -> Int? {
            guard modeIndex >= 0 else { return nil }
            let mode = modeStack[modeIndex]

            var matched = RegexHelpers.startsWith(mode.endRe, matchPlusRemainder)
            if matched {
                if let onEnd = mode.onEnd {
                    let response = Response(mode: mode)
                    onEnd(match, response)
                    if response.isMatchIgnored {
                        matched = false
                    }
                }

                if matched {
                    var target = modeIndex
                    while modeStack[target].endsParent && target > 0 {
                        target -= 1
                    }
                    return target
                }
            }

            if mode.endsWithParent, modeIndex > 0 {
                return endOfMode(modeIndex - 1, match, matchPlusRemainder)
            }

            return nil
        }

        func doIgnore(_ lexeme: String) -> Int {
            guard top.matcher != nil else { return 1 }
            if scanState.regexIndex == 0 {
                if !lexeme.isEmpty {
                    modeBuffer += (lexeme as NSString).substring(to: 1)
                }
                return 1
            }

            resumeScanAtSamePosition = true
            return 0
        }

        func doBeginMatch(_ match: ParseMatch) throws -> Int {
            let lexeme = match.matchData.fullMatch
            let newMode = match.rule

            let response = Response(mode: newMode)
            let callbacks = [newMode.beforeBegin, newMode.onBegin]
            for callback in callbacks {
                guard let callback else { continue }
                callback(match.matchData, response)
                if response.isMatchIgnored {
                    return doIgnore(lexeme)
                }
            }

            if newMode.skip {
                modeBuffer += lexeme
            } else {
                if newMode.excludeBegin {
                    modeBuffer += lexeme
                }
                try processBuffer()
                if !newMode.returnBegin && !newMode.excludeBegin {
                    modeBuffer = lexeme
                }
            }

            startNewMode(newMode, match.matchData)
            return newMode.returnBegin ? 0 : (lexeme as NSString).length
        }

        func doEndMatch(_ match: ParseMatch) throws -> Int {
            let lexeme = match.matchData.fullMatch
            let remainder = nsCode.substring(from: match.index)

            guard let endModeIndex = endOfMode(modeStack.count - 1, match.matchData, remainder) else {
                return noMatch
            }

            let origin = top
            let endMode = modeStack[endModeIndex]

            if let endScope = origin.endScope {
                switch endScope {
                case .single(let scope):
                    try processBuffer()
                    emitKeyword(lexeme, aliasScope(scope))
                case .multi(let scopes):
                    try processBuffer()
                    emitMultiClass(scopes, origin.endScopeEmit, match.matchData)
                }
            } else if origin.skip {
                modeBuffer += lexeme
            } else {
                if !(origin.returnEnd || origin.excludeEnd) {
                    modeBuffer += lexeme
                }
                try processBuffer()
                if origin.excludeEnd {
                    modeBuffer = lexeme
                }
            }

            while modeStack.count > endModeIndex {
                let closing = modeStack.removeLast()
                if closing.scope != nil {
                    emitter.endScope()
                }
                if !closing.skip && closing.subLanguage == nil {
                    relevance += closing.relevance
                }
            }
            top = modeStack.last ?? language

            if let starts = endMode.starts {
                startNewMode(starts, match.matchData)
            }

            return origin.returnEnd ? 0 : (lexeme as NSString).length
        }

        func processContinuations() {
            var scopes: [String] = []
            var current: CompiledMode? = top

            while let node = current, node !== language {
                if let scope = node.scope {
                    scopes.insert(aliasScope(scope), at: 0)
                }
                current = node.parent
            }

            for scope in scopes {
                emitter.startScope(scope)
            }
        }

        func processLexeme(_ textBeforeMatch: String, _ match: ParseMatch?) throws -> Int {
            let lexeme = match?.matchData.fullMatch
            modeBuffer += textBeforeMatch

            guard let match, let lexeme else {
                try processBuffer()
                return 0
            }

            if let lastMatch,
               lastMatch.type == .begin,
               match.type == .end,
               lastMatch.index == match.index,
               lexeme.isEmpty {
                if match.index < nsCode.length {
                    modeBuffer += nsCode.substring(with: NSRange(location: match.index, length: 1))
                }
                return 1
            }
            lastMatch = LastMatch(type: match.type, index: match.index, rule: match.rule)

            if match.type == .begin {
                return try doBeginMatch(match)
            }

            if match.type == .illegal, !ignoreIllegals {
                throw HighlightError.illegalMatch(lexeme, match.index)
            }

            if match.type == .end {
                let processed = try doEndMatch(match)
                if processed != noMatch {
                    return processed
                }
            }

            if match.type == .illegal, lexeme.isEmpty {
                if match.index != nsCode.length {
                    modeBuffer += "\n"
                }
                return 1
            }

            if iterations > 100_000 && iterations > match.index * 3 {
                throw HighlightError.regexCompilationError(
                    "potential infinite loop",
                    NSError(domain: "SwiftHighlight", code: 3)
                )
            }

            modeBuffer += lexeme
            return (lexeme as NSString).length
        }

        processContinuations()

        top.matcher?.considerAll(&scanState)

        while true {
            iterations += 1

            if resumeScanAtSamePosition {
                resumeScanAtSamePosition = false
            } else {
                top.matcher?.considerAll(&scanState)
            }

            scanState.lastIndex = index
            guard let matchResult = try top.matcher?.exec(code, from: index, state: &scanState) else {
                break
            }

            let match = ParseMatch(
                index: matchResult.match.index,
                type: matchResult.type,
                rule: matchResult.rule,
                matchData: matchResult.match
            )

            let beforeLength = max(0, match.index - index)
            let beforeMatch = nsCode.substring(with: NSRange(location: index, length: beforeLength))
            let processed = try processLexeme(beforeMatch, match)
            index = match.index + processed
        }

        if index <= nsCode.length {
            let remainder = nsCode.substring(from: index)
            _ = try processLexeme(remainder, nil)
        }

        emitter.finalize()

        let result = HighlightResult(
            value: emitter.toHTML(),
            language: languageName,
            relevance: relevance,
            illegal: false,
            code: code,
            tokenTree: emitter.rootNode
        )
        let internalState = HighlightInternalState(top: top, emitter: emitter)
        return (result, internalState)
    }
}

extension HighlightJS: @unchecked Sendable {}

// MARK: - Parse Match

private struct ParseMatch {
    let index: Int
    let type: MatchType
    let rule: CompiledMode
    let matchData: MatchData
}

// MARK: - Regex Helper

/// Helper class providing regex utilities to language definitions.
public final class RegexHelper {

    public func concat(_ patterns: String...) -> String {
        RegexHelpers.concat(patterns)
    }

    public func either(_ patterns: String...) -> String {
        RegexHelpers.either(patterns)
    }

    public func lookahead(_ pattern: String) -> String {
        RegexHelpers.lookahead(pattern)
    }

    public func optional(_ pattern: String) -> String {
        RegexHelpers.optional(pattern)
    }

    public func anyNumberOfTimes(_ pattern: String) -> String {
        RegexHelpers.anyNumberOfTimes(pattern)
    }
}

// MARK: - Convenience Extensions

extension HighlightJS {
    /// Quick highlight with auto-detection.
    public func highlight(_ code: String) -> HighlightResult {
        highlightAuto(code).result
    }

    /// Get highlighted HTML with optional `<pre><code>` wrapper.
    public func highlightedHTML(
        _ code: String,
        language: String? = nil,
        wrapInPre: Bool = true
    ) -> String {
        let result: HighlightResult
        if let lang = language {
            result = highlight(code, language: lang)
        } else {
            result = highlightAuto(code).result
        }

        if wrapInPre {
            let langClass = result.language.map { " language-\($0)" } ?? ""
            return "<pre><code class=\"hljs\(langClass)\">\(result.value)</code></pre>"
        }

        return result.value
    }

    /// Register all built-in languages (language modules call registration APIs).
    public func registerAllLanguages() {
        // Intentionally empty.
    }
}
