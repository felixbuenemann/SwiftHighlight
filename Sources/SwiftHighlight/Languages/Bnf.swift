// Auto-generated from highlight.js
// Language: bnf

import Foundation

/// bnf language definition
public func bnfLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Backus–Naur Form"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("<")
            mode.end = .regex(">")
            mode.scope = .single("attribute")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("::=")
            mode.end = .regex("$")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("<")
                    mode.end = .regex(">")
                    return mode
                }()),
                .mode(CommonModes.C_LINE_COMMENT_MODE()),
                .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
                .mode(CommonModes.APOS_STRING_MODE()),
                .mode(CommonModes.QUOTE_STRING_MODE()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register bnf language
public extension HighlightJS {
    func registerBnf() {
        registerLanguage("bnf", definition: bnfLanguage)
    }
}
