import Foundation

// MARK: - Regex Helper Functions

/// Utility functions for regex operations, mirroring highlight.js regex utilities
public enum RegexHelpers {

    // MARK: - Common Patterns

    public static let IDENT_RE = "[a-zA-Z]\\w*"
    public static let UNDERSCORE_IDENT_RE = "[a-zA-Z_]\\w*"
    public static let NUMBER_RE = "\\b\\d+(\\.\\d+)?"
    public static let C_NUMBER_RE = "(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)"
    public static let BINARY_NUMBER_RE = "\\b(0b[01]+)"
    public static let RE_STARTERS_RE = "!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|-|-=|/=|/|:|;|<<|<<=|<=|<|===|==|=|>>>=|>>=|>=|>>>|>>|>|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~"

    // MARK: - Source Extraction

    public static func source(_ pattern: PatternLike) -> String {
        pattern.asString
    }

    public static func source(_ pattern: String) -> String {
        pattern
    }

    // MARK: - Pattern Combination

    public static func concat(_ patterns: PatternLike...) -> String {
        patterns.map { source($0) }.joined()
    }

    public static func concat(_ patterns: String...) -> String {
        patterns.joined()
    }

    public static func concat(_ patterns: [String]) -> String {
        patterns.joined()
    }

    public static func either(_ patterns: PatternLike...) -> String {
        "(?:" + patterns.map { source($0) }.joined(separator: "|") + ")"
    }

    public static func either(_ patterns: [String]) -> String {
        "(?:" + patterns.joined(separator: "|") + ")"
    }

    public static func lookahead(_ pattern: PatternLike) -> String {
        "(?=" + source(pattern) + ")"
    }

    public static func lookahead(_ pattern: String) -> String {
        "(?=" + pattern + ")"
    }

    public static func negativeLookahead(_ pattern: String) -> String {
        "(?!" + pattern + ")"
    }

    public static func optional(_ pattern: PatternLike) -> String {
        "(?:" + source(pattern) + ")?"
    }

    public static func optional(_ pattern: String) -> String {
        "(?:" + pattern + ")?"
    }

    public static func anyNumberOfTimes(_ pattern: PatternLike) -> String {
        "(?:" + source(pattern) + ")*"
    }

    public static func anyNumberOfTimes(_ pattern: String) -> String {
        "(?:" + pattern + ")*"
    }

    // MARK: - Group Counting

    /// Count capture groups with the same trick as highlight.js.
    public static func countMatchGroups(_ pattern: String) -> Int {
        do {
            let regex = try NSRegularExpression(pattern: pattern + "|", options: [])
            let range = NSRange(location: 0, length: 0)
            if let match = regex.firstMatch(in: "", options: [], range: range) {
                return max(0, match.numberOfRanges - 1)
            }
        } catch {
            return 0
        }
        return 0
    }

    // MARK: - Backreference Rewriting

    private static let backrefRegex: NSRegularExpression = {
        // Mirrors highlight.js BACKREF_RE
        // [character class] | ( or (? | \\1+ | escaped char
        let pattern = "\\[(?:[^\\\\\\]]|\\\\.)*\\]|\\(\\??|\\\\([1-9][0-9]*)|\\\\."
        // Never fatal in practice; keep deterministic fallback.
        return (try? NSRegularExpression(pattern: pattern, options: []))
            ?? (try! NSRegularExpression(pattern: "\\\\.", options: []))
    }()

    /// Rewrites backreferences when combining regexes (highlight.js `_rewriteBackreferences`).
    public static func rewriteBackreferences(_ patterns: [String], joinWith: String = "|") -> String {
        var numCaptures = 0
        var rewritten: [String] = []

        for pattern in patterns {
            numCaptures += 1
            let offset = numCaptures
            var remaining = pattern
            var out = ""

            while !remaining.isEmpty {
                let ns = remaining as NSString
                let searchRange = NSRange(location: 0, length: ns.length)
                guard let match = backrefRegex.firstMatch(in: remaining, options: [], range: searchRange) else {
                    out += remaining
                    break
                }

                if match.range.location > 0 {
                    out += ns.substring(with: NSRange(location: 0, length: match.range.location))
                }

                let token = ns.substring(with: match.range)
                let nextStart = match.range.location + match.range.length
                remaining = ns.substring(from: nextStart)

                let backrefGroup = match.range(at: 1)
                if token.first == "\\", backrefGroup.location != NSNotFound {
                    let backrefValue = ns.substring(with: backrefGroup)
                    if let original = Int(backrefValue) {
                        out += "\\\\" + String(original + offset)
                        continue
                    }
                }

                out += token
                if token == "(" {
                    numCaptures += 1
                }
            }

            rewritten.append("(" + out + ")")
        }

        return rewritten.joined(separator: joinWith)
    }

    // MARK: - Regex Compilation

    public static func compile(
        _ pattern: String,
        caseInsensitive: Bool = false,
        unicodeRegex: Bool = false
    ) throws -> NSRegularExpression {
        var options: NSRegularExpression.Options = [.anchorsMatchLines]
        if caseInsensitive {
            options.insert(.caseInsensitive)
        }
        _ = unicodeRegex // NSRegularExpression is unicode-aware by default.

        do {
            return try NSRegularExpression(pattern: pattern, options: options)
        } catch {
            throw HighlightError.regexCompilationError(pattern, error)
        }
    }

    public static func startsWith(_ regex: NSRegularExpression?, _ string: String, at position: Int = 0) -> Bool {
        guard let regex else { return false }
        guard let match = exec(regex, string, from: position) else { return false }
        return match.index == position
    }

    public static func exec(_ regex: NSRegularExpression, _ string: String, from position: Int = 0) -> MatchData? {
        let nsString = string as NSString
        guard position <= nsString.length else { return nil }
        let range = NSRange(location: position, length: nsString.length - position)

        guard let match = regex.firstMatch(in: string, options: [], range: range) else {
            return nil
        }

        let matchRange = match.range
        let matchText = nsString.substring(with: matchRange)

        return MatchData(
            match: match,
            text: matchText,
            index: matchRange.location,
            input: string
        )
    }

    // MARK: - Pattern Validation

    public static func escape(_ string: String) -> String {
        NSRegularExpression.escapedPattern(for: string)
    }

    public static func isValid(_ pattern: String) -> Bool {
        (try? NSRegularExpression(pattern: pattern, options: [])) != nil
    }
}

// MARK: - Multi-Regex

/// Multi-regex implementation mirroring highlight.js internals.
public final class MultiRegex {
    private var matchIndexes: [Int: MatchMetadata] = [:]
    private var regexes: [String] = []
    private var matchAt = 1
    private var position = 0

    private var matcherRegex: NSRegularExpression?

    public var lastIndex: Int = 0
    private let caseInsensitive: Bool
    private let unicodeRegex: Bool

    public struct MatchMetadata {
        public let rule: Int
        public let type: MatchType
        public let position: Int

        public init(rule: Int, type: MatchType = .begin, position: Int = 0) {
            self.rule = rule
            self.type = type
            self.position = position
        }
    }

    public init(caseInsensitive: Bool = false, unicodeRegex: Bool = false) {
        self.caseInsensitive = caseInsensitive
        self.unicodeRegex = unicodeRegex
    }

    public func addRule(_ pattern: String, metadata: MatchMetadata) {
        let tagged = MatchMetadata(rule: metadata.rule, type: metadata.type, position: position)
        position += 1

        matchIndexes[matchAt] = tagged
        regexes.append(pattern)
        matchAt += RegexHelpers.countMatchGroups(pattern) + 1
        matcherRegex = nil
    }

    public func compile() throws {
        guard !regexes.isEmpty else {
            matcherRegex = nil
            return
        }

        let combined = RegexHelpers.rewriteBackreferences(regexes, joinWith: "|")
        matcherRegex = try RegexHelpers.compile(
            combined,
            caseInsensitive: caseInsensitive,
            unicodeRegex: unicodeRegex
        )
        lastIndex = 0
    }

    public func exec(_ string: String) -> (match: MatchData, metadata: MatchMetadata)? {
        guard let matcherRegex else { return nil }
        guard var matchData = RegexHelpers.exec(matcherRegex, string, from: lastIndex) else {
            return nil
        }

        for groupIndex in 1..<matchData.match.numberOfRanges {
            let range = matchData.match.range(at: groupIndex)
            guard range.location != NSNotFound else { continue }
            guard let metadata = matchIndexes[groupIndex] else { continue }

            matchData.rule = metadata.rule
            matchData.type = metadata.type
            matchData.groupOffset = groupIndex
            if let selected = matchData.group(0) {
                matchData.text = selected
            }
            return (matchData, metadata)
        }

        return nil
    }

    public var isEmpty: Bool {
        regexes.isEmpty
    }
}

extension MultiRegex: @unchecked Sendable {}

// MARK: - Resumable Multi-Regex

/// A multi-regex that can resume scanning at the same source position.
public final class ResumableMultiRegex {
    private var rules: [(pattern: String, metadata: RuleMetadata)] = []
    private var multiRegexCache: [Int: MultiRegex] = [:]
    private var beginRuleCount = 0

    private let caseInsensitive: Bool
    private let unicodeRegex: Bool

    /// Per-scan mutable state, kept external so the regex itself is immutable after construction.
    public struct ScanState {
        public var regexIndex: Int = 0
        public var lastIndex: Int = 0
        public init() {}
    }

    public struct RuleMetadata {
        public let rule: CompiledMode
        public let type: MatchType

        public init(rule: CompiledMode, type: MatchType = .begin) {
            self.rule = rule
            self.type = type
        }
    }

    public struct MatchResult {
        public let match: MatchData
        public let rule: CompiledMode
        public let type: MatchType
        public let ruleIndex: Int
        public let position: Int
    }

    public init(caseInsensitive: Bool = false, unicodeRegex: Bool = false) {
        self.caseInsensitive = caseInsensitive
        self.unicodeRegex = unicodeRegex
    }

    private func getMatcher(from startIndex: Int) throws -> MultiRegex? {
        if let cached = multiRegexCache[startIndex] {
            return cached
        }

        guard startIndex < rules.count else { return nil }

        let matcher = MultiRegex(caseInsensitive: caseInsensitive, unicodeRegex: unicodeRegex)
        for idx in startIndex..<rules.count {
            let (pattern, metadata) = rules[idx]
            matcher.addRule(
                pattern,
                metadata: MultiRegex.MatchMetadata(rule: idx, type: metadata.type)
            )
        }
        try matcher.compile()

        multiRegexCache[startIndex] = matcher
        return matcher
    }

    public func considerAll(_ state: inout ScanState) {
        state.regexIndex = 0
    }

    public func addRule(_ pattern: String, rule: CompiledMode, type: MatchType = .begin) {
        rules.append((pattern, RuleMetadata(rule: rule, type: type)))
        if type == .begin {
            beginRuleCount += 1
        }
        multiRegexCache.removeAll()
    }

    public func exec(_ string: String, from position: Int = 0, state: inout ScanState) throws -> MatchResult? {
        state.lastIndex = position

        guard let matcher = try getMatcher(from: state.regexIndex) else {
            return nil
        }

        matcher.lastIndex = state.lastIndex
        var result = matcher.exec(string)

        if state.regexIndex != 0 {
            if let result, result.match.index == state.lastIndex {
                // Keep resumed match.
            } else {
                guard let fullMatcher = try getMatcher(from: 0) else { return nil }
                let nsString = string as NSString
                fullMatcher.lastIndex = min(state.lastIndex + 1, nsString.length)
                result = fullMatcher.exec(string)
            }
        }

        guard let (matchData, metadata) = result else {
            return nil
        }

        state.regexIndex += metadata.position + 1
        if state.regexIndex == beginRuleCount {
            considerAll(&state)
        }

        guard matchData.rule < rules.count else { return nil }
        let selected = rules[matchData.rule].metadata

        return MatchResult(
            match: matchData,
            rule: selected.rule,
            type: selected.type,
            ruleIndex: matchData.rule,
            position: metadata.position
        )
    }

    public var isEmpty: Bool {
        rules.isEmpty
    }
}

extension ResumableMultiRegex: @unchecked Sendable {}
