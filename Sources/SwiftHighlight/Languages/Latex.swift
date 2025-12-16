// Auto-generated from highlight.js
// Language: latex

import Foundation

/// latex language definition
public func latexLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "LaTeX"

    lang.aliases = ["tex"]
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\verb(?![a-zA-Z@:_])")
            mode.keywords = .grouped([
                "keyword": "\\verb" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\s+")
                    mode.relevance = 0
                    return mode
                }()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("(.|\\r?\\n)")
                            mode.end = .regex("(.|\\r?\\n)")
                            mode.scope = .single("string")
                            mode.endsParent = true
                            mode.excludeBegin = true
                            mode.excludeEnd = true
                            return mode
                        }()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\lstinline(?![a-zA-Z@:_])")
            mode.keywords = .grouped([
                "keyword": "\\lstinline" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("(.|\\r?\\n)")
                            mode.end = .regex("(.|\\r?\\n)")
                            mode.scope = .single("string")
                            mode.endsParent = true
                            mode.excludeBegin = true
                            mode.excludeEnd = true
                            return mode
                        }()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\mint(?![a-zA-Z@:_])")
            mode.keywords = .grouped([
                "keyword": "\\mint" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\mintinline(?![a-zA-Z@:_])")
            mode.keywords = .grouped([
                "keyword": "\\mintinline" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\url(?![a-zA-Z@:_])")
            mode.keywords = .grouped([
                "keyword": "\\url" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\{")
                            mode.relevance = 0
                            mode.starts = {
                                {
                                    let mode = Mode()
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.end = .regex("(?=\\})")
                                            mode.scope = .single("link")
                                            mode.endsParent = true
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\{")
                                                    mode.end = .regex("\\}")
                                                    mode.relevance = 0
                                                    mode.contains = [
                                                        .selfReference,
                                                    ]
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()
                            }()
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\{")
                            mode.relevance = 0
                            mode.starts = {
                                {
                                    let mode = Mode()
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.end = .regex("(?=\\})")
                                            mode.scope = .single("link")
                                            mode.endsParent = true
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\{")
                                                    mode.end = .regex("\\}")
                                                    mode.relevance = 0
                                                    mode.contains = [
                                                        .selfReference,
                                                    ]
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()
                            }()
                            return mode
                        }()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\hyperref(?![a-zA-Z@:_])")
            mode.keywords = .grouped([
                "keyword": "\\hyperref" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\{")
                            mode.relevance = 0
                            mode.starts = {
                                {
                                    let mode = Mode()
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.end = .regex("(?=\\})")
                                            mode.scope = .single("link")
                                            mode.endsParent = true
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\{")
                                                    mode.end = .regex("\\}")
                                                    mode.relevance = 0
                                                    mode.contains = [
                                                        .selfReference,
                                                    ]
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()
                            }()
                            return mode
                        }()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\href(?![a-zA-Z@:_])")
            mode.keywords = .grouped([
                "keyword": "\\href" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\begin(?=[ \t]*(\\r?\\n[ \t]*)?\\{verbatim\\})")
            mode.keywords = .grouped([
                "keyword": "\\begin" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\begin(?=[ \t]*(\\r?\\n[ \t]*)?\\{filecontents\\})")
            mode.keywords = .grouped([
                "keyword": "\\begin" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\begin(?=[ \t]*(\\r?\\n[ \t]*)?\\{Verbatim\\})")
            mode.keywords = .grouped([
                "keyword": "\\begin" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\begin(?=[ \t]*(\\r?\\n[ \t]*)?\\{BVerbatim\\})")
            mode.keywords = .grouped([
                "keyword": "\\begin" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\begin(?=[ \t]*(\\r?\\n[ \t]*)?\\{LVerbatim\\})")
            mode.keywords = .grouped([
                "keyword": "\\begin" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\begin(?=[ \t]*(\\r?\\n[ \t]*)?\\{verbatim\\*\\})")
            mode.keywords = .grouped([
                "keyword": "\\begin" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\begin(?=[ \t]*(\\r?\\n[ \t]*)?\\{filecontents\\*\\})")
            mode.keywords = .grouped([
                "keyword": "\\begin" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\begin(?=[ \t]*(\\r?\\n[ \t]*)?\\{Verbatim\\*\\})")
            mode.keywords = .grouped([
                "keyword": "\\begin" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\begin(?=[ \t]*(\\r?\\n[ \t]*)?\\{BVerbatim\\*\\})")
            mode.keywords = .grouped([
                "keyword": "\\begin" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\begin(?=[ \t]*(\\r?\\n[ \t]*)?\\{LVerbatim\\*\\})")
            mode.keywords = .grouped([
                "keyword": "\\begin" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\begin(?=[ \t]*(\\r?\\n[ \t]*)?\\{minted\\})")
            mode.keywords = .grouped([
                "keyword": "\\begin" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_13 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_9 */ .mode(Mode()),
        /* circular ref: __ref_10 */ .mode(Mode()),
        /* circular ref: __ref_11 */ .mode(Mode()),
        /* circular ref: __ref_12 */ .mode(Mode()),
    ]

    return lang
}

/// Register latex language
public extension HighlightJS {
    func registerLatex() {
        registerLanguage("latex", definition: latexLanguage)
    }
}
