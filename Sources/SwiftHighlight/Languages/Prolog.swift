// Auto-generated from highlight.js
// Language: prolog

import Foundation

/// prolog language definition
public func prologLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Prolog"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-z][A-Za-z0-9_]*")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("symbol")
            mode.relevance = 0
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("[A-Z][a-zA-Z0-9_]*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("_[A-Za-z0-9_]*")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\(")
            mode.end = .regex("\\)")
            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_2 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex(":-")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\[")
                    mode.end = .regex("\\]")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        /* circular ref: __ref_4 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("%")
                            mode.end = .regex("$")
                            mode.scope = .single("comment")
                            mode.contains = [
                                .mode(Mode()),
                            ]
                            return mode
                        }()),
                        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
                        .mode(CommonModes.QUOTE_STRING_MODE()),
                        .mode(CommonModes.APOS_STRING_MODE()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("`")
                            mode.end = .regex("`")
                            mode.scope = .single("string")
                            mode.contains = [
                                .mode(CommonModes.BACKSLASH_ESCAPE()),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("0'(\\\\'|.)")
                            mode.scope = .single("string")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("0'\\\\s")
                            mode.scope = .single("string")
                            return mode
                        }()),
                        .mode(CommonModes.C_NUMBER_MODE()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_5 */ .mode(Mode()),
                /* circular ref: __ref_6 */ .mode(Mode()),
                /* circular ref: __ref_7 */ .mode(Mode()),
                /* circular ref: __ref_8 */ .mode(Mode()),
                /* circular ref: __ref_9 */ .mode(Mode()),
                /* circular ref: __ref_10 */ .mode(Mode()),
                /* circular ref: __ref_11 */ .mode(Mode()),
                /* circular ref: __ref_12 */ .mode(Mode()),
            ]
            return mode
        }()),
        /* circular ref: __ref_3 */ .mode(Mode()),
        /* circular ref: __ref_4 */ .mode(Mode()),
        /* circular ref: __ref_5 */ .mode(Mode()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_9 */ .mode(Mode()),
        /* circular ref: __ref_10 */ .mode(Mode()),
        /* circular ref: __ref_11 */ .mode(Mode()),
        /* circular ref: __ref_12 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\.$")
            return mode
        }()),
    ]

    return lang
}

/// Register prolog language
public extension HighlightJS {
    func registerProlog() {
        registerLanguage("prolog", definition: prologLanguage)
    }
}
