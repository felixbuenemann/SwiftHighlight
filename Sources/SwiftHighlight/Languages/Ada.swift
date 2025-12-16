// Auto-generated from highlight.js
// Language: ada

import Foundation

/// ada language definition
public func adaLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Ada"

    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": ["abort", "else", "new", "return", "abs", "elsif", "not", "reverse", "abstract", "end", "accept", "entry", "select", "access", "exception", "of", "separate", "aliased", "exit", "or", "some", "all", "others", "subtype", "and", "for", "out", "synchronized", "array", "function", "overriding", "at", "tagged", "generic", "package", "task", "begin", "goto", "pragma", "terminate", "body", "private", "then", "if", "procedure", "type", "case", "in", "protected", "constant", "interface", "is", "raise", "use", "declare", "range", "delay", "limited", "record", "when", "delta", "loop", "rem", "while", "digits", "renames", "with", "do", "mod", "requeue", "xor", "parallel"] as Any,
        "literal": ["True", "False"] as Any,
    ])
    lang.contains = [
        .mode(CommonModes.COMMENT("--", "$")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\"\"")
                    mode.relevance = 0
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'.'")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(\\d(_|\\d)*#\\w+(\\.\\w+)?#([eE][-+]?\\d(_|\\d)*)?|\\d(_|\\d)*(\\.\\d(_|\\d)*)?([eE][-+]?\\d(_|\\d)*)?)")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'[A-Za-z](_?[A-Za-z0-9.])*")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(\\bwith\\s+)?(\\bprivate\\s+)?\\bpackage\\s+(\\bbody\\s+)?")
            mode.end = .regex("(is|$)")
            mode.scope = .single("title")
            mode.keywords = .simple("package body")

            mode.illegal = .regex("\\{\\}%#'\"")
            mode.excludeBegin = true
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(\\b(with|overriding)\\s+)?\\b(function|procedure)\\s+")
            mode.end = .regex("(\\bis|\\bwith|\\brenames|\\)\\s*;)")
            mode.keywords = .simple("overriding function procedure with is renames return")

            mode.returnBegin = true
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("(\\bwith\\s+)?\\b(function|procedure)\\s+")
                    mode.end = .regex("(\\(|\\s+|$)")
                    mode.scope = .single("title")
                    mode.illegal = .regex("\\{\\}%#'\"")
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\s+:\\s+")
                    mode.end = .regex("\\s*(:=|;|\\)|=>|$)")
                    mode.illegal = .regex("\\{\\}%#'\"")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.beginKeywords = "loop for declare others"
                            mode.endsParent = true
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("keyword")
                            mode.beginKeywords = "not null constant access function procedure in out aliased exception"
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[A-Za-z](_?[A-Za-z0-9.])*")
                            mode.scope = .single("type")
                            mode.relevance = 0
                            mode.endsParent = true
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\breturn\\s+")
                    mode.end = .regex("(\\s+|;|$)")
                    mode.scope = .single("type")
                    mode.keywords = .simple("return")

                    mode.illegal = .regex("\\{\\}%#'\"")
                    mode.endsParent = true
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(sub)?type\\s+")
            mode.end = .regex("\\s+")
            mode.scope = .single("type")
            mode.keywords = .simple("type")

            mode.illegal = .regex("\\{\\}%#'\"")
            mode.excludeBegin = true
            return mode
        }()),
        /* circular ref: __ref_1 */ .mode(Mode()),
    ]

    return lang
}

/// Register ada language
public extension HighlightJS {
    func registerAda() {
        registerLanguage("ada", definition: adaLanguage)
    }
}
