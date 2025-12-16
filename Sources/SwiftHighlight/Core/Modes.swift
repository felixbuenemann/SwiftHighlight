import Foundation

// MARK: - Common Modes

/// Provides pre-defined modes (grammar patterns) for common syntax elements
/// These mirror the MODES object in highlight.js
public enum CommonModes {

    // MARK: - Pattern Constants

    /// Identifier pattern: starts with letter, followed by word characters
    public static let IDENT_RE = "[a-zA-Z]\\w*"

    /// Identifier with underscore prefix allowed
    public static let UNDERSCORE_IDENT_RE = "[a-zA-Z_]\\w*"

    /// Simple number pattern
    public static let NUMBER_RE = "\\b\\d+(\\.\\d+)?"

    /// C-style number pattern
    public static let C_NUMBER_RE = "(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)"

    /// Binary number pattern
    public static let BINARY_NUMBER_RE = "\\b(0b[01]+)"

    /// Characters that can start a regex in C-style languages
    public static let RE_STARTERS_RE = "!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|-|-=|/=|/|:|;|<<|<<=|<=|<|===|==|=|>>>=|>>=|>=|>>>|>>|>|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~"

    // MARK: - Escape Sequences

    /// Backslash escape mode
    public static func BACKSLASH_ESCAPE() -> Mode {
        let mode = Mode()
        mode.begin = .regex("\\\\[\\s\\S]")
        mode.relevance = 0
        return mode
    }

    // MARK: - String Modes

    /// Double-quoted string mode
    public static func QUOTE_STRING_MODE() -> Mode {
        let mode = Mode()
        mode.scope = .single("string")
        mode.begin = .string("\"")
        mode.end = .string("\"")
        mode.illegal = .regex("\\n")
        mode.contains = [.mode(BACKSLASH_ESCAPE())]
        return mode
    }

    /// Single-quoted string mode
    public static func APOS_STRING_MODE() -> Mode {
        let mode = Mode()
        mode.scope = .single("string")
        mode.begin = .string("'")
        mode.end = .string("'")
        mode.illegal = .regex("\\n")
        mode.contains = [.mode(BACKSLASH_ESCAPE())]
        return mode
    }

    /// Phrase (multi-line) string mode
    public static func PHRASAL_WORDS_MODE() -> Mode {
        let mode = Mode()
        mode.begin = .regex("\\b(" + IDENT_RE + "\\s+)+")
        mode.relevance = 0
        return mode
    }

    // MARK: - Comment Modes

    /// Create a comment mode with custom delimiters
    public static func COMMENT(_ begin: String, _ end: String, modeOptions: Mode? = nil) -> Mode {
        let mode = modeOptions?.copy() ?? Mode()
        mode.scope = .single("comment")
        mode.begin = .regex(begin)
        mode.end = .regex(end)

        var contains: [ModeReference] = mode.contains ?? []
        contains.append(.mode(PHRASAL_WORDS_MODE()))
        // Add doc tag support
        let docTag = Mode()
        docTag.scope = .single("doctag")
        docTag.begin = .regex("(?:TODO|FIXME|NOTE|BUG|OPTIMIZE|HACK|XXX):")
        docTag.relevance = 0
        contains.append(.mode(docTag))
        mode.contains = contains

        return mode
    }

    /// C-style line comment: //
    public static func C_LINE_COMMENT_MODE() -> Mode {
        return COMMENT("//", "$")
    }

    /// C-style block comment: /* */
    public static func C_BLOCK_COMMENT_MODE() -> Mode {
        return COMMENT("/\\*", "\\*/")
    }

    /// Hash comment: #
    public static func HASH_COMMENT_MODE() -> Mode {
        return COMMENT("#", "$")
    }

    // MARK: - Number Modes

    /// Simple number mode
    public static func NUMBER_MODE() -> Mode {
        let mode = Mode()
        mode.scope = .single("number")
        mode.begin = .regex(NUMBER_RE)
        mode.relevance = 0
        return mode
    }

    /// C-style number mode (hex, octal, decimal, float, scientific)
    public static func C_NUMBER_MODE() -> Mode {
        let mode = Mode()
        mode.scope = .single("number")
        mode.begin = .regex(C_NUMBER_RE)
        mode.relevance = 0
        return mode
    }

    /// Binary number mode
    public static func BINARY_NUMBER_MODE() -> Mode {
        let mode = Mode()
        mode.scope = .single("number")
        mode.begin = .regex(BINARY_NUMBER_RE)
        mode.relevance = 0
        return mode
    }

    // MARK: - Regex Mode

    /// CSS/JS-style regex mode
    public static func REGEXP_MODE() -> Mode {
        let mode = Mode()
        mode.scope = .single("regexp")
        mode.begin = .regex("/(?=[^/\\n]*/)") // Lookahead to ensure closing /
        mode.end = .regex("/[gimuy]*")
        mode.illegal = .regex("\\n")
        mode.contains = [
            .mode(BACKSLASH_ESCAPE()),
            .mode({
                let inner = Mode()
                inner.begin = .string("[")
                inner.end = .string("]")
                inner.relevance = 0
                inner.contains = [.mode(BACKSLASH_ESCAPE())]
                return inner
            }())
        ]
        return mode
    }

    // MARK: - Title Modes

    /// Title mode for function/class names
    public static func TITLE_MODE() -> Mode {
        let mode = Mode()
        mode.scope = .single("title")
        mode.begin = .regex(IDENT_RE)
        mode.relevance = 0
        return mode
    }

    /// Underscore title mode
    public static func UNDERSCORE_TITLE_MODE() -> Mode {
        let mode = Mode()
        mode.scope = .single("title")
        mode.begin = .regex(UNDERSCORE_IDENT_RE)
        mode.relevance = 0
        return mode
    }

    // MARK: - Method/Function Modes

    /// Method guard mode for ObjC style
    public static func METHOD_GUARD() -> Mode {
        let mode = Mode()
        // Begin at method declarations
        mode.begin = .regex("\\.\\s*" + UNDERSCORE_IDENT_RE)
        mode.relevance = 0
        return mode
    }

    // MARK: - Shebang Mode

    /// Shebang line mode (#!)
    public static func SHEBANG(binary: String? = nil) -> Mode {
        let mode = Mode()
        mode.scope = .single("meta")
        if let binary = binary {
            mode.begin = .regex("#![\\s]*/.*\\b" + NSRegularExpression.escapedPattern(for: binary) + "\\b")
        } else {
            mode.begin = .regex("#![\\s]*/.*")
        }
        mode.end = .regex("$")
        mode.relevance = 5
        return mode
    }

    // MARK: - Special Modes

    /// END_SAME_AS_BEGIN - end pattern mirrors begin
    /// This creates a mode where the end pattern is captured from the begin match
    public static func END_SAME_AS_BEGIN(_ mode: Mode) -> Mode {
        let copy = mode.copy()
        // This is handled specially during compilation
        // The end pattern will be dynamically set based on the begin match
        copy.onBegin = { match, response in
            // Store the matched text for end comparison
            response.data["endPattern"] = match.fullMatch
        }
        return copy
    }

    // MARK: - Type Mode

    /// Mode for matching type names (typically PascalCase)
    public static func TYPE_MODE() -> Mode {
        let mode = Mode()
        mode.scope = .single("type")
        mode.begin = .regex("[A-Z][a-zA-Z0-9_]*")
        mode.relevance = 0
        return mode
    }

    // MARK: - Attribute Mode

    /// Mode for attributes like @something
    public static func ATTRIBUTE_MODE(prefix: String = "@") -> Mode {
        let mode = Mode()
        mode.scope = .single("meta")
        mode.begin = .regex(NSRegularExpression.escapedPattern(for: prefix) + IDENT_RE)
        mode.relevance = 0
        return mode
    }

    // MARK: - Preprocessor Mode

    /// C-style preprocessor directive
    public static func PREPROCESSOR_MODE() -> Mode {
        let mode = Mode()
        mode.scope = .single("meta")
        mode.begin = .regex("#\\s*[a-zA-Z]+\\b")
        mode.end = .regex("$")
        mode.relevance = 0
        mode.keywords = .simple("if else elif endif define undef warning error line pragma ifdef ifndef include")
        mode.contains = [
            .mode(QUOTE_STRING_MODE()),
            .mode(C_LINE_COMMENT_MODE()),
            .mode(C_BLOCK_COMMENT_MODE())
        ]
        return mode
    }
}

// MARK: - Mode Builder Helpers

/// Helper functions for building modes
extension Mode {
    /// Create a mode with the given scope
    public static func withScope(_ scope: String) -> Mode {
        let mode = Mode()
        mode.scope = .single(scope)
        return mode
    }

    /// Create a mode with begin pattern
    public static func begin(_ pattern: String) -> Mode {
        let mode = Mode()
        mode.begin = .regex(pattern)
        return mode
    }

    /// Create a mode with begin and end patterns
    public static func beginEnd(_ begin: String, _ end: String) -> Mode {
        let mode = Mode()
        mode.begin = .regex(begin)
        mode.end = .regex(end)
        return mode
    }

    /// Set the scope and return self for chaining
    public func scoped(_ scope: String) -> Mode {
        self.scope = .single(scope)
        return self
    }

    /// Set contains and return self for chaining
    public func containing(_ modes: Mode...) -> Mode {
        self.contains = modes.map { .mode($0) }
        return self
    }

    /// Add keywords
    public func withKeywords(_ keywords: String) -> Mode {
        self.keywords = .simple(keywords)
        return self
    }

    /// Add grouped keywords
    public func withKeywords(_ keywords: [String: String]) -> Mode {
        self.keywords = Keywords.from(keywords)
        return self
    }

    /// Set relevance
    public func withRelevance(_ relevance: Double) -> Mode {
        self.relevance = relevance
        return self
    }

    /// Set illegal pattern
    public func withIllegal(_ pattern: String) -> Mode {
        self.illegal = .regex(pattern)
        return self
    }

    /// Set variants
    public func withVariants(_ variants: Mode...) -> Mode {
        self.variants = variants
        return self
    }

    /// Mark as ending parent
    public func endsParentMode() -> Mode {
        self.endsParent = true
        return self
    }

    /// Mark as ending with parent
    public func endsWithParentMode() -> Mode {
        self.endsWithParent = true
        return self
    }
}
