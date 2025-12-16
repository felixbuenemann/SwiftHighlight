// Auto-generated from highlight.js
// Language: ebnf

import Foundation

/// ebnf language definition
public func ebnfLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Extended Backus-Naur Form"

    lang.illegal = .regex("\\S")
    lang.contains = [
        .mode(CommonModes.COMMENT("\\(\\*", "\\*\\)")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[ ]*[a-zA-Z]+([\\s_-]+[a-zA-Z]+)*")
            mode.scope = .single("attribute")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("=")
            mode.end = .regex("[.;]")
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\?.*\\?")
                    mode.scope = .single("meta")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.scope = .single("string")
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("'")
                            mode.end = .regex("'")
                            mode.scope = .single("string")
                            mode.contains = [
                                .mode(CommonModes.BACKSLASH_ESCAPE()),
                            ]
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\"")
                            mode.end = .regex("\"")
                            mode.scope = .single("string")
                            mode.contains = [
                                .mode(CommonModes.BACKSLASH_ESCAPE()),
                            ]
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("`")
                            mode.end = .regex("`")
                            return mode
                        }(),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register ebnf language
public extension HighlightJS {
    func registerEbnf() {
        registerLanguage("ebnf", definition: ebnfLanguage)
    }
}
