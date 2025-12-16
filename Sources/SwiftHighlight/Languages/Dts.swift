// Auto-generated from highlight.js
// Language: dts

import Foundation

/// dts language definition
public func dtsLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Device Tree"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\/(?=\\s*\\{)")
            mode.scope = .single("title.class")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("&[a-z\\d_]*\\b")
            mode.scope = .single("variable")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/[a-z][a-z\\d-]*/")
            mode.scope = .single("keyword")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*[a-zA-Z_][a-zA-Z\\d_]*:")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z_][a-zA-Z\\d_@-]*(?=\\s\\{)")
            mode.scope = .single("title.class")
            mode.relevance = 0.2
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("[a-z][a-z-,]+"), .regex("\\s*"), .regex("=")])
            mode.scope = .multi([1: "attr", 3: "operator"])
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-z][a-z-,]+(?=;)")
            mode.scope = .single("attr")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("<")
            mode.end = .regex(">")
            mode.scope = .single("params")
            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.scope = .single("number")
                    mode.relevance = 0
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\b(\\d+(\\.\\d*)?|\\.\\d+)(u|U|l|L|ul|UL|f|F)")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)")
                            return mode
                        }(),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        /* circular ref: __ref_1 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("((u8?|U)|L)?\"")
                    mode.end = .regex("\"")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(u8?|U)?R\"")
                    mode.end = .regex("\"")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'\\\\?.")
                    mode.end = .regex("'")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            mode.keywords = .grouped([
                "keyword": "if else elif endif define undef ifdef ifndef" as Any,
            ])

            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\\\\\n")
                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.end = .regex("$")
                    mode.keywords = .grouped([
                        "keyword": "include" as Any,
                    ])

                    mode.beginKeywords = "include"
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("string")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("<")
                            mode.end = .regex(">")
                            mode.scope = .single("string")
                            mode.illegal = .regex("\\n")
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_5 */ .mode(Mode()),
                /* circular ref: __ref_6 */ .mode(Mode()),
                /* circular ref: __ref_7 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\};|[;{}]")
            mode.scope = .single("punctuation")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z]\\w*::")
            return mode
        }()),
    ]

    return lang
}

/// Register dts language
public extension HighlightJS {
    func registerDts() {
        registerLanguage("dts", definition: dtsLanguage)
    }
}
