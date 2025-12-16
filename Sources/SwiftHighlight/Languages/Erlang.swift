// Auto-generated from highlight.js
// Language: erlang

import Foundation

/// erlang language definition
public func erlangLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Erlang"

    lang.aliases = ["erl"]
    lang.keywords = .grouped([
        "keyword": "after and andalso|10 band begin bnot bor bsl bzr bxor case catch cond div end fun if let not of orelse|10 query receive rem try when xor maybe else" as Any,
        "literal": "false true" as Any,
    ])
    lang.illegal = .regex("(</|\\*=|\\+=|-=|/\\*|\\*/|\\(\\*|\\*\\))")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[a-z'][a-zA-Z0-9_']*\\s*\\(")
            mode.end = .regex("->")
            mode.scope = .single("function")
            mode.illegal = .regex("\\(|#|//|/\\*|\\\\|:|;")
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.contains = [
                        .mode(CommonModes.COMMENT("%", "$")),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("fun\\s+[a-z'][a-zA-Z0-9_']*/\\d+")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.end = .regex("end")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_0" as Any,
                            ])

                            mode.beginKeywords = "fun receive if try case maybe"
                            mode.contains = [
                                /* circular ref: __ref_1 */ .mode(Mode()),
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                .mode(CommonModes.APOS_STRING_MODE()),
                                /* circular ref: __ref_3 */ .mode(Mode()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("([a-z'][a-zA-Z0-9_']*:[a-z'][a-zA-Z0-9_']*|[a-z'][a-zA-Z0-9_']*)\\(")
                                    mode.end = .regex("\\)")
                                    mode.relevance = 0
                                    mode.returnBegin = true
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("([a-z'][a-zA-Z0-9_']*:[a-z'][a-zA-Z0-9_']*|[a-z'][a-zA-Z0-9_']*)")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\(")
                                            mode.end = .regex("\\)")
                                            mode.relevance = 0
                                            mode.endsWithParent = true
                                            mode.returnEnd = true
                                            mode.contains = [
                                                /* circular ref: __ref_1 */ .mode(Mode()),
                                                /* circular ref: __ref_2 */ .mode(Mode()),
                                                /* circular ref: __ref_3 */ .mode(Mode()),
                                                /* circular ref: __ref_4 */ .mode(Mode()),
                                                .mode({
                                                    let mode = Mode()
                                                    mode.scope = .single("string")
                                                    mode.contains = [
                                                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                                                    ]
                                                    mode.variants = [
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("~\\w?\"\"\"(\"*)(?!\")[\\s\\S]*?\"\"\"\\1")
                                                            return mode
                                                        }(),
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("~\\w?\\(")
                                                            mode.end = .regex("\\)")
                                                            return mode
                                                        }(),
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("~\\w?\\[")
                                                            mode.end = .regex("\\]")
                                                            return mode
                                                        }(),
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("~\\w?{")
                                                            mode.end = .regex("}")
                                                            return mode
                                                        }(),
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("~\\w?<")
                                                            mode.end = .regex(">")
                                                            return mode
                                                        }(),
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("~\\w?\\/")
                                                            mode.end = .regex("\\/")
                                                            return mode
                                                        }(),
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("~\\w?\\|")
                                                            mode.end = .regex("\\|")
                                                            return mode
                                                        }(),
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("~\\w?'")
                                                            mode.end = .regex("'")
                                                            return mode
                                                        }(),
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("~\\w?\"")
                                                            mode.end = .regex("\"")
                                                            return mode
                                                        }(),
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("~\\w?`")
                                                            mode.end = .regex("`")
                                                            return mode
                                                        }(),
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("~\\w?#")
                                                            mode.end = .regex("#")
                                                            return mode
                                                        }(),
                                                    ]
                                                    return mode
                                                }()),
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\"\"\"(\"*)(?!\")[\\s\\S]*?\"\"\"\\1")
                                                    mode.scope = .single("string")
                                                    return mode
                                                }()),
                                                .mode(CommonModes.QUOTE_STRING_MODE()),
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\b(\\d+(_\\d+)*#[a-fA-F0-9]+(_[a-fA-F0-9]+)*|\\d+(_\\d+)*(\\.\\d+(_\\d+)*)?([eE][-+]?\\d+)?)")
                                                    mode.scope = .single("number")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\{")
                                                    mode.end = .regex("\\}")
                                                    mode.relevance = 0
                                                    mode.contains = [
                                                        /* circular ref: __ref_1 */ .mode(Mode()),
                                                        /* circular ref: __ref_2 */ .mode(Mode()),
                                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                                        /* circular ref: __ref_5 */ .mode(Mode()),
                                                        /* circular ref: __ref_6 */ .mode(Mode()),
                                                        /* circular ref: __ref_7 */ .mode(Mode()),
                                                        /* circular ref: __ref_8 */ .mode(Mode()),
                                                        /* circular ref: __ref_9 */ .mode(Mode()),
                                                        .mode({
                                                            let mode = Mode()
                                                            mode.begin = .regex("\\b_([A-Z][A-Za-z0-9_]*)?")
                                                            mode.relevance = 0
                                                            return mode
                                                        }()),
                                                        .mode({
                                                            let mode = Mode()
                                                            mode.begin = .regex("[A-Z][a-zA-Z0-9_]*")
                                                            mode.relevance = 0
                                                            return mode
                                                        }()),
                                                        .mode({
                                                            let mode = Mode()
                                                            mode.begin = .regex("#[a-zA-Z_]\\w*")
                                                            mode.relevance = 0
                                                            mode.returnBegin = true
                                                            mode.contains = [
                                                                .mode({
                                                                    let mode = Mode()
                                                                    mode.begin = .regex("#[a-zA-Z_]\\w*")
                                                                    mode.relevance = 0
                                                                    return mode
                                                                }()),
                                                                .mode({
                                                                    let mode = Mode()
                                                                    mode.begin = .regex("\\{")
                                                                    mode.end = .regex("\\}")
                                                                    mode.relevance = 0
                                                                    mode.contains = [
                                                                        /* circular ref: __ref_1 */ .mode(Mode()),
                                                                        /* circular ref: __ref_2 */ .mode(Mode()),
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
                                                                            mode.begin = .regex("\\$(\\\\([^0-9]|[0-9]{1,3}|)|.)")
                                                                            mode.scope = .single("string")
                                                                            return mode
                                                                        }()),
                                                                    ]
                                                                    return mode
                                                                }()),
                                                            ]
                                                            return mode
                                                        }()),
                                                        /* circular ref: __ref_13 */ .mode(Mode()),
                                                    ]
                                                    return mode
                                                }()),
                                                /* circular ref: __ref_10 */ .mode(Mode()),
                                                /* circular ref: __ref_11 */ .mode(Mode()),
                                                /* circular ref: __ref_12 */ .mode(Mode()),
                                                /* circular ref: __ref_13 */ .mode(Mode()),
                                            ]
                                            return mode
                                        }()),
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
                                /* circular ref: __ref_13 */ .mode(Mode()),
                            ]
                            return mode
                        }()),
                        /* circular ref: __ref_4 */ .mode(Mode()),
                        /* circular ref: __ref_5 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                        /* circular ref: __ref_7 */ .mode(Mode()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                        /* circular ref: __ref_9 */ .mode(Mode()),
                        /* circular ref: __ref_10 */ .mode(Mode()),
                        /* circular ref: __ref_11 */ .mode(Mode()),
                        /* circular ref: __ref_12 */ .mode(Mode()),
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                .mode(CommonModes.TITLE_MODE()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex(";|\\.")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_0" as Any,
                    ])

                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
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
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        /* circular ref: __ref_1 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^-")
            mode.end = .regex("\\.")
            mode.keywords = .grouped([
                "keyword": "-module|1.5 -record|1.5 -undef|1.5 -export|1.5 -ifdef|1.5 -ifndef|1.5 -author|1.5 -copyright|1.5 -doc|1.5 -moduledoc|1.5 -vsn|1.5 -import|1.5 -include|1.5 -include_lib|1.5 -compile|1.5 -define|1.5 -else|1.5 -endif|1.5 -file|1.5 -behaviour|1.5 -behavior|1.5 -spec|1.5 -on_load|1.5 -nifs|1.5" as Any,
            ])

            mode.relevance = 0
            mode.excludeEnd = true
            mode.returnBegin = true
            mode.contains = [
                /* circular ref: __ref_14 */ .mode(Mode()),
                /* circular ref: __ref_5 */ .mode(Mode()),
                /* circular ref: __ref_6 */ .mode(Mode()),
                /* circular ref: __ref_7 */ .mode(Mode()),
            ]
            return mode
        }()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_5 */ .mode(Mode()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_12 */ .mode(Mode()),
        /* circular ref: __ref_10 */ .mode(Mode()),
        /* circular ref: __ref_11 */ .mode(Mode()),
        /* circular ref: __ref_9 */ .mode(Mode()),
        /* circular ref: __ref_13 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\.$")
            return mode
        }()),
    ]

    return lang
}

/// Register erlang language
public extension HighlightJS {
    func registerErlang() {
        registerLanguage("erlang", definition: erlangLanguage)
    }
}
