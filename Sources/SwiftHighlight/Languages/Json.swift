// Auto-generated from highlight.js
// Language: json

import Foundation

/// json language definition
public func jsonLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "JSON"

    lang.aliases = ["jsonc", "json5"]
    lang.keywords = .grouped([
        "literal": ["true", "false", "null"] as Any,
    ])
    lang.illegal = .regex("\\S")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("((\"(\\\\.|[^\\\\\"\\r\\n])*\")|('(\\\\.|[^\\\\'\\r\\n])*'))(?=\\s*:)")
            mode.scope = .single("attr")
            mode.relevance = 1.01
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[{}[\\],:]")
            mode.scope = .single("punctuation")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("literal")
            mode.beginKeywords = "true false null"
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("([-+]?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)|NaN|[-+]?Infinity")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
    ]

    return lang
}

/// Register json language
public extension HighlightJS {
    func registerJson() {
        registerLanguage("json", definition: jsonLanguage)
    }
}
