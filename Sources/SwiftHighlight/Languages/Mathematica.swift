// Language: Wolfram Language (Mathematica)
// Authors: Patrick Scheibe, Robert Jacobson
// Category: scientific

import Foundation

/// Mathematica/Wolfram Language definition
public func mathematicaLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Mathematica"
    lang.aliases = ["mma", "wl"]

    // ML-style comment (* ... *)
    let COMMENT = Mode()
    COMMENT.scope = .single("comment")
    COMMENT.begin = .regex("\\(\\*")
    COMMENT.end = .regex("\\*\\)")
    COMMENT.contains = [.selfReference]

    // Patterns (_, __, ___)
    let PATTERNS = Mode()
    PATTERNS.scope = .single("type")
    PATTERNS.begin = .regex("([a-zA-Z$][a-zA-Z0-9$]*)?_+([a-zA-Z$][a-zA-Z0-9$]*)?")
    PATTERNS.relevance = 0

    // Slots (#, ##, #1, ##2, etc.)
    let SLOTS = Mode()
    SLOTS.scope = .single("type")
    SLOTS.begin = .regex("#[a-zA-Z$][a-zA-Z0-9$]*|#+[0-9]?")
    SLOTS.relevance = 0

    // Messages (::name)
    let MESSAGES = Mode()
    MESSAGES.scope = .single("string")
    MESSAGES.begin = .regex("::[a-zA-Z$][a-zA-Z0-9$]*")
    MESSAGES.relevance = 0

    // Named characters (\[Alpha], etc.)
    let NAMED_CHARACTER = Mode()
    NAMED_CHARACTER.scope = .single("variable")
    NAMED_CHARACTER.begin = .regex("\\\\\\[[$a-zA-Z][$a-zA-Z0-9]+\\]")

    // Symbols (identifiers)
    let SYMBOL = Mode()
    SYMBOL.scope = .single("variable")
    SYMBOL.begin = .regex("[a-zA-Z$][a-zA-Z0-9$]*")
    SYMBOL.relevance = 0

    // Numbers (complex Mathematica number format)
    let NUMBER = Mode()
    NUMBER.scope = .single("number")
    NUMBER.begin = .regex("(([2-9]|[1-2]\\d|[3][0-5])\\^\\^)?(\\w*\\.\\w+|\\w+\\.\\w*|\\w+)(``[+-]?(\\d*\\.\\d+|\\d+\\.\\d*|\\d+)|`([+-]?(\\d*\\.\\d+|\\d+\\.\\d*|\\d+))?)?(\\*\\^[+-]?\\d+)?")
    NUMBER.relevance = 0

    // Operators
    let OPERATORS = Mode()
    OPERATORS.scope = .single("operator")
    OPERATORS.begin = .regex("[+\\-*/,;.:@~=><&|_`'^?!%]+")
    OPERATORS.relevance = 0

    // Braces
    let BRACES = Mode()
    BRACES.scope = .single("punctuation")
    BRACES.begin = .regex("[\\[\\](){}]")
    BRACES.relevance = 0

    // String
    let STRING = CommonModes.QUOTE_STRING_MODE()

    lang.contains = [
        .mode(COMMENT),
        .mode(PATTERNS),
        .mode(SLOTS),
        .mode(MESSAGES),
        .mode(SYMBOL),
        .mode(NAMED_CHARACTER),
        .mode(STRING),
        .mode(NUMBER),
        .mode(OPERATORS),
        .mode(BRACES)
    ]

    return lang
}

/// Register Mathematica language
public extension HighlightJS {
    func registerMathematica() {
        registerLanguage("mathematica", definition: mathematicaLanguage)
    }
}
