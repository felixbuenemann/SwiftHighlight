import Foundation

// MARK: - Mode Compiler

/// Compiles language definitions into optimized structures ready for parsing
public class ModeCompiler {

    private var language: Language
    private let caseInsensitive: Bool
    /// Cache of compiled modes to handle cycles
    private var compiledModeCache: [ObjectIdentifier: CompiledMode] = [:]

    public init(language: Language) {
        self.language = language
        self.caseInsensitive = language.caseInsensitive
    }

    /// Compile the language definition
    public func compile() throws -> CompiledLanguage {
        let compiled = CompiledLanguage()

        // Copy language-level properties
        compiled.name = language.name
        compiled.caseInsensitive = language.caseInsensitive
        compiled.aliases = language.aliases
        compiled.disableAutodetect = language.disableAutodetect
        compiled.classNameAliases = language.classNameAliases
        compiled.rawDefinition = language

        // Apply compiler extensions to the source mode
        var visited = Set<ObjectIdentifier>()
        applyExtensions(to: language, visited: &visited)

        // Compile the root mode
        try compileMode(language, into: compiled, parent: nil, depth: 0)

        compiled.isCompiled = true
        return compiled
    }

    /// Apply pre-compilation extensions with cycle detection
    private func applyExtensions(to mode: Mode, visited: inout Set<ObjectIdentifier>) {
        // Cycle detection: skip if already visited
        let modeId = ObjectIdentifier(mode)
        if visited.contains(modeId) {
            return
        }
        visited.insert(modeId)

        // Extension 1: scopeClassName - migrate className to scope
        if let className = mode.className {
            mode.scope = .single(className)
            mode.className = nil
        }

        // Extension 2: compileMatch - convert match to begin
        if let match = mode.match {
            mode.begin = match
            mode.match = nil
        }

        // Extension 3: beginKeywords - convert to regex pattern
        if let beginKeywords = mode.beginKeywords {
            let keywords = beginKeywords.split(separator: " ").map { String($0) }
            let pattern = "\\b(" + keywords.map { NSRegularExpression.escapedPattern(for: $0) }.joined(separator: "|") + ")(?!\\.)\\b"
            mode.begin = .regex(pattern)

            // Also set up keyword matching for this mode
            if mode.keywords == nil {
                mode.keywords = .simple(beginKeywords)
            }
            mode.beginKeywords = nil
        }

        // Recursively apply to contains
        if let contains = mode.contains {
            for ref in contains {
                if case .mode(let childMode) = ref {
                    applyExtensions(to: childMode, visited: &visited)
                }
            }
        }

        // Apply to variants
        if let variants = mode.variants {
            for variant in variants {
                applyExtensions(to: variant, visited: &visited)
            }
        }

        // Apply to starts
        if let starts = mode.starts {
            applyExtensions(to: starts, visited: &visited)
        }
    }

    /// Compile a mode definition
    private func compileMode(_ mode: Mode, into compiled: CompiledMode, parent: CompiledMode?, depth: Int) throws {
        // Check for cycles - if we've already started compiling this mode, return early
        let modeId = ObjectIdentifier(mode)
        if let cached = compiledModeCache[modeId] {
            // Copy the cached compiled mode's key properties into the target
            compiled.beginRe = cached.beginRe
            compiled.endRe = cached.endRe
            compiled.illegalRe = cached.illegalRe
            compiled.scope = cached.scope
            compiled.keywords = cached.keywords
            compiled.contains = cached.contains
            compiled.terminatorEnd = cached.terminatorEnd
            compiled.subLanguage = cached.subLanguage
            compiled.parent = parent
            compiled.depth = depth
            return
        }

        // Mark this mode as being compiled to detect cycles
        compiledModeCache[modeId] = compiled

        compiled.parent = parent
        compiled.depth = depth

        // Compile begin pattern
        if let begin = mode.begin {
            compiled.beginRe = try compilePattern(begin)
        }

        // Compile end pattern
        if let end = mode.end {
            compiled.endRe = try compilePattern(end)
            // Store terminator end for use in continuation
            compiled.terminatorEnd = end.asString
        } else if mode.endsWithParent == true {
            // Inherit parent's end if endsWithParent
            compiled.endsWithParent = true
            if let parentEnd = parent?.terminatorEnd {
                compiled.terminatorEnd = parentEnd
            }
        }

        // Compile illegal pattern
        if let illegal = mode.illegal {
            compiled.illegalRe = try compilePattern(illegal)
        }

        // Compile scope
        if let scope = mode.scope {
            if case .single(let s) = scope {
                compiled.scope = s
            }
            compiled.beginScope = mode.beginScope ?? scope
            compiled.endScope = mode.endScope
        }

        // Copy control flags
        compiled.endsParent = mode.endsParent ?? false
        compiled.endsWithParent = mode.endsWithParent ?? false
        compiled.excludeBegin = mode.excludeBegin ?? false
        compiled.excludeEnd = mode.excludeEnd ?? false
        compiled.returnBegin = mode.returnBegin ?? false
        compiled.returnEnd = mode.returnEnd ?? false
        compiled.skip = mode.skip ?? false
        compiled.relevance = mode.relevance ?? 1

        // Copy callbacks
        compiled.onBegin = mode.onBegin
        compiled.onEnd = mode.onEnd

        // Compile keywords
        if let keywords = mode.keywords, !keywords.isEmpty {
            compiled.keywords = KeywordCompiler.compile(keywords, caseInsensitive: caseInsensitive)
            compiled.keywordPatternRe = try KeywordCompiler.buildKeywordPatternForMode(
                compiled.keywords!,
                caseInsensitive: caseInsensitive
            )
        }

        // Handle sub-language
        compiled.subLanguage = mode.subLanguage

        // Expand variants if present
        let modesToCompile = expandVariants(mode)

        // Compile contains
        var compiledContains: [CompiledMode] = []
        for modeToCompile in modesToCompile {
            if let contains = modeToCompile.contains {
                for ref in contains {
                    switch ref {
                    case .selfReference:
                        // Self-reference creates a recursive structure
                        compiledContains.append(compiled)
                    case .mode(let childMode):
                        let childCompiled = CompiledMode()
                        try compileMode(childMode, into: childCompiled, parent: compiled, depth: depth + 1)
                        compiledContains.append(childCompiled)
                    }
                }
            }
        }
        compiled.contains = compiledContains.isEmpty ? nil : compiledContains

        // Compile starts
        if let starts = mode.starts {
            let startsCompiled = CompiledMode()
            try compileMode(starts, into: startsCompiled, parent: parent, depth: depth)
            compiled.starts = startsCompiled
        }

        // Build the combined regex matcher for this mode
        try buildModeRegex(compiled)
    }

    /// Expand mode variants into separate modes
    private func expandVariants(_ mode: Mode) -> [Mode] {
        guard let variants = mode.variants, !variants.isEmpty else {
            return [mode]
        }

        var result: [Mode] = []
        for variant in variants {
            // Create a merged mode from parent and variant
            let merged = mode.copy()

            // Apply variant properties
            if let begin = variant.begin { merged.begin = begin }
            if let end = variant.end { merged.end = end }
            if let scope = variant.scope { merged.scope = scope }
            if let keywords = variant.keywords { merged.keywords = keywords }
            if let contains = variant.contains { merged.contains = contains }
            if let relevance = variant.relevance { merged.relevance = relevance }

            merged.variants = nil  // Don't recurse
            result.append(merged)
        }

        return result
    }

    /// Compile a pattern to NSRegularExpression
    private func compilePattern(_ pattern: PatternLike) throws -> NSRegularExpression {
        let patternString = pattern.asString
        return try RegexHelpers.compile(patternString, caseInsensitive: caseInsensitive)
    }

    /// Build the combined regex matcher for a mode
    private func buildModeRegex(_ mode: CompiledMode) throws {
        let matcher = ResumableMultiRegex(caseInsensitive: caseInsensitive)

        // Add begin patterns from all contained modes
        if let contains = mode.contains {
            for contained in contains {
                if let beginRe = contained.beginRe {
                    let pattern = beginRe.pattern
                    matcher.addRule(pattern, rule: contained, type: .begin)
                }
            }
        }

        // Add end pattern if present
        if let endRe = mode.endRe {
            // Create a dummy mode for end matching
            let endMode = CompiledMode()
            endMode.scope = mode.scope
            matcher.addRule(endRe.pattern, rule: endMode, type: .end)
        }

        // Add illegal pattern
        if let illegalRe = mode.illegalRe {
            let illegalMode = CompiledMode()
            matcher.addRule(illegalRe.pattern, rule: illegalMode, type: .illegal)
        }

        mode.matcher = matcher
    }
}

// MARK: - Language Registration Helper

extension Language {
    /// Create a simple language with basic settings
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
