// Auto-generated from highlight.js
// Language: elixir

import Foundation

/// elixir language definition
public func elixirLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Elixir"

    lang.aliases = ["ex", "exs"]
    lang.keywords = .grouped([
        "keyword": ["after", "alias", "and", "case", "catch", "cond", "defstruct", "defguard", "defguardp", "do", "else", "end", "fn", "for", "if", "import", "in", "not", "or", "quote", "raise", "receive", "require", "reraise", "rescue", "try", "unless", "unquote", "unquote_splicing", "use", "when", "with|0"] as Any,
        "literal": ["false", "nil", "true"] as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\?'")
            mode.scope = .single("string")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("#\\{")
                    mode.end = .regex("\\}")
                    mode.scope = .single("subst")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_0" as Any,
                    ])

                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("regex")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("~r(?=[/|([{<\"'])")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\"")
                                            mode.end = .regex("/\"//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//\"/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\\\[\\s\\S]")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                                /* circular ref: __ref_3 */ .mode(Mode()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("'")
                                            mode.end = .regex("/'//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//'/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                                /* circular ref: __ref_4 */ .mode(Mode()),
                                                /* circular ref: __ref_3 */ .mode(Mode()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\/")
                                            mode.end = .regex("/\\///[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//\\//")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                                /* circular ref: __ref_4 */ .mode(Mode()),
                                                /* circular ref: __ref_3 */ .mode(Mode()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\|")
                                            mode.end = .regex("/\\|//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//\\|/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                                /* circular ref: __ref_4 */ .mode(Mode()),
                                                /* circular ref: __ref_3 */ .mode(Mode()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\(")
                                            mode.end = .regex("/\\)//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//\\)/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                                /* circular ref: __ref_4 */ .mode(Mode()),
                                                /* circular ref: __ref_3 */ .mode(Mode()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\[")
                                            mode.end = .regex("/\\]//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//\\]/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                                /* circular ref: __ref_4 */ .mode(Mode()),
                                                /* circular ref: __ref_3 */ .mode(Mode()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\{")
                                            mode.end = .regex("/\\}//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//\\}/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                                /* circular ref: __ref_4 */ .mode(Mode()),
                                                /* circular ref: __ref_3 */ .mode(Mode()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("<")
                                            mode.end = .regex("/>//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//>/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                                /* circular ref: __ref_4 */ .mode(Mode()),
                                                /* circular ref: __ref_3 */ .mode(Mode()),
                                            ]
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("~R(?=[/|([{<\"'])")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\"")
                                            mode.end = .regex("/\"//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//\"/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("'")
                                            mode.end = .regex("/'//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//'/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\/")
                                            mode.end = .regex("/\\///[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//\\//")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\|")
                                            mode.end = .regex("/\\|//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//\\|/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\(")
                                            mode.end = .regex("/\\)//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//\\)/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\[")
                                            mode.end = .regex("/\\]//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//\\]/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\{")
                                            mode.end = .regex("/\\}//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//\\}/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("<")
                                            mode.end = .regex("/>//[uismxfU]{0,7}/")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("/\\\\//>/")
                                                    mode.scope = .single("char.escape")
                                                    mode.relevance = 0
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("~[A-Z](?=[/|([{<\"'])")
                            mode.scope = .single("string")
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\"")
                                    mode.end = .regex("\"")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//\"/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("'")
                                    mode.end = .regex("'")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//'/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\/")
                                    mode.end = .regex("\\/")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//\\//")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\|")
                                    mode.end = .regex("\\|")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//\\|/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\(")
                                    mode.end = .regex("\\)")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//\\)/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\[")
                                    mode.end = .regex("\\]")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//\\]/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\{")
                                    mode.end = .regex("\\}")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//\\}/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("<")
                                    mode.end = .regex(">")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//>/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("~[a-z](?=[/|([{<\"'])")
                            mode.scope = .single("string")
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\"")
                                    mode.end = .regex("\"")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//\"/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("'")
                                    mode.end = .regex("'")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//'/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\/")
                                    mode.end = .regex("\\/")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//\\//")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\|")
                                    mode.end = .regex("\\|")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//\\|/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\(")
                                    mode.end = .regex("\\)")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//\\)/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\[")
                                    mode.end = .regex("\\]")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//\\]/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\{")
                                    mode.end = .regex("\\}")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//\\}/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("<")
                                    mode.end = .regex(">")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("/\\\\//>/")
                                            mode.scope = .single("char.escape")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                        .mode(CommonModes.HASH_COMMENT_MODE()),
                        .mode({
                            let mode = Mode()
                            mode.end = .regex("\\bdo\\b|$|;")
                            mode.scope = .single("class")
                            mode.beginKeywords = "defimpl defmodule defprotocol defrecord"
                            mode.contains = [
                                .mode(CommonModes.TITLE_MODE()),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.end = .regex("\\B\\b")
                            mode.scope = .single("function")
                            mode.beginKeywords = "def defp defmacro defmacrop"
                            mode.contains = [
                                /* circular ref: __ref_5 */ .mode(Mode()),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("::")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex(":(?![\\s:])")
                            mode.scope = .single("symbol")
                            mode.relevance = 0
                            mode.contains = [
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("[a-zA-Z_]\\w*[!?=]?|[-+~]@|<<|>>|=~|===?|<=>|[<>]=?|\\*\\*|[-/+%^&*~`|]|\\[\\]=?")
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[a-zA-Z_][a-zA-Z0-9_.]*(!|\\?)?:(?!:)")
                            mode.scope = .single("symbol")
                            mode.relevance = 0
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("(\\b[A-Z][a-zA-Z0-9_]+)")
                            mode.scope = .single("title.class")
                            mode.relevance = 0
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("(\\b0o[0-7_]+)|(\\b0b[01_]+)|(\\b0x[0-9a-fA-F_]+)|(-?\\b[0-9][0-9_]*(\\.[0-9_]+([eE][-+]?[0-9]+)?)?)")
                            mode.scope = .single("number")
                            mode.relevance = 0
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("(\\$\\W)|((\\$|@@?)(\\w+))")
                            mode.scope = .single("variable")
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\"\"\"")
                    mode.end = .regex("\"\"\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'''")
                    mode.end = .regex("'''")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("~S\"\"\"")
                    mode.end = .regex("\"\"\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("~S\"")
                    mode.end = .regex("\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("~S'''")
                    mode.end = .regex("'''")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("~S'")
                    mode.end = .regex("'")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    return mode
                }(),
            ]
            return mode
        }()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_9 */ .mode(Mode()),
        /* circular ref: __ref_10 */ .mode(Mode()),
        /* circular ref: __ref_11 */ .mode(Mode()),
        /* circular ref: __ref_12 */ .mode(Mode()),
        /* circular ref: __ref_13 */ .mode(Mode()),
        /* circular ref: __ref_14 */ .mode(Mode()),
        /* circular ref: __ref_15 */ .mode(Mode()),
        /* circular ref: __ref_16 */ .mode(Mode()),
        /* circular ref: __ref_17 */ .mode(Mode()),
    ]

    return lang
}

/// Register elixir language
public extension HighlightJS {
    func registerElixir() {
        registerLanguage("elixir", definition: elixirLanguage)
    }
}
