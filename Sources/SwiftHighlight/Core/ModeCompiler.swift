import Foundation

// MARK: - Mode Compiler

/// Compiles language definitions into optimized structures ready for parsing.
public final class ModeCompiler {

    private let language: Language
    private let caseInsensitive: Bool
    private let unicodeRegex: Bool

    private var compiledModeCache: [ObjectIdentifier: CompiledMode] = [:]
    private var extensionApplied: Set<ObjectIdentifier> = []

    public init(language: Language) {
        self.language = language
        self.caseInsensitive = language.caseInsensitive
        self.unicodeRegex = language.unicodeRegex
    }

    // MARK: Public API

    public func compile() throws -> CompiledLanguage {
        if containsSelfReferenceAtTop(language) {
            throw HighlightError.regexCompilationError(
                "contains self at top level",
                NSError(domain: "SwiftHighlight", code: 1)
            )
        }

        if language.classNameAliases == nil {
            language.classNameAliases = [:]
        }

        let compiledRoot = try compileMode(language, parent: nil, parentRaw: nil)
        guard let compiledLanguage = compiledRoot as? CompiledLanguage else {
            throw HighlightError.regexCompilationError(
                "language root",
                NSError(domain: "SwiftHighlight", code: 2)
            )
        }

        compiledLanguage.name = language.name
        compiledLanguage.aliases = language.aliases
        compiledLanguage.disableAutodetect = language.disableAutodetect
        compiledLanguage.classNameAliases = language.classNameAliases
        compiledLanguage.rawDefinition = language
        compiledLanguage.caseInsensitive = language.caseInsensitive
        compiledLanguage.isCompiled = true

        return compiledLanguage
    }

    // MARK: Compile Mode

    private func compileMode(
        _ mode: Mode,
        parent: CompiledMode?,
        parentRaw: Mode?
    ) throws -> CompiledMode {
        let modeID = ObjectIdentifier(mode)
        if let cached = compiledModeCache[modeID] {
            return cached
        }

        applyExtensionsIfNeeded(mode, parent: parentRaw)

        let compiled: CompiledMode
        if mode is Language {
            compiled = CompiledLanguage()
        } else {
            compiled = CompiledMode()
        }
        compiledModeCache[modeID] = compiled

        // Keyword pattern defaults to /\w+/ unless overridden by `$pattern`.
        var keywordPattern = "\\w+"
        if case .grouped(let grouped)? = mode.keywords,
           let pattern = grouped["$pattern"] as? String {
            keywordPattern = pattern
            var normalized = grouped
            normalized.removeValue(forKey: "$pattern")
            mode.keywords = normalized.isEmpty ? Keywords.none : .grouped(normalized)
        }

        if let keywords = mode.keywords, !keywords.isEmpty {
            compiled.keywords = KeywordCompiler.compile(
                keywords,
                caseInsensitive: caseInsensitive
            )
        }
        compiled.keywordPatternRe = try RegexHelpers.compile(
            keywordPattern,
            caseInsensitive: caseInsensitive,
            unicodeRegex: unicodeRegex
        )

        if parent != nil {
            if mode.begin == nil, !isEmptyPlaceholder(mode) {
                mode.begin = .regex("\\B|\\b")
            }
            if let begin = mode.begin {
                compiled.beginRe = try compilePattern(begin)
            }

            if mode.end == nil && mode.endsWithParent != true && mode.begin != nil {
                mode.end = .regex("\\B|\\b")
            }
            if let end = mode.end {
                compiled.endRe = try compilePattern(end)
                compiled.terminatorEnd = end.asString
            }
            if mode.endsWithParent == true, let parentTerminator = parent?.terminatorEnd {
                let local = compiled.terminatorEnd ?? ""
                compiled.terminatorEnd = local.isEmpty ? parentTerminator : "\(local)|\(parentTerminator)"
            }
        }

        if let illegal = mode.illegal {
            compiled.illegalRe = try compilePattern(illegal)
        }

        if let scope = mode.scope, case .single(let value) = scope {
            compiled.scope = value
        }
        compiled.beginScope = mode.beginScope
        compiled.endScope = mode.endScope
        compiled.beginScopeEmit = mode._beginScopeEmit
        compiled.endScopeEmit = mode._endScopeEmit

        compiled.endsParent = mode.endsParent ?? false
        compiled.endsWithParent = mode.endsWithParent ?? false
        compiled.excludeBegin = mode.excludeBegin ?? false
        compiled.excludeEnd = mode.excludeEnd ?? false
        compiled.returnBegin = mode.returnBegin ?? false
        compiled.returnEnd = mode.returnEnd ?? false
        compiled.skip = mode.skip ?? false
        compiled.relevance = mode.relevance ?? 1

        compiled.beforeBegin = mode.beforeBegin
        compiled.onBegin = mode.onBegin
        compiled.onEnd = mode.onEnd

        let rawContains = mode.contains ?? []
        var compiledContains: [CompiledMode] = []
        for ref in rawContains {
            let targetMode: Mode
            switch ref {
            case .selfReference:
                targetMode = mode
            case .mode(let child):
                targetMode = child
            }

            for expanded in expandOrCloneMode(targetMode) {
                if isEmptyPlaceholder(expanded) { continue }
                let compiledChild = try compileMode(expanded, parent: compiled, parentRaw: mode)
                compiledContains.append(compiledChild)
            }
        }
        compiled.contains = compiledContains

        if let starts = mode.starts {
            compiled.starts = try compileMode(starts, parent: parent, parentRaw: parentRaw)
        }

        try buildModeRegex(compiled)
        return compiled
    }

    // MARK: Compiler Extensions

    private func applyExtensionsIfNeeded(_ mode: Mode, parent: Mode?) {
        let id = ObjectIdentifier(mode)
        if extensionApplied.contains(id) { return }
        extensionApplied.insert(id)

        scopeClassName(mode)
        compileMatch(mode)
        multiClass(mode)
        beforeMatch(mode)

        for ext in language.compilerExtensions {
            ext(mode, parent)
        }

        beginKeywords(mode, parent: parent)
        compileIllegal(mode)
        compileRelevance(mode)
    }

    private func scopeClassName(_ mode: Mode) {
        if let className = mode.className {
            mode.scope = .single(className)
            mode.className = nil
        }
    }

    private func compileMatch(_ mode: Mode) {
        guard let match = mode.match else { return }
        mode.begin = match
        mode.match = nil
    }

    private func multiClass(_ mode: Mode) {
        // scope sugar: `scope: {}` behaves like `beginScope: {}`
        if let scope = mode.scope, case .multi = scope {
            mode.beginScope = scope
            mode.scope = nil
        }

        if let beginScope = mode.beginScope, case .single(let wrap) = beginScope {
            mode.beginScope = .multi([0: wrap])
            mode._beginScopeEmit = [0]
        }
        if let endScope = mode.endScope, case .single(let wrap) = endScope {
            mode.endScope = .multi([0: wrap])
            mode._endScopeEmit = [0]
        }

        beginMultiClass(mode)
        endMultiClass(mode)
    }

    private func beginMultiClass(_ mode: Mode) {
        guard case .array(let parts)? = mode.begin else { return }
        guard let scope = mode.beginScope, case .multi(let labels) = scope else { return }

        if mode.skip == true || mode.excludeBegin == true || mode.returnBegin == true {
            return
        }

        let (remapped, emit) = remapScopeNames(regexes: parts, scopeNames: labels)
        mode.beginScope = .multi(remapped)
        mode._beginScopeEmit = emit
        mode.begin = .regex(RegexHelpers.rewriteBackreferences(parts.map { $0.asString }, joinWith: ""))
    }

    private func endMultiClass(_ mode: Mode) {
        guard case .array(let parts)? = mode.end else { return }
        guard let scope = mode.endScope, case .multi(let labels) = scope else { return }

        if mode.skip == true || mode.excludeEnd == true || mode.returnEnd == true {
            return
        }

        let (remapped, emit) = remapScopeNames(regexes: parts, scopeNames: labels)
        mode.endScope = .multi(remapped)
        mode._endScopeEmit = emit
        mode.end = .regex(RegexHelpers.rewriteBackreferences(parts.map { $0.asString }, joinWith: ""))
    }

    private func remapScopeNames(
        regexes: [PatternLike],
        scopeNames: [Int: String]
    ) -> ([Int: String], Set<Int>) {
        var offset = 0
        var remapped: [Int: String] = [:]
        var emit: Set<Int> = []

        for i in 1...regexes.count {
            let remappedIndex = i + offset
            remapped[remappedIndex] = scopeNames[i]
            emit.insert(remappedIndex)
            offset += RegexHelpers.countMatchGroups(regexes[i - 1].asString)
        }

        return (remapped, emit)
    }

    private func beforeMatch(_ mode: Mode) {
        guard let beforeMatch = mode.beforeMatch else { return }
        if mode.starts != nil { return }
        guard let begin = mode.begin else { return }

        let original = mode.copy()
        resetMode(mode)

        mode.keywords = original.keywords
        mode.begin = .regex(
            RegexHelpers.concat(
                beforeMatch.asString,
                RegexHelpers.lookahead(begin.asString)
            )
        )

        let wrapped = original.copy()
        wrapped.beforeMatch = nil
        wrapped.endsParent = true

        let starts = Mode()
        starts.relevance = 0
        starts.contains = [.mode(wrapped)]

        mode.starts = starts
        mode.relevance = 0
    }

    private func beginKeywords(_ mode: Mode, parent: Mode?) {
        guard parent != nil else { return }
        guard let beginKeywords = mode.beginKeywords, !beginKeywords.isEmpty else { return }

        let alternatives = beginKeywords
            .split(separator: " ")
            .map { NSRegularExpression.escapedPattern(for: String($0)) }
            .joined(separator: "|")

        mode.begin = .regex("\\b(\(alternatives))(?!\\.)(?=\\b|\\s)")
        mode.beforeBegin = { match, response in
            guard match.index > 0 else { return }
            let ns = match.input as NSString
            let previous = ns.substring(with: NSRange(location: match.index - 1, length: 1))
            if previous == "." {
                response.ignoreMatch()
            }
        }
        if mode.keywords == nil {
            mode.keywords = .simple(beginKeywords)
        }
        mode.beginKeywords = nil

        if mode.relevance == nil {
            mode.relevance = 0
        }
    }

    private func compileIllegal(_ mode: Mode) {
        guard case .array(let values)? = mode.illegal else { return }
        mode.illegal = .regex(RegexHelpers.either(values.map { $0.asString }))
    }

    private func compileRelevance(_ mode: Mode) {
        if mode.relevance == nil {
            mode.relevance = 1
        }
    }

    private func resetMode(_ mode: Mode) {
        mode.begin = nil
        mode.end = nil
        mode.match = nil
        mode.beforeMatch = nil
        mode.scope = nil
        mode.beginScope = nil
        mode.endScope = nil
        mode.className = nil
        mode.contains = nil
        mode.keywords = nil
        mode.beginKeywords = nil
        mode.subLanguage = nil
        mode.illegal = nil
        mode.endsParent = nil
        mode.endsWithParent = nil
        mode.excludeBegin = nil
        mode.excludeEnd = nil
        mode.returnBegin = nil
        mode.returnEnd = nil
        mode.skip = nil
        mode.variants = nil
        mode.relevance = nil
        mode.beforeBegin = nil
        mode.onBegin = nil
        mode.onEnd = nil
        mode.starts = nil
        mode.parent = nil
        mode.cachedVariants = nil
        mode._beginScopeEmit = nil
        mode._endScopeEmit = nil
    }

    // MARK: Mode Expansion

    private func dependencyOnParent(_ mode: Mode?) -> Bool {
        guard let mode else { return false }
        return (mode.endsWithParent == true) || dependencyOnParent(mode.starts)
    }

    private func expandOrCloneMode(_ mode: Mode) -> [Mode] {
        if mode.cachedVariants == nil, let variants = mode.variants {
            mode.cachedVariants = variants.map { variant in
                inherit(mode, override: variant, clearVariants: true)
            }
        }

        if let cachedVariants = mode.cachedVariants {
            return cachedVariants
        }

        if dependencyOnParent(mode) {
            let clone = inherit(mode)
            if let starts = mode.starts {
                clone.starts = inherit(starts)
            }
            return [clone]
        }

        return [mode]
    }

    private func inherit(_ mode: Mode, override: Mode? = nil, clearVariants: Bool = false) -> Mode {
        let merged = mode.copy()
        if clearVariants {
            merged.variants = nil
            merged.cachedVariants = nil
        }

        guard let override else { return merged }

        if let begin = override.begin { merged.begin = begin }
        if let end = override.end { merged.end = end }
        if let match = override.match { merged.match = match }
        if let beforeMatch = override.beforeMatch { merged.beforeMatch = beforeMatch }

        if let scope = override.scope { merged.scope = scope }
        if let beginScope = override.beginScope { merged.beginScope = beginScope }
        if let endScope = override.endScope { merged.endScope = endScope }
        if let className = override.className { merged.className = className }

        if let contains = override.contains { merged.contains = contains }
        if let keywords = override.keywords { merged.keywords = keywords }
        if let beginKeywords = override.beginKeywords { merged.beginKeywords = beginKeywords }
        if let subLanguage = override.subLanguage { merged.subLanguage = subLanguage }
        if let illegal = override.illegal { merged.illegal = illegal }

        if let endsParent = override.endsParent { merged.endsParent = endsParent }
        if let endsWithParent = override.endsWithParent { merged.endsWithParent = endsWithParent }
        if let excludeBegin = override.excludeBegin { merged.excludeBegin = excludeBegin }
        if let excludeEnd = override.excludeEnd { merged.excludeEnd = excludeEnd }
        if let returnBegin = override.returnBegin { merged.returnBegin = returnBegin }
        if let returnEnd = override.returnEnd { merged.returnEnd = returnEnd }
        if let skip = override.skip { merged.skip = skip }

        if let variants = override.variants { merged.variants = variants }
        if let relevance = override.relevance { merged.relevance = relevance }

        if let beforeBegin = override.beforeBegin { merged.beforeBegin = beforeBegin }
        if let onBegin = override.onBegin { merged.onBegin = onBegin }
        if let onEnd = override.onEnd { merged.onEnd = onEnd }
        if let starts = override.starts { merged.starts = starts }

        return merged
    }

    private func isEmptyPlaceholder(_ mode: Mode) -> Bool {
        mode.begin == nil
            && mode.end == nil
            && mode.match == nil
            && mode.beforeMatch == nil
            && mode.scope == nil
            && mode.beginScope == nil
            && mode.endScope == nil
            && mode.className == nil
            && (mode.contains == nil || mode.contains?.isEmpty == true)
            && mode.keywords == nil
            && mode.beginKeywords == nil
            && mode.subLanguage == nil
            && mode.illegal == nil
            && mode.endsParent == nil
            && mode.endsWithParent == nil
            && mode.excludeBegin == nil
            && mode.excludeEnd == nil
            && mode.returnBegin == nil
            && mode.returnEnd == nil
            && mode.skip == nil
            && (mode.variants == nil || mode.variants?.isEmpty == true)
            && mode.relevance == nil
            && mode.beforeBegin == nil
            && mode.onBegin == nil
            && mode.onEnd == nil
            && mode.starts == nil
    }

    private func containsSelfReferenceAtTop(_ mode: Mode) -> Bool {
        guard let contains = mode.contains else { return false }
        return contains.contains { ref in
            if case .selfReference = ref { return true }
            return false
        }
    }

    // MARK: Regex Compilation

    private func compilePattern(_ pattern: PatternLike) throws -> NSRegularExpression {
        try RegexHelpers.compile(
            pattern.asString,
            caseInsensitive: caseInsensitive,
            unicodeRegex: unicodeRegex
        )
    }

    private func buildModeRegex(_ mode: CompiledMode) throws {
        let matcher = ResumableMultiRegex(
            caseInsensitive: caseInsensitive,
            unicodeRegex: unicodeRegex
        )

        for term in mode.contains ?? [] {
            guard let begin = term.beginRe?.pattern else { continue }
            matcher.addRule(begin, rule: term, type: .begin)
        }

        if let terminatorEnd = mode.terminatorEnd, !terminatorEnd.isEmpty {
            matcher.addRule(terminatorEnd, rule: mode, type: .end)
        }

        if let illegal = mode.illegalRe?.pattern {
            matcher.addRule(illegal, rule: mode, type: .illegal)
        }

        mode.matcher = matcher
    }
}

// MARK: - Language Registration Helper

extension Language {
    /// Create a simple language with basic settings.
    public static func simple(
        name: String,
        aliases: [String] = [],
        keywords: Keywords = .none,
        contains: [Mode] = []
    ) -> Language {
        let lang = Language()
        lang.name = name
        lang.aliases = aliases
        lang.keywords = keywords
        lang.contains = contains.map { .mode($0) }
        return lang
    }
}
