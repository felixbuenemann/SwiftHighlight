// Auto-generated from highlight.js
// Language: http

import Foundation

/// http language definition
public func httpLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "HTTP"

    lang.aliases = ["https"]
    lang.illegal = .regex("\\S")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^(?=HTTP/([32]|1\\.[01]) \\d{3})")
            mode.end = .regex("$")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("HTTP/([32]|1\\.[01])")
                    mode.scope = .single("meta")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\b\\d{3}\\b")
                    mode.scope = .single("number")
                    return mode
                }()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("\\b\\B")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("^/[A-Za-z][A-Za-z0-9-]*/(?=\\:\\s)")
                            mode.scope = .single("attribute")
                            mode.starts = {
                                {
                                    let mode = Mode()
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex(": ")
                                            mode.scope = .single("punctuation")
                                            mode.relevance = 0
                                            mode.starts = {
                                                {
                                                    let mode = Mode()
                                                    mode.end = .regex("$")
                                                    mode.relevance = 0
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
                            mode.begin = .regex("\\n\\n")
                            mode.starts = {
                                {
                                    let mode = Mode()
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
            mode.begin = .regex("(?=^[A-Z]+ (.*?) HTTP/([32]|1\\.[01])$)")
            mode.end = .regex("$")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex(" ")
                    mode.end = .regex(" ")
                    mode.scope = .single("string")
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("HTTP/([32]|1\\.[01])")
                    mode.scope = .single("meta")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[A-Z]+")
                    mode.scope = .single("keyword")
                    return mode
                }()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("\\b\\B")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^/[A-Za-z][A-Za-z0-9-]*/(?=\\:\\s)")
            mode.scope = .single("attribute")
            mode.relevance = 0
            mode.starts = {
                {
                    let mode = Mode()
                    return mode
                }()
            }()
            return mode
        }()),
    ]

    return lang
}

/// Register http language
public extension HighlightJS {
    func registerHttp() {
        registerLanguage("http", definition: httpLanguage)
    }
}
