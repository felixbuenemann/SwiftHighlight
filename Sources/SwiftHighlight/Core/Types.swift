import Foundation

// MARK: - Highlight Result

/// The result of syntax highlighting
public struct HighlightResult {
    /// The highlighted HTML string with spans for scopes
    public var value: String

    /// The language that was used for highlighting
    public var language: String?

    /// Relevance score (higher = more confident match)
    public var relevance: Double

    /// Whether illegal patterns were encountered
    public var illegal: Bool

    /// The original code that was highlighted
    public var code: String?

    /// The token tree for attributed string rendering
    public var tokenTree: TokenNode?

    public init(
        value: String = "",
        language: String? = nil,
        relevance: Double = 0,
        illegal: Bool = false,
        code: String? = nil,
        tokenTree: TokenNode? = nil
    ) {
        self.value = value
        self.language = language
        self.relevance = relevance
        self.illegal = illegal
        self.code = code
        self.tokenTree = tokenTree
    }
}

/// Internal state carried between highlight passes (sub-language embedding, continuations).
/// Not exposed in the public API.
internal struct HighlightInternalState {
    var top: CompiledMode?
    var emitter: TokenTreeEmitter?
}

/// Result of auto-detection highlighting
public struct AutoHighlightResult {
    /// The main result
    public var result: HighlightResult

    /// The second-best language match
    public var secondBest: HighlightResult?

    /// Convenience: the highlighted value
    public var value: String { result.value }

    /// Convenience: the detected language
    public var language: String? { result.language }

    /// Convenience: the relevance score
    public var relevance: Double { result.relevance }

    /// Convenience: the token tree for attributed string rendering
    public var tokenTree: TokenNode? { result.tokenTree }
}

// MARK: - Options

/// Configuration options for the highlighter
public struct HighlightOptions {
    /// CSS class prefix for highlights (default: "hljs-")
    public var classPrefix: String

    /// Languages to use for auto-detection (nil = all registered)
    public var languageSubset: [String]?

    /// Whether to wrap the output in a code tag with language class
    public var codeTag: Bool

    /// Whether to ignore illegal matches
    public var ignoreIllegals: Bool

    /// Whether to throw exceptions on errors (false = safe mode)
    public var throwOnError: Bool

    public init(
        classPrefix: String = "hljs-",
        languageSubset: [String]? = nil,
        codeTag: Bool = false,
        ignoreIllegals: Bool = true,
        throwOnError: Bool = false
    ) {
        self.classPrefix = classPrefix
        self.languageSubset = languageSubset
        self.codeTag = codeTag
        self.ignoreIllegals = ignoreIllegals
        self.throwOnError = throwOnError
    }
}

// MARK: - Scope

/// Represents a CSS scope/class for highlighting
public enum Scope: Hashable, Sendable {
    case single(String)
    case multi([Int: String])

    public var isMulti: Bool {
        if case .multi = self { return true }
        return false
    }

    public var singleValue: String? {
        if case .single(let value) = self { return value }
        return nil
    }

    public var multiValue: [Int: String]? {
        if case .multi(let value) = self { return value }
        return nil
    }
}

// MARK: - Keyword Types

/// Compiled keyword entry with scope and relevance
public struct KeywordEntry {
    public let scope: String
    public let relevance: Double

    public init(scope: String, relevance: Double) {
        self.scope = scope
        self.relevance = relevance
    }
}

/// Dictionary of compiled keywords
public typealias CompiledKeywords = [String: KeywordEntry]

/// Keywords definition can be a simple string, array, or dictionary
public enum Keywords {
    case none
    case simple(String)
    case array([String])
    case grouped([String: Any])  // Can be String, [String], or nested

    public var isEmpty: Bool {
        switch self {
        case .none: return true
        case .simple(let s): return s.isEmpty
        case .array(let arr): return arr.isEmpty
        case .grouped(let dict): return dict.isEmpty
        }
    }
}

// MARK: - Mode Definition

/// A mode (grammar rule) definition before compilation
public class Mode {
    // Matching patterns
    public var begin: PatternLike?
    public var end: PatternLike?
    public var match: PatternLike?
    public var beforeMatch: PatternLike?

    // Scopes
    public var scope: Scope?
    public var beginScope: Scope?
    public var endScope: Scope?
    public var className: String?  // Deprecated, use scope

    // Content
    public var contains: [ModeReference]?
    public var keywords: Keywords?
    public var beginKeywords: String?
    public var subLanguage: SubLanguage?
    public var illegal: PatternLike?

    // Control flags
    public var endsParent: Bool?
    public var endsWithParent: Bool?
    public var excludeBegin: Bool?
    public var excludeEnd: Bool?
    public var returnBegin: Bool?
    public var returnEnd: Bool?
    public var skip: Bool?

    // Variants
    public var variants: [Mode]?

    // Metadata
    public var relevance: Double?

    // Callbacks
    public var beforeBegin: ((MatchData, Response) -> Void)?
    public var onBegin: ((MatchData, Response) -> Void)?
    public var onEnd: ((MatchData, Response) -> Void)?

    // References
    public var starts: Mode?

    // For internal use
    public var parent: Mode?
    internal var cachedVariants: [Mode]?
    /// Internal: emit set for multi-class beginScope (computed during applyExtensions)
    internal var _beginScopeEmit: Set<Int>?
    /// Internal: emit set for multi-class endScope (computed during applyExtensions)
    internal var _endScopeEmit: Set<Int>?

    public init() {}

    /// Create a copy of this mode
    public func copy() -> Mode {
        let mode = Mode()
        mode.begin = begin
        mode.end = end
        mode.match = match
        mode.beforeMatch = beforeMatch
        mode.scope = scope
        mode.beginScope = beginScope
        mode.endScope = endScope
        mode.className = className
        mode.contains = contains
        mode.keywords = keywords
        mode.beginKeywords = beginKeywords
        mode.subLanguage = subLanguage
        mode.illegal = illegal
        mode.endsParent = endsParent
        mode.endsWithParent = endsWithParent
        mode.excludeBegin = excludeBegin
        mode.excludeEnd = excludeEnd
        mode.returnBegin = returnBegin
        mode.returnEnd = returnEnd
        mode.skip = skip
        mode.variants = variants
        mode.relevance = relevance
        mode.beforeBegin = beforeBegin
        mode.onBegin = onBegin
        mode.onEnd = onEnd
        mode.starts = starts
        mode.parent = parent
        mode.cachedVariants = cachedVariants
        mode._beginScopeEmit = _beginScopeEmit
        mode._endScopeEmit = _endScopeEmit
        return mode
    }
}

/// Reference to a mode (can be self-reference or actual mode)
public enum ModeReference {
    case selfReference
    case mode(Mode)
}

/// Sub-language specification
public enum SubLanguage {
    case single(String)
    case multiple([String])
    case auto
}

// MARK: - Compiled Mode

/// A fully compiled mode ready for parsing
public class CompiledMode {
    // Original mode data
    public var begin: NSRegularExpression?
    public var end: NSRegularExpression?

    // Compiled patterns
    public var beginRe: NSRegularExpression?
    public var endRe: NSRegularExpression?
    public var illegalRe: NSRegularExpression?
    public var terminatorEnd: String?

    // Scopes
    public var scope: String?
    public var beginScope: Scope?
    public var endScope: Scope?

    // Content
    public var contains: [CompiledMode]?
    public var keywords: CompiledKeywords?
    public var keywordPatternRe: NSRegularExpression?
    public var subLanguage: SubLanguage?

    /// Top-level group indices to emit for multi-class beginScope patterns.
    /// When set, emitMultiClass uses this to determine which groups are
    /// top-level (vs inner sub-groups that should not be emitted separately).
    public var beginScopeEmit: Set<Int>?
    public var endScopeEmit: Set<Int>?

    // Control flags
    public var endsParent: Bool = false
    public var endsWithParent: Bool = false
    public var excludeBegin: Bool = false
    public var excludeEnd: Bool = false
    public var returnBegin: Bool = false
    public var returnEnd: Bool = false
    public var skip: Bool = false

    // Callbacks
    public var beforeBegin: ((MatchData, Response) -> Void)?
    public var onBegin: ((MatchData, Response) -> Void)?
    public var onEnd: ((MatchData, Response) -> Void)?

    // References
    public var starts: CompiledMode?
    public var parent: CompiledMode?

    // The matcher for this mode
    public var matcher: ResumableMultiRegex?

    // Metadata
    public var relevance: Double = 1
    public var depth: Int = 0
    public var data: NSMutableDictionary = [:]

    // Language info (only for top-level)
    public var name: String?
    public var caseInsensitive: Bool = false
    public var isCompiled: Bool = false

    public init() {}
}

// MARK: - Pattern Types

/// A pattern can be a string or regex
public enum PatternLike {
    case string(String)
    case regex(String)
    case regexWithFlags(pattern: String, flags: String)
    case array([PatternLike])

    public var asString: String {
        switch self {
        case .string(let s): return NSRegularExpression.escapedPattern(for: s)
        case .regex(let r): return r
        case .regexWithFlags(let p, _): return p
        case .array(let arr): return arr.map { "(" + $0.asString + ")" }.joined()
        }
    }
}

// MARK: - Match Data

/// Data about a regex match
public struct MatchData {
    public let match: NSTextCheckingResult
    public var text: String
    public let index: Int
    public let input: String
    public var rule: Int = 0
    public var type: MatchType = .begin
    /// Offset for group indices when match comes from a combined regex (MultiRegex).
    /// group(n) actually reads match.range(at: n + groupOffset).
    public var groupOffset: Int = 0

    public init(match: NSTextCheckingResult, text: String, index: Int, input: String) {
        self.match = match
        self.text = text
        self.index = index
        self.input = input
    }

    /// Get the full match string
    public var fullMatch: String {
        return group(0) ?? text
    }

    /// Get a capture group by index (adjusted by groupOffset for combined regexes)
    public func group(_ index: Int) -> String? {
        let adjusted = index + groupOffset
        guard adjusted < match.numberOfRanges else { return nil }
        let range = match.range(at: adjusted)
        guard range.location != NSNotFound else { return nil }
        let start = input.index(input.startIndex, offsetBy: range.location)
        let end = input.index(start, offsetBy: range.length)
        return String(input[start..<end])
    }
}

/// Type of match
public enum MatchType {
    case begin
    case end
    case illegal
}

// MARK: - Response

/// Response object for match callbacks
public class Response {
    public var data: NSMutableDictionary
    public var isMatchIgnored: Bool = false

    public init(mode: CompiledMode? = nil) {
        self.data = (mode?.data.mutableCopy() as? NSMutableDictionary) ?? [:]
    }

    /// Mark this match to be ignored
    public func ignoreMatch() {
        isMatchIgnored = true
    }
}

// MARK: - Language Definition

/// A language definition function type
public typealias LanguageDefinition = (HighlightJS) -> Language
public typealias CompilerExtension = (_ mode: Mode, _ parent: Mode?) -> Void

/// A language definition
public class Language: Mode {
    public var name: String = ""
    public var aliases: [String] = []
    public var caseInsensitive: Bool = false
    public var disableAutodetect: Bool = false
    public var supersetOf: String?
    public var classNameAliases: [String: String]?
    public var unicodeRegex: Bool = false
    public var compilerExtensions: [CompilerExtension] = []

    public override init() {
        super.init()
    }

    /// Create a copy of this language
    public override func copy() -> Language {
        let lang = Language()
        // Copy Mode properties
        lang.begin = begin
        lang.end = end
        lang.match = match
        lang.beforeMatch = beforeMatch
        lang.scope = scope
        lang.beginScope = beginScope
        lang.endScope = endScope
        lang.className = className
        lang.contains = contains
        lang.keywords = keywords
        lang.beginKeywords = beginKeywords
        lang.subLanguage = subLanguage
        lang.illegal = illegal
        lang.endsParent = endsParent
        lang.endsWithParent = endsWithParent
        lang.excludeBegin = excludeBegin
        lang.excludeEnd = excludeEnd
        lang.returnBegin = returnBegin
        lang.returnEnd = returnEnd
        lang.skip = skip
        lang.variants = variants
        lang.relevance = relevance
        lang.beforeBegin = beforeBegin
        lang.onBegin = onBegin
        lang.onEnd = onEnd
        lang.starts = starts
        lang.parent = parent
        lang.cachedVariants = cachedVariants
        lang._beginScopeEmit = _beginScopeEmit
        lang._endScopeEmit = _endScopeEmit
        // Copy Language properties
        lang.name = name
        lang.aliases = aliases
        lang.caseInsensitive = caseInsensitive
        lang.disableAutodetect = disableAutodetect
        lang.supersetOf = supersetOf
        lang.classNameAliases = classNameAliases
        lang.unicodeRegex = unicodeRegex
        lang.compilerExtensions = compilerExtensions
        return lang
    }
}

// MARK: - Compiled Language

/// A fully compiled language ready for highlighting
public class CompiledLanguage: CompiledMode {
    public var aliases: [String] = []
    public var disableAutodetect: Bool = false
    public var classNameAliases: [String: String]?
    public var rawDefinition: Language?

    public override init() {
        super.init()
    }
}

// MARK: - Sendable Conformances

extension HighlightResult: Sendable {}
extension AutoHighlightResult: Sendable {}
extension HighlightOptions: Sendable {}
extension KeywordEntry: Sendable {}
extension MatchType: Sendable {}
extension CompiledMode: @unchecked Sendable {}
extension CompiledLanguage: @unchecked Sendable {}

// MARK: - Errors

/// Errors that can occur during highlighting
public enum HighlightError: Error, LocalizedError {
    case unknownLanguage(String)
    case illegalMatch(String, Int)
    case regexCompilationError(String, Error)
    case htmlInjection(String)

    public var errorDescription: String? {
        switch self {
        case .unknownLanguage(let name):
            return "Unknown language: \(name)"
        case .illegalMatch(let text, let position):
            return "Illegal match '\(text)' at position \(position)"
        case .regexCompilationError(let pattern, let error):
            return "Failed to compile regex '\(pattern)': \(error.localizedDescription)"
        case .htmlInjection(let text):
            return "HTML injection detected: \(text)"
        }
    }
}
