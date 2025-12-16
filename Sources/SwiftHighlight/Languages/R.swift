// Auto-generated from highlight.js
// Language: r

import Foundation

/// r language definition
public func rLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "R"

    lang.keywords = .grouped([
        "keyword": "function if in break next repeat else for while" as Any,
        "literal": "NULL NA TRUE FALSE Inf NaN NA_integer_|10 NA_real_|10 NA_character_|10 NA_complex_|10" as Any,
        "built_in": "LETTERS letters month.abb month.name pi T F abs acos acosh all any anyNA Arg as.call as.character as.complex as.double as.environment as.integer as.logical as.null.default as.numeric as.raw asin asinh atan atanh attr attributes baseenv browser c call ceiling class Conj cos cosh cospi cummax cummin cumprod cumsum digamma dim dimnames emptyenv exp expression floor forceAndCall gamma gc.time globalenv Im interactive invisible is.array is.atomic is.call is.character is.complex is.double is.environment is.expression is.finite is.function is.infinite is.integer is.language is.list is.logical is.matrix is.na is.name is.nan is.null is.numeric is.object is.pairlist is.raw is.recursive is.single is.symbol lazyLoadDBfetch length lgamma list log max min missing Mod names nargs nzchar oldClass on.exit pos.to.env proc.time prod quote range Re rep retracemem return round seq_along seq_len seq.int sign signif sin sinh sinpi sqrt standardGeneric substitute sum switch tan tanh tanpi tracemem trigamma trunc unclass untracemem UseMethod xtfrm" as Any,
    ])
    lang.contains = [
        .mode(CommonModes.COMMENT("#'", "$")),
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("[rR]\"(-*)\\(")
                    mode.end = .regex("\\)(-*)\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("[rR]\"(-*)\\{")
                    mode.end = .regex("\\}(-*)\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("[rR]\"(-*)\\[")
                    mode.end = .regex("\\](-*)\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("[rR]'(-*)\\(")
                    mode.end = .regex("\\)(-*)'")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("[rR]'(-*)\\{")
                    mode.end = .regex("\\}(-*)'")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("[rR]'(-*)\\[")
                    mode.end = .regex("\\](-*)'")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.relevance = 0
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("[=!<>:]=|\\|\\||&&|:::?|<-|<<-|->>|->|\\|>|[-+*\\/?!$&|:<=>@^~]|\\*\\*"), .regex("(?:/0[xX][0-9a-fA-F]+\\.[0-9a-fA-F]*[pP][+-]?\\d+i?/|/0[xX][0-9a-fA-F]+(?:[pP][+-]?\\d+)?[Li]?/|/(?:\\d+(?:\\.\\d*)?|\\.\\d+)(?:[eE][+-]?\\d+)?[Li]?/)")])
                    mode.scope = .multi([1: "operator", 2: "number"])
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("%[^%]*%"), .regex("(?:/0[xX][0-9a-fA-F]+\\.[0-9a-fA-F]*[pP][+-]?\\d+i?/|/0[xX][0-9a-fA-F]+(?:[pP][+-]?\\d+)?[Li]?/|/(?:\\d+(?:\\.\\d*)?|\\.\\d+)(?:[eE][+-]?\\d+)?[Li]?/)")])
                    mode.scope = .multi([1: "operator", 2: "number"])
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("(?:/[()]/|/[{}]/|/\\[\\[/|/[[\\]]/|/\\\\/|/,/)"), .regex("(?:/0[xX][0-9a-fA-F]+\\.[0-9a-fA-F]*[pP][+-]?\\d+i?/|/0[xX][0-9a-fA-F]+(?:[pP][+-]?\\d+)?[Li]?/|/(?:\\d+(?:\\.\\d*)?|\\.\\d+)(?:[eE][+-]?\\d+)?[Li]?/)")])
                    mode.scope = .multi([1: "punctuation", 2: "number"])
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("[^a-zA-Z0-9._]|^"), .regex("(?:/0[xX][0-9a-fA-F]+\\.[0-9a-fA-F]*[pP][+-]?\\d+i?/|/0[xX][0-9a-fA-F]+(?:[pP][+-]?\\d+)?[Li]?/|/(?:\\d+(?:\\.\\d*)?|\\.\\d+)(?:[eE][+-]?\\d+)?[Li]?/)")])
                    mode.scope = .multi([2: "number"])
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("(?:(?:[a-zA-Z]|\\.[._a-zA-Z])[._a-zA-Z0-9]*)|\\.(?!\\d)"), .regex("\\s+"), .regex("<-"), .regex("\\s+")])
            mode.scope = .multi([3: "operator"])
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("operator")
            mode.relevance = 0
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("[=!<>:]=|\\|\\||&&|:::?|<-|<<-|->>|->|\\|>|[-+*\\/?!$&|:<=>@^~]|\\*\\*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("%[^%]*%")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(?:/[()]/|/[{}]/|/\\[\\[/|/[[\\]]/|/\\\\/|/,/)")
            mode.scope = .single("punctuation")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("`")
            mode.end = .regex("`")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\\\.")
                    return mode
                }()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register r language
public extension HighlightJS {
    func registerR() {
        registerLanguage("r", definition: rLanguage)
    }
}
