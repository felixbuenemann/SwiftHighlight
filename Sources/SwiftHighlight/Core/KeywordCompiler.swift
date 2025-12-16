import Foundation

// MARK: - Keyword Compiler

/// Compiles keyword definitions into efficient lookup dictionaries
public class KeywordCompiler {

    /// Common keywords that get relevance 0 (too common to boost score)
    private static let commonKeywords = Set([
        "of", "and", "for", "in", "not", "or", "if", "then", "parent",
        "list", "value", "a", "an", "to", "is", "are", "it", "as"
    ])

    /// Compile keywords from various input formats
    /// - Parameters:
    ///   - keywords: The keyword definition (string, array, or dictionary)
    ///   - caseInsensitive: Whether matching should be case-insensitive
    ///   - scopeName: Default scope name if not specified
    /// - Returns: Compiled keyword dictionary
    public static func compile(
        _ keywords: Keywords,
        caseInsensitive: Bool = false,
        scopeName: String = "keyword"
    ) -> CompiledKeywords {
        var result: CompiledKeywords = [:]

        switch keywords {
        case .none:
            return result

        case .simple(let str):
            compileKeywordString(str, scope: scopeName, caseInsensitive: caseInsensitive, into: &result)

        case .array(let arr):
            for item in arr {
                compileKeywordString(item, scope: scopeName, caseInsensitive: caseInsensitive, into: &result)
            }

        case .grouped(let dict):
            for (scope, value) in dict {
                if let str = value as? String {
                    compileKeywordString(str, scope: scope, caseInsensitive: caseInsensitive, into: &result)
                } else if let arr = value as? [String] {
                    for item in arr {
                        compileKeywordString(item, scope: scope, caseInsensitive: caseInsensitive, into: &result)
                    }
                }
            }
        }

        return result
    }

    /// Compile a space-separated keyword string
    /// Supports relevance notation: "keyword|5" gives keyword relevance 5
    private static func compileKeywordString(
        _ input: String,
        scope: String,
        caseInsensitive: Bool,
        into result: inout CompiledKeywords
    ) {
        let words = input.split(separator: " ").map { String($0) }

        for word in words {
            guard !word.isEmpty else { continue }

            let parts = word.split(separator: "|", maxSplits: 1)
            guard !parts.isEmpty else { continue }
            let keyword = String(parts[0])
            guard !keyword.isEmpty else { continue }
            let key = caseInsensitive ? keyword.lowercased() : keyword

            // Parse explicit relevance or use default
            let relevance: Double
            if parts.count > 1, let explicit = Double(String(parts[1])) {
                relevance = explicit
            } else if commonKeywords.contains(key) {
                relevance = 0
            } else {
                relevance = 1
            }

            result[key] = KeywordEntry(scope: scope, relevance: relevance)
        }
    }

    /// Build a regex pattern that matches any of the keywords
    public static func buildKeywordPattern(
        _ keywords: CompiledKeywords,
        caseInsensitive: Bool = false
    ) throws -> NSRegularExpression? {
        guard !keywords.isEmpty else { return nil }

        // Sort keywords by length (longest first) to ensure longest match
        let sortedKeywords = keywords.keys.sorted { $0.count > $1.count }

        // Escape keywords and join with alternation
        let escaped = sortedKeywords.map { NSRegularExpression.escapedPattern(for: $0) }
        let pattern = "\\b(" + escaped.joined(separator: "|") + ")\\b"

        var options: NSRegularExpression.Options = []
        if caseInsensitive {
            options.insert(.caseInsensitive)
        }

        return try NSRegularExpression(pattern: pattern, options: options)
    }

    /// Build a keyword pattern that supports word boundaries for identifiers
    public static func buildKeywordPatternForMode(
        _ compiledKeywords: CompiledKeywords,
        caseInsensitive: Bool = false
    ) throws -> NSRegularExpression? {
        guard !compiledKeywords.isEmpty else { return nil }

        // Sort by length (longest first)
        let sortedKeywords = compiledKeywords.keys.sorted { $0.count > $1.count }

        // Escape and join
        let escaped = sortedKeywords.map { NSRegularExpression.escapedPattern(for: $0) }

        // Use word boundary that works better with code
        // The pattern matches:
        // - start of string or non-word char before
        // - the keyword
        // - end of string or non-word char after
        let pattern = "(?<![\\w])(" + escaped.joined(separator: "|") + ")(?![\\w])"

        var options: NSRegularExpression.Options = []
        if caseInsensitive {
            options.insert(.caseInsensitive)
        }

        return try NSRegularExpression(pattern: pattern, options: options)
    }
}

// MARK: - Keyword Helper Extensions

extension Keywords {
    /// Create keywords from a dictionary
    public static func from(_ dict: [String: String]) -> Keywords {
        var grouped: [String: Any] = [:]
        for (key, value) in dict {
            grouped[key] = value
        }
        return .grouped(grouped)
    }

    /// Create keywords from a dictionary with string arrays
    public static func from(_ dict: [String: [String]]) -> Keywords {
        var grouped: [String: Any] = [:]
        for (key, value) in dict {
            grouped[key] = value
        }
        return .grouped(grouped)
    }

    /// Merge two keyword definitions
    public func merged(with other: Keywords) -> Keywords {
        switch (self, other) {
        case (.none, let o):
            return o
        case (let s, .none):
            return s
        case (.simple(let s1), .simple(let s2)):
            return .simple(s1 + " " + s2)
        case (.grouped(var g1), .grouped(let g2)):
            for (key, value) in g2 {
                if let existing = g1[key] as? String, let new = value as? String {
                    g1[key] = existing + " " + new
                } else {
                    g1[key] = value
                }
            }
            return .grouped(g1)
        default:
            // Convert both to grouped and merge
            return self  // Simplified for now
        }
    }
}
