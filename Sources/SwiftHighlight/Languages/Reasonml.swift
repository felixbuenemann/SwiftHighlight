// Auto-generated from highlight.js
// Language: reasonml

import Foundation

/// reasonml language definition
public func reasonmlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "ReasonML"

    lang.aliases = ["re"]
    lang.keywords = .grouped([
        "keyword": ["and", "as", "asr", "assert", "begin", "class", "constraint", "do", "done", "downto", "else", "end", "esfun", "exception", "external", "for", "fun", "function", "functor", "if", "in", "include", "inherit", "initializer", "land", "lazy", "let", "lor", "lsl", "lsr", "lxor", "mod", "module", "mutable", "new", "nonrec", "object", "of", "open", "or", "pri", "pub", "rec", "sig", "struct", "switch", "then", "to", "try", "type", "val", "virtual", "when", "while", "with"] as Any,
        "built_in": ["array", "bool", "bytes", "char", "exn|5", "float", "int", "int32", "int64", "list", "lazy_t|5", "nativeint|5", "ref", "string", "unit"] as Any,
        "literal": ["true", "false"] as Any,
    ])
    lang.illegal = .regex("(:-|:=|\\$\\{|\\+=)")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[(\\|\\|)?\\]|\\(\\)")
            mode.scope = .single("literal")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.COMMENT("\\/\\*", "\\*\\/")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\'[A-Za-z_](?!\\')[\\w\\']*")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("`[A-Z][\\w\\']*")
            mode.scope = .single("type")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b[A-Z][\\w\\']*")
            mode.scope = .single("type")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-z_]\\w*\\'[\\w\\']*")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\s+(\\|\\||\\+[\\+\\.]?|\\*[\\*\\/\\.]?|\\/[\\.]?|\\.\\.\\.|\\|>|&&|===?)\\s+")
            mode.scope = .single("operator")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("number")
            mode.relevance = 0
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b0[xX][a-fA-F0-9_]+[Lln]?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b0[oO][0-7_]+[Lln]?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b0[bB][01_]+[Lln]?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b[0-9][0-9_]*([Lln]|(\\.[0-9_]*)?([eE][-+]?[0-9_]+)?)")
                    return mode
                }(),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register reasonml language
public extension HighlightJS {
    func registerReasonml() {
        registerLanguage("reasonml", definition: reasonmlLanguage)
    }
}
