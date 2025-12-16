import Foundation

// MARK: - HighlightJS

/// The main syntax highlighter class - Swift port of highlight.js
/// This provides the public API for syntax highlighting
public class HighlightJS {

    /// Singleton instance for convenience
    public static let shared = HighlightJS()

    /// Registered language definitions
    private var languages: [String: LanguageDefinition] = [:]

    /// Compiled language cache
    private var compiledLanguages: [String: CompiledLanguage] = [:]

    /// Language name aliases
    private var aliases: [String: String] = [:]

    /// Global configuration options
    public var options: HighlightOptions

    /// Safe mode - recover from errors instead of throwing
    public var safeMode: Bool = true

    /// Regex helper instance for use by language definitions
    public let regex = RegexHelper()

    /// Initialize a new highlighter
    public init(options: HighlightOptions = HighlightOptions()) {
        self.options = options
    }

    // MARK: - Language Registration

    /// Register a language with a definition function
    public func registerLanguage(_ name: String, definition: @escaping LanguageDefinition) {
        languages[name] = definition
        compiledLanguages.removeValue(forKey: name)
    }

    /// Register a language with a pre-built Language object
    public func registerLanguage(_ name: String, language: Language) {
        registerLanguage(name) { _ in language }
    }

    /// Register an alias for a language
    public func registerAliases(_ names: [String], forLanguage languageName: String) {
        for alias in names {
            aliases[alias] = languageName
        }
    }

    /// Get a compiled language by name (resolves aliases)
    public func getLanguage(_ name: String) -> CompiledLanguage? {
        let resolvedName = aliases[name] ?? name

        // Check cache
        if let cached = compiledLanguages[resolvedName] {
            return cached
        }

        // Compile if we have a definition
        guard let definition = languages[resolvedName] else {
            return nil
        }

        do {
            let language = definition(self)
            let compiler = ModeCompiler(language: language)
            let compiled = try compiler.compile()
            compiledLanguages[resolvedName] = compiled

            // Register aliases from the language definition
            for alias in language.aliases {
                aliases[alias] = resolvedName
            }

            return compiled
        } catch {
            if !safeMode {
                print("Error compiling language '\(resolvedName)': \(error)")
            }
            return nil
        }
    }

    /// Check if a language is registered
    public func hasLanguage(_ name: String) -> Bool {
        let resolvedName = aliases[name] ?? name
        return languages[resolvedName] != nil
    }

    /// List all registered language names
    public func listLanguages() -> [String] {
        return Array(languages.keys).sorted()
    }

    /// Check if auto-detection is enabled for a language
    public func autoDetection(_ name: String) -> Bool {
        guard let language = getLanguage(name) else { return false }
        return !language.disableAutodetect
    }

    // MARK: - Highlighting

    /// Highlight code with a specific language
    public func highlight(
        _ code: String,
        language: String,
        ignoreIllegals: Bool? = nil
    ) -> HighlightResult {
        let shouldIgnoreIllegals = ignoreIllegals ?? options.ignoreIllegals

        guard let compiledLanguage = getLanguage(language) else {
            // Unknown language - return escaped code
            return HighlightResult(
                value: escapeHTML(code),
                language: nil,
                relevance: 0,
                illegal: false,
                code: code
            )
        }

        do {
            return try highlightInternal(
                code: code,
                language: compiledLanguage,
                ignoreIllegals: shouldIgnoreIllegals
            )
        } catch {
            if safeMode {
                return HighlightResult(
                    value: escapeHTML(code),
                    language: language,
                    relevance: 0,
                    illegal: true,
                    code: code
                )
            } else {
                // Re-throw in non-safe mode
                return HighlightResult(
                    value: escapeHTML(code),
                    language: language,
                    relevance: 0,
                    illegal: true,
                    code: code
                )
            }
        }
    }

    /// Auto-detect language and highlight
    public func highlightAuto(
        _ code: String,
        languageSubset: [String]? = nil
    ) -> AutoHighlightResult {
        let subset = languageSubset ?? options.languageSubset ?? listLanguages()

        var bestResult: HighlightResult?
        var secondBestResult: HighlightResult?
        var bestRelevance: Double = -1

        for languageName in subset {
            guard autoDetection(languageName) else { continue }

            let result = highlight(code, language: languageName, ignoreIllegals: false)

            if result.relevance > bestRelevance {
                secondBestResult = bestResult
                bestResult = result
                bestRelevance = result.relevance
            } else if result.relevance == bestRelevance && bestResult != nil {
                // Same relevance - keep both
                secondBestResult = result
            }
        }

        // If no good match, return plain text
        if bestResult == nil || bestRelevance == 0 {
            let plainResult = HighlightResult(
                value: escapeHTML(code),
                language: nil,
                relevance: 0,
                illegal: false,
                code: code
            )
            return AutoHighlightResult(result: plainResult, secondBest: nil)
        }

        return AutoHighlightResult(result: bestResult!, secondBest: secondBestResult)
    }

    // MARK: - Internal Highlighting

    /// The main highlighting loop
    private func highlightInternal(
        code: String,
        language: CompiledLanguage,
        ignoreIllegals: Bool,
        continuation: CompiledMode? = nil
    ) throws -> HighlightResult {
        let emitter = TokenTreeEmitter(
            classPrefix: options.classPrefix,
            classNameAliases: language.classNameAliases
        )

        var relevance: Double = 0
        var modeBuffer = ""
        var top: CompiledMode = continuation ?? language
        var index = 0

        // Stack for tracking nested modes
        var modeStack: [CompiledMode] = [top]

        // Process the code character by character with regex matching
        let nsCode = code as NSString

        while index < nsCode.length {
            // Try to find the next match using the mode's matcher
            let remainingCode = nsCode.substring(from: index)

            if let match = try findNextMatch(
                in: remainingCode,
                for: top,
                fullCode: code,
                offset: index
            ) {
                let beforeMatch = nsCode.substring(with: NSRange(location: index, length: match.index - index))

                // Process text before the match
                if !beforeMatch.isEmpty {
                    modeBuffer += beforeMatch
                }

                // Process keywords in buffer before switching modes
                if !modeBuffer.isEmpty && top.keywords != nil {
                    relevance += emitter.processKeywords(
                        modeBuffer,
                        keywords: top.keywords,
                        keywordPattern: top.keywordPatternRe
                    )
                } else if !modeBuffer.isEmpty {
                    emitter.addText(modeBuffer)
                }
                modeBuffer = ""

                // Handle the match based on type
                switch match.type {
                case .begin:
                    // Check callback
                    if let onBegin = match.rule.onBegin {
                        let response = Response(mode: match.rule)
                        onBegin(match.matchData, response)
                        if response.isMatchIgnored {
                            modeBuffer += match.matchData.fullMatch
                            index = match.index + match.matchData.fullMatch.count
                            continue
                        }
                    }

                    // Start new mode
                    let newMode = match.rule

                    // Emit begin scope if configured
                    if let beginScope = newMode.beginScope, !newMode.excludeBegin {
                        if case .single(let scope) = beginScope {
                            emitter.startScope(scope)
                            emitter.addText(match.matchData.fullMatch)
                            emitter.endScope()
                        } else if case .multi(let scopes) = beginScope {
                            emitMultiClass(match.matchData, scopes: scopes, emitter: emitter)
                        }
                    } else if let scope = newMode.scope, !newMode.excludeBegin {
                        emitter.startScope(scope)
                        if !newMode.returnBegin {
                            emitter.addText(match.matchData.fullMatch)
                        }
                    }

                    // Push mode onto stack
                    top = newMode
                    modeStack.append(top)

                    relevance += newMode.relevance

                case .end:
                    // Check if we can end this mode
                    guard modeStack.count > 1 else {
                        // Can't end root mode
                        modeBuffer += match.matchData.fullMatch
                        index = match.index + match.matchData.fullMatch.count
                        continue
                    }

                    // Check callback
                    if let onEnd = top.onEnd {
                        let response = Response(mode: top)
                        onEnd(match.matchData, response)
                        if response.isMatchIgnored {
                            modeBuffer += match.matchData.fullMatch
                            index = match.index + match.matchData.fullMatch.count
                            continue
                        }
                    }

                    // Emit end scope if configured
                    if top.scope != nil {
                        emitter.endScope()
                    }

                    if !top.excludeEnd {
                        if let endScope = top.endScope {
                            if case .single(let scope) = endScope {
                                emitter.startScope(scope)
                                emitter.addText(match.matchData.fullMatch)
                                emitter.endScope()
                            } else if case .multi(let scopes) = endScope {
                                emitMultiClass(match.matchData, scopes: scopes, emitter: emitter)
                            }
                        } else {
                            emitter.addText(match.matchData.fullMatch)
                        }
                    }

                    // Pop mode from stack
                    modeStack.removeLast()
                    top = modeStack.last ?? language

                    // Check for endsParent
                    if match.rule.endsParent {
                        // Also end the parent
                        while modeStack.count > 1 && top.endsParent {
                            modeStack.removeLast()
                            top = modeStack.last ?? language
                        }
                    }

                    // Check for starts
                    if let starts = match.rule.starts {
                        top = starts
                        modeStack.append(top)
                    }

                case .illegal:
                    if !ignoreIllegals {
                        throw HighlightError.illegalMatch(
                            match.matchData.fullMatch,
                            match.index
                        )
                    }
                    // In ignore mode, just add the character
                    modeBuffer.append(Character(nsCode.substring(with: NSRange(location: index, length: 1))))
                    index += 1
                    continue
                }

                index = match.index + match.matchData.fullMatch.count

            } else {
                // No match - add remaining text to buffer
                modeBuffer += nsCode.substring(from: index)
                break
            }
        }

        // Process remaining buffer
        if !modeBuffer.isEmpty {
            if top.keywords != nil {
                relevance += emitter.processKeywords(
                    modeBuffer,
                    keywords: top.keywords,
                    keywordPattern: top.keywordPatternRe
                )
            } else {
                emitter.addText(modeBuffer)
            }
        }

        // Close any remaining open scopes
        while modeStack.count > 1 {
            if modeStack.last?.scope != nil {
                emitter.endScope()
            }
            modeStack.removeLast()
        }

        var result = HighlightResult(
            value: emitter.toHTML(),
            language: language.name,
            relevance: relevance,
            illegal: false,
            code: code
        )
        result.emitter = emitter
        return result
    }

    /// Find the next match in the code for the current mode
    private func findNextMatch(
        in code: String,
        for mode: CompiledMode,
        fullCode: String,
        offset: Int
    ) throws -> ParseMatch? {
        guard let matcher = mode.matcher else { return nil }

        matcher.considerAll()

        guard let result = try matcher.exec(code, from: 0) else {
            return nil
        }

        return ParseMatch(
            index: offset + result.match.index,
            type: result.type,
            rule: result.rule,
            matchData: result.match
        )
    }

    /// Emit multi-class scopes for complex matches
    private func emitMultiClass(
        _ match: MatchData,
        scopes: [Int: String],
        emitter: TokenTreeEmitter
    ) {
        // For each group in the match, emit with its scope
        for (groupIndex, scope) in scopes.sorted(by: { $0.key < $1.key }) {
            if let groupText = match.group(groupIndex), !groupText.isEmpty {
                emitter.startScope(scope)
                emitter.addText(groupText)
                emitter.endScope()
            }
        }
    }

    // MARK: - Sub-language Handling

    /// Process a sub-language embedded in the current code
    private func processSubLanguage(
        code: String,
        subLanguage: SubLanguage,
        emitter: TokenTreeEmitter
    ) -> Double {
        switch subLanguage {
        case .single(let name):
            if getLanguage(name) != nil {
                let result = highlight(code, language: name, ignoreIllegals: true)
                if let subEmitter = result.emitter {
                    emitter.addSubLanguage(subEmitter, language: name)
                }
                return result.relevance
            }

        case .multiple(let names):
            let autoResult = highlightAuto(code, languageSubset: names)
            if let lang = autoResult.result.language, let subEmitter = autoResult.result.emitter {
                emitter.addSubLanguage(subEmitter, language: lang)
            }
            return autoResult.result.relevance

        case .auto:
            let autoResult = highlightAuto(code, languageSubset: nil)
            if let lang = autoResult.result.language, let subEmitter = autoResult.result.emitter {
                emitter.addSubLanguage(subEmitter, language: lang)
            }
            return autoResult.result.relevance
        }

        // Fallback - just add as text
        emitter.addText(code)
        return 0
    }
}

// MARK: - Parse Match

/// Represents a match found during parsing
private struct ParseMatch {
    let index: Int
    let type: MatchType
    let rule: CompiledMode
    let matchData: MatchData
}

// MARK: - Regex Helper

/// Helper class providing regex utilities to language definitions
/// This mirrors the `hljs.regex` object in JavaScript
public class RegexHelper {

    /// Concatenate patterns
    public func concat(_ patterns: String...) -> String {
        return RegexHelpers.concat(patterns)
    }

    /// Create alternation
    public func either(_ patterns: String...) -> String {
        return RegexHelpers.either(patterns)
    }

    /// Create lookahead
    public func lookahead(_ pattern: String) -> String {
        return RegexHelpers.lookahead(pattern)
    }

    /// Make optional
    public func optional(_ pattern: String) -> String {
        return RegexHelpers.optional(pattern)
    }

    /// Make repeatable
    public func anyNumberOfTimes(_ pattern: String) -> String {
        return RegexHelpers.anyNumberOfTimes(pattern)
    }
}

// MARK: - Convenience Extensions

extension HighlightJS {
    /// Quick highlight with auto-detection
    public func highlight(_ code: String) -> HighlightResult {
        return highlightAuto(code).result
    }

    /// Get highlighted HTML with wrapping
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

    /// Register all built-in languages
    /// This should be called after importing language definitions
    public func registerAllLanguages() {
        // Languages will be registered individually via language modules
    }
}
