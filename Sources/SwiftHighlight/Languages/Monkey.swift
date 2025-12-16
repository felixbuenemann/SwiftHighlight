// Auto-generated from highlight.js
// Language: monkey

import Foundation

/// monkey language definition
public func monkeyLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Monkey"

    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": ["public", "private", "property", "continue", "exit", "extern", "new", "try", "catch", "eachin", "not", "abstract", "final", "select", "case", "default", "const", "local", "global", "field", "end", "if", "then", "else", "elseif", "endif", "while", "wend", "repeat", "until", "forever", "for", "to", "step", "next", "return", "module", "inline", "throw", "import", "and", "or", "shl", "shr", "mod"] as Any,
        "built_in": ["DebugLog", "DebugStop", "Error", "Print", "ACos", "ACosr", "ASin", "ASinr", "ATan", "ATan2", "ATan2r", "ATanr", "Abs", "Abs", "Ceil", "Clamp", "Clamp", "Cos", "Cosr", "Exp", "Floor", "Log", "Max", "Max", "Min", "Min", "Pow", "Sgn", "Sgn", "Sin", "Sinr", "Sqrt", "Tan", "Tanr", "Seed", "PI", "HALFPI", "TWOPI"] as Any,
        "literal": ["true", "false", "null"] as Any,
    ])
    lang.illegal = .regex("\\/\\*")
    lang.contains = [
        .mode(CommonModes.COMMENT("#rem", "#end")),
        .mode(CommonModes.COMMENT("'", "$")),
        .mode({
            let mode = Mode()
            mode.scope = .multi([1: "keyword", 3: "title.function"])
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("(function|method)"), .regex("\\s+"), .regex("[a-zA-Z_]\\w*")])
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .multi([1: "keyword", 3: "title.class"])
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("(class|interface|extends|implements)"), .regex("\\s+"), .regex("[a-zA-Z_]\\w*")])
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(self|super)\\b")
            mode.scope = .single("variable.language")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\s*#")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            mode.keywords = .grouped([
                "keyword": "if else elseif endif end then" as Any,
            ])

            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("^\\s*"), .regex("strict\\b")])
            mode.scope = .multi([2: "meta"])
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("=")
            mode.beginKeywords = "alias"
            mode.contains = [
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
            ]
            return mode
        }()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("number")
            mode.relevance = 0
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("[$][a-fA-F0-9]+")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b\\d+(\\.\\d+)?")
                    mode.scope = .single("number")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register monkey language
public extension HighlightJS {
    func registerMonkey() {
        registerLanguage("monkey", definition: monkeyLanguage)
    }
}
