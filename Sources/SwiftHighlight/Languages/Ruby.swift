// Manually ported from highlight.js
// Language: ruby

import Foundation

/// Ruby language definition
public func rubyLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Ruby"
    lang.aliases = ["ruby", "rb", "gemspec", "podspec", "thor", "irb"]

    let RUBY_KEYWORDS = [
        "and", "begin", "break", "case", "class", "def", "defined", "do", "else", "elsif",
        "end", "ensure", "false", "for", "if", "in", "module", "next", "nil", "not", "or",
        "redo", "rescue", "retry", "return", "self", "super", "then", "true", "undef",
        "unless", "until", "when", "while", "yield", "raise", "fail", "loop", "proc",
        "lambda", "catch", "throw", "attr_reader", "attr_writer", "attr_accessor",
        "alias", "private", "protected", "public", "require", "require_relative",
        "include", "extend", "prepend", "__FILE__", "__LINE__", "__ENCODING__", "__dir__"
    ].joined(separator: " ")

    let RUBY_BUILT_INS = [
        "puts", "print", "gets", "p", "pp", "warn", "open", "sprintf", "format", "binding",
        "eval", "exec", "exit", "fork", "system", "sleep", "raise", "Array", "Float",
        "Integer", "String", "Hash", "Rational", "Complex"
    ].joined(separator: " ")

    lang.keywords = .grouped([
        "keyword": RUBY_KEYWORDS as Any,
        "built_in": RUBY_BUILT_INS as Any
    ])

    // Interpolation in strings
    let INTERPOLATION = Mode()
    INTERPOLATION.scope = .single("subst")
    INTERPOLATION.begin = .regex("#\\{")
    INTERPOLATION.end = .regex("\\}")

    // Double-quoted string
    let DOUBLE_STRING = Mode()
    DOUBLE_STRING.scope = .single("string")
    DOUBLE_STRING.begin = .regex("\"")
    DOUBLE_STRING.end = .regex("\"")
    DOUBLE_STRING.contains = [
        .mode(CommonModes.BACKSLASH_ESCAPE()),
        .mode(INTERPOLATION)
    ]

    // Single-quoted string
    let SINGLE_STRING = Mode()
    SINGLE_STRING.scope = .single("string")
    SINGLE_STRING.begin = .regex("'")
    SINGLE_STRING.end = .regex("'")
    SINGLE_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]

    // Percent strings %w, %i, %q, %Q, etc.
    let PERCENT_STRING = Mode()
    PERCENT_STRING.scope = .single("string")
    PERCENT_STRING.variants = [
        {
            let m = Mode()
            m.begin = .regex("%[qQwWiIxsr]?\\(")
            m.end = .regex("\\)")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("%[qQwWiIxsr]?\\[")
            m.end = .regex("\\]")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("%[qQwWiIxsr]?\\{")
            m.end = .regex("\\}")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("%[qQwWiIxsr]?<")
            m.end = .regex(">")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("%[qQwWiIxsr]?/")
            m.end = .regex("/")
            return m
        }()
    ]
    PERCENT_STRING.contains = [
        .mode(INTERPOLATION)
    ]

    // Here-doc
    let HEREDOC = Mode()
    HEREDOC.scope = .single("string")
    HEREDOC.begin = .regex("<<[-~]?['\"]?([A-Za-z_]\\w*)['\"]?")
    HEREDOC.end = .regex("^\\s*[A-Za-z_]\\w*$")
    HEREDOC.contains = [
        .mode(CommonModes.BACKSLASH_ESCAPE()),
        .mode(INTERPOLATION)
    ]

    // Symbol
    let SYMBOL = Mode()
    SYMBOL.scope = .single("symbol")
    SYMBOL.variants = [
        {
            let m = Mode()
            m.begin = .regex(":[A-Za-z_]\\w*[!?]?")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex(":\"")
            m.end = .regex("\"")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex(":'")
            m.end = .regex("'")
            return m
        }()
    ]

    // Regex
    let REGEXP = Mode()
    REGEXP.scope = .single("regexp")
    REGEXP.begin = .regex("/(?![\\s/])")
    REGEXP.end = .regex("/[mixouesn]*")
    REGEXP.illegal = .regex("\\n")
    REGEXP.contains = [
        .mode(CommonModes.BACKSLASH_ESCAPE()),
        .mode(INTERPOLATION)
    ]

    // Instance variable
    let INSTANCE_VAR = Mode()
    INSTANCE_VAR.scope = .single("variable")
    INSTANCE_VAR.begin = .regex("@[A-Za-z_]\\w*")

    // Class variable
    let CLASS_VAR = Mode()
    CLASS_VAR.scope = .single("variable")
    CLASS_VAR.begin = .regex("@@[A-Za-z_]\\w*")

    // Global variable
    let GLOBAL_VAR = Mode()
    GLOBAL_VAR.scope = .single("variable")
    GLOBAL_VAR.begin = .regex("\\$[A-Za-z_]\\w*|\\$[0-9!@&+`'=~/<>,.;*_?:\"\\\\-]")

    // Constant
    let CONSTANT = Mode()
    CONSTANT.scope = .single("variable.constant")
    CONSTANT.begin = .regex("\\b[A-Z][A-Z0-9_]*\\b")

    // Number
    let NUMBER = Mode()
    NUMBER.scope = .single("number")
    NUMBER.variants = [
        {
            let m = Mode()
            m.begin = .regex("\\b0[xX][0-9a-fA-F](_?[0-9a-fA-F])*\\b")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("\\b0[oO][0-7](_?[0-7])*\\b")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("\\b0[bB][01](_?[01])*\\b")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("\\b0[dD]\\d(_?\\d)*\\b")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("\\b\\d(_?\\d)*(\\.\\d(_?\\d)*)?([eE][+-]?\\d(_?\\d)*)?i?\\b")
            return m
        }()
    ]
    NUMBER.relevance = 0

    // Class title
    let CLASS_TITLE = Mode()
    CLASS_TITLE.scope = .single("title.class")
    CLASS_TITLE.begin = .regex("[A-Z][A-Za-z0-9_]*(::[A-Z][A-Za-z0-9_]*)*")
    CLASS_TITLE.relevance = 0

    // Class inherited
    let CLASS_INHERITED = Mode()
    CLASS_INHERITED.scope = .single("title.class.inherited")
    CLASS_INHERITED.begin = .regex("[A-Z][A-Za-z0-9_]*(::[A-Z][A-Za-z0-9_]*)*")

    // Extends mode
    let EXTENDS = Mode()
    EXTENDS.beginKeywords = "<"
    EXTENDS.contains = [.mode(CLASS_INHERITED)]

    // Class definition
    let CLASS = Mode()
    CLASS.beginKeywords = "class module"
    CLASS.end = .regex("$|;")
    CLASS.contains = [
        .mode(EXTENDS),
        .mode(CLASS_TITLE)
    ]

    // Method title
    let METHOD_TITLE = Mode()
    METHOD_TITLE.scope = .single("title.function")
    METHOD_TITLE.begin = .regex("[a-z_][a-zA-Z0-9_]*[!?=]?|===?|>[=>]?|<=>|<[<=]?|[%&|^]|\\+@?|-@?|\\*\\*?|~|=~|!~|\\[\\]=?")
    METHOD_TITLE.relevance = 0

    // Method definition
    let METHOD = Mode()
    METHOD.beginKeywords = "def"
    METHOD.end = .regex("$|;")
    METHOD.contains = [.mode(METHOD_TITLE)]

    // Comment
    let COMMENT = Mode()
    COMMENT.scope = .single("comment")
    COMMENT.variants = [
        {
            let m = Mode()
            m.begin = .regex("#")
            m.end = .regex("$")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("^=begin")
            m.end = .regex("^=end")
            m.relevance = 10
            return m
        }()
    ]

    lang.contains = [
        .mode(COMMENT),
        .mode(CLASS),
        .mode(METHOD),
        .mode(HEREDOC),
        .mode(DOUBLE_STRING),
        .mode(SINGLE_STRING),
        .mode(PERCENT_STRING),
        .mode(SYMBOL),
        .mode(REGEXP),
        .mode(INSTANCE_VAR),
        .mode(CLASS_VAR),
        .mode(GLOBAL_VAR),
        .mode(CONSTANT),
        .mode(NUMBER)
    ]

    return lang
}

/// Register ruby language
public extension HighlightJS {
    func registerRuby() {
        registerLanguage("ruby", definition: rubyLanguage)
        registerLanguage("rb", definition: rubyLanguage)
    }
}
