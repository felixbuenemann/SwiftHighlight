import Foundation

// MARK: - Regex Helper Functions

/// Utility functions for regex operations, mirroring highlight.js regex utilities
public enum RegexHelpers {

    // MARK: - Common Patterns

    /// Identifier pattern: starts with letter, followed by word characters
    public static let IDENT_RE = "[a-zA-Z]\\w*"

    /// Identifier with underscore prefix allowed
    public static let UNDERSCORE_IDENT_RE = "[a-zA-Z_]\\w*"

    /// Simple number pattern
    public static let NUMBER_RE = "\\b\\d+(\\.\\d+)?"

    /// C-style number pattern (hex, octal, decimal, float)
    public static let C_NUMBER_RE = "(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)"

    /// Binary number pattern
    public static let BINARY_NUMBER_RE = "\\b(0b[01]+)"

    /// C-style regex mode pattern
    public static let RE_STARTERS_RE = "!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|-|-=|/=|/|:|;|<<|<<=|<=|<|===|==|=|>>>=|>>=|>=|>>>|>>|>|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~"

    // MARK: - Source Extraction

    /// Extract the pattern string from a regex or return the string as-is
    public static func source(_ pattern: PatternLike) -> String {
        return pattern.asString
    }

    /// Extract the pattern string from a regex string
    public static func source(_ pattern: String) -> String {
        return pattern
    }

    // MARK: - Pattern Combination

    /// Concatenate multiple patterns
    public static func concat(_ patterns: PatternLike...) -> String {
        return patterns.map { source($0) }.joined()
    }

    /// Concatenate multiple pattern strings
    public static func concat(_ patterns: String...) -> String {
        return patterns.joined()
    }

    /// Concatenate an array of patterns
    public static func concat(_ patterns: [String]) -> String {
        return patterns.joined()
    }

    /// Create an alternation (either) pattern
    public static func either(_ patterns: PatternLike...) -> String {
        return "(?:" + patterns.map { source($0) }.joined(separator: "|") + ")"
    }

    /// Create an alternation from an array of strings
    public static func either(_ patterns: [String]) -> String {
        return "(?:" + patterns.joined(separator: "|") + ")"
    }

    /// Create a positive lookahead
    public static func lookahead(_ pattern: PatternLike) -> String {
        return "(?=" + source(pattern) + ")"
    }

    /// Create a positive lookahead from a string
    public static func lookahead(_ pattern: String) -> String {
        return "(?=" + pattern + ")"
    }

    /// Create a negative lookahead
    public static func negativeLookahead(_ pattern: String) -> String {
        return "(?!" + pattern + ")"
    }

    /// Make a pattern optional
    public static func optional(_ pattern: PatternLike) -> String {
        return "(?:" + source(pattern) + ")?"
    }

    /// Make a pattern optional from string
    public static func optional(_ pattern: String) -> String {
        return "(?:" + pattern + ")?"
    }

    /// Make a pattern repeatable (zero or more)
    public static func anyNumberOfTimes(_ pattern: PatternLike) -> String {
        return "(?:" + source(pattern) + ")*"
    }

    /// Make a pattern repeatable from string
    public static func anyNumberOfTimes(_ pattern: String) -> String {
        return "(?:" + pattern + ")*"
    }

    // MARK: - Group Counting

    /// Count the number of capturing groups in a regex pattern
    public static func countMatchGroups(_ pattern: String) -> Int {
        // Count '(' that are not:
        // - escaped: '\('
        // - non-capturing: '(?:'
        // - lookahead/lookbehind: '(?=' '(?!' '(?<=' '(?<!'
        // - named groups: '(?<name>'

        var count = 0
        var i = pattern.startIndex

        while i < pattern.endIndex {
            let char = pattern[i]

            if char == "\\" && pattern.index(after: i) < pattern.endIndex {
                // Skip escaped character
                i = pattern.index(i, offsetBy: 2)
                continue
            }

            if char == "(" {
                let nextIndex = pattern.index(after: i)
                if nextIndex < pattern.endIndex && pattern[nextIndex] == "?" {
                    // Non-capturing or special group
                    let afterQuestion = pattern.index(after: nextIndex)
                    if afterQuestion < pattern.endIndex {
                        let special = pattern[afterQuestion]
                        if special == ":" || special == "=" || special == "!" || special == "<" {
                            // Check if it's a lookbehind (<?= or <?!) or named group (<?name>)
                            if special == "<" {
                                let afterLess = pattern.index(after: afterQuestion)
                                if afterLess < pattern.endIndex {
                                    let next = pattern[afterLess]
                                    if next == "=" || next == "!" {
                                        // Lookbehind - not a capturing group
                                        i = pattern.index(after: i)
                                        continue
                                    }
                                    // Named group - IS a capturing group
                                    count += 1
                                    i = pattern.index(after: i)
                                    continue
                                }
                            }
                            // Non-capturing or lookahead
                            i = pattern.index(after: i)
                            continue
                        }
                    }
                }
                // Regular capturing group
                count += 1
            }

            i = pattern.index(after: i)
        }

        return count
    }

    // MARK: - Backreference Rewriting

    /// Rewrite backreferences when combining multiple regexes
    /// When we join regex patterns, backreferences need to be adjusted
    public static func rewriteBackreferences(_ patterns: [String], joinWith: String = "|") -> String {
        var numCaptures = 0
        var results: [String] = []

        for pattern in patterns {
            numCaptures += 1  // Account for the wrapping group
            let adjustedPattern = adjustBackreferences(pattern, offset: numCaptures)
            numCaptures += countMatchGroups(pattern)
            results.append("(" + adjustedPattern + ")")
        }

        return results.joined(separator: joinWith)
    }

    /// Adjust backreferences in a pattern by an offset
    private static func adjustBackreferences(_ pattern: String, offset: Int) -> String {
        guard offset > 0 else { return pattern }

        var result = ""
        var i = pattern.startIndex

        while i < pattern.endIndex {
            let char = pattern[i]

            if char == "\\" && pattern.index(after: i) < pattern.endIndex {
                let nextIndex = pattern.index(after: i)
                let nextChar = pattern[nextIndex]

                if nextChar.isNumber {
                    // Found a backreference
                    var numStr = String(nextChar)
                    var numEndIndex = pattern.index(after: nextIndex)

                    // Collect all digits
                    while numEndIndex < pattern.endIndex && pattern[numEndIndex].isNumber {
                        numStr.append(pattern[numEndIndex])
                        numEndIndex = pattern.index(after: numEndIndex)
                    }

                    if let num = Int(numStr), num > 0 {
                        // Adjust the backreference
                        result += "\\" + String(num + offset)
                        i = numEndIndex
                        continue
                    }
                }

                // Regular escaped character
                result.append(char)
                result.append(nextChar)
                i = pattern.index(after: nextIndex)
                continue
            }

            result.append(char)
            i = pattern.index(after: i)
        }

        return result
    }

    // MARK: - Regex Compilation

    /// Compile a pattern string to NSRegularExpression
    public static func compile(_ pattern: String, caseInsensitive: Bool = false) throws -> NSRegularExpression {
        var options: NSRegularExpression.Options = [.anchorsMatchLines]
        if caseInsensitive {
            options.insert(.caseInsensitive)
        }

        do {
            return try NSRegularExpression(pattern: pattern, options: options)
        } catch {
            throw HighlightError.regexCompilationError(pattern, error)
        }
    }

    /// Test if a pattern matches at the start of a string
    public static func startsWith(_ regex: NSRegularExpression, _ string: String, at position: Int = 0) -> Bool {
        let range = NSRange(location: position, length: string.utf16.count - position)
        guard let match = regex.firstMatch(in: string, options: [], range: range) else {
            return false
        }
        return match.range.location == position
    }

    /// Find a match in a string starting at a given position
    public static func exec(_ regex: NSRegularExpression, _ string: String, from position: Int = 0) -> MatchData? {
        let nsString = string as NSString
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

    /// Escape a string for use in a regex pattern
    public static func escape(_ string: String) -> String {
        return NSRegularExpression.escapedPattern(for: string)
    }

    /// Check if a pattern is valid
    public static func isValid(_ pattern: String) -> Bool {
        do {
            _ = try NSRegularExpression(pattern: pattern, options: [])
            return true
        } catch {
            return false
        }
    }
}

// MARK: - Multi-Regex

/// Combines multiple regex patterns into a single alternation with tracking
public class MultiRegex {
    private var regexes: [(pattern: String, metadata: MatchMetadata)] = []
    private var combinedRegex: NSRegularExpression?
    private var lastIndex: Int = 0
    private let caseInsensitive: Bool

    public struct MatchMetadata {
        public let rule: Int
        public let type: MatchType

        public init(rule: Int, type: MatchType = .begin) {
            self.rule = rule
            self.type = type
        }
    }

    public init(caseInsensitive: Bool = false) {
        self.caseInsensitive = caseInsensitive
    }

    /// Add a regex pattern with metadata
    public func addRule(_ pattern: String, metadata: MatchMetadata) {
        regexes.append((pattern, metadata))
        combinedRegex = nil  // Invalidate cache
    }

    /// Compile all regexes into a combined pattern
    public func compile() throws {
        guard !regexes.isEmpty else { return }

        let combined = RegexHelpers.rewriteBackreferences(regexes.map { $0.pattern })
        combinedRegex = try RegexHelpers.compile(combined, caseInsensitive: caseInsensitive)
    }

    /// Find the next match starting from the given position
    public func exec(_ string: String, from position: Int = 0) -> (match: MatchData, metadata: MatchMetadata)? {
        guard let regex = combinedRegex else { return nil }

        guard let matchData = RegexHelpers.exec(regex, string, from: position) else {
            return nil
        }

        // Find which sub-pattern matched by checking which group is non-nil
        var groupOffset = 1

        for (index, (pattern, metadata)) in regexes.enumerated() {
            let groupRange = matchData.match.range(at: groupOffset)
            if groupRange.location != NSNotFound {
                var result = matchData
                result.rule = index
                result.type = metadata.type
                return (result, metadata)
            }
            groupOffset += 1 + RegexHelpers.countMatchGroups(pattern)
        }

        return nil
    }

    /// Reset to allow fresh matching
    public func reset() {
        lastIndex = 0
    }

    public var isEmpty: Bool {
        return regexes.isEmpty
    }
}

// MARK: - Resumable Multi-Regex

/// A multi-regex that can resume from a specific rule index
/// This is used when a match is ignored and we need to try remaining rules at the same position
public class ResumableMultiRegex {
    private var rules: [(pattern: String, metadata: RuleMetadata)] = []
    private var multiRegexCache: [Int: MultiRegex] = [:]
    private var regexIndex: Int = 0
    private let caseInsensitive: Bool

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
    }

    public init(caseInsensitive: Bool = false) {
        self.caseInsensitive = caseInsensitive
    }

    /// Add a rule with its pattern and metadata
    public func addRule(_ pattern: String, rule: CompiledMode, type: MatchType = .begin) {
        rules.append((pattern, RuleMetadata(rule: rule, type: type)))
        multiRegexCache.removeAll()  // Invalidate cache
    }

    /// Get or create a multi-regex starting from the given index
    private func getMultiRegex(from startIndex: Int) throws -> MultiRegex? {
        if let cached = multiRegexCache[startIndex] {
            return cached
        }

        guard startIndex < rules.count else { return nil }

        let multiRegex = MultiRegex(caseInsensitive: caseInsensitive)
        for i in startIndex..<rules.count {
            let (pattern, metadata) = rules[i]
            multiRegex.addRule(pattern, metadata: MultiRegex.MatchMetadata(rule: i, type: metadata.type))
        }
        try multiRegex.compile()

        multiRegexCache[startIndex] = multiRegex
        return multiRegex
    }

    /// Reset to consider all rules
    public func considerAll() {
        regexIndex = 0
    }

    /// Execute and find the next match
    public func exec(_ string: String, from position: Int = 0) throws -> MatchResult? {
        guard let multiRegex = try getMultiRegex(from: regexIndex) else {
            return nil
        }

        guard let (matchData, _) = multiRegex.exec(string, from: position) else {
            return nil
        }

        let ruleIndex = matchData.rule + regexIndex
        guard ruleIndex < rules.count else { return nil }

        let (_, metadata) = rules[ruleIndex]

        // Prepare for potential resumption
        if matchData.index == position {
            // Match at current position - if ignored, start from next rule
            regexIndex = ruleIndex + 1
        } else {
            // Match ahead - reset for next call
            regexIndex = 0
        }

        return MatchResult(
            match: matchData,
            rule: metadata.rule,
            type: metadata.type,
            ruleIndex: ruleIndex
        )
    }

    public var isEmpty: Bool {
        return rules.isEmpty
    }
}
