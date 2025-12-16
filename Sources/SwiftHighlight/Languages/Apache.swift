// Auto-generated from highlight.js
// Language: apache

import Foundation

/// apache language definition
public func apacheLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Apache config"

    lang.aliases = ["apacheconf"]
    lang.caseInsensitive = true
    lang.illegal = .regex("\\S")
    lang.contains = [
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("<\\/?")
            mode.end = .regex(">")
            mode.scope = .single("section")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}(:\\d{1,5})?")
                    mode.scope = .single("number")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex(":\\d{1,5}")
                    mode.scope = .single("number")
                    return mode
                }()),
                .mode(CommonModes.QUOTE_STRING_MODE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\w+")
            mode.scope = .single("attribute")
            mode.keywords = .grouped([
                "_": ["order", "deny", "allow", "setenv", "rewriterule", "rewriteengine", "rewritecond", "documentroot", "sethandler", "errordocument", "loadmodule", "options", "header", "listen", "serverroot", "servername"] as Any,
            ])

            mode.relevance = 0
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("$")
                    mode.relevance = 0
                    mode.keywords = .grouped([
                        "literal": "on off all deny allow" as Any,
                    ])

                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\\\\\n")
                            mode.scope = .single("punctuation")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\s\\[")
                            mode.end = .regex("\\]$")
                            mode.scope = .single("meta")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[\\$%]\\{")
                            mode.end = .regex("\\}")
                            mode.scope = .single("variable")
                            mode.contains = [
                                .selfReference,
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("[$%]\\d+")
                                    mode.scope = .single("number")
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\b\\d+")
                            mode.scope = .single("number")
                            return mode
                        }()),
                        .mode(CommonModes.QUOTE_STRING_MODE()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
    ]

    return lang
}

/// Register apache language
public extension HighlightJS {
    func registerApache() {
        registerLanguage("apache", definition: apacheLanguage)
    }
}
