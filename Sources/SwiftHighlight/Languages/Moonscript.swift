// Auto-generated from highlight.js
// Language: moonscript

import Foundation

/// moonscript language definition
public func moonscriptLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "MoonScript"

    lang.aliases = ["moon"]
    lang.keywords = .grouped([
        "keyword": "if then not for in while do return else elseif break continue switch and or unless when class extends super local import export from using" as Any,
        "literal": "true false nil" as Any,
        "built_in": "_G _VERSION assert collectgarbage dofile error getfenv getmetatable ipairs load loadfile loadstring module next pairs pcall print rawequal rawget rawset require select setfenv setmetatable tonumber tostring type unpack xpcall coroutine debug io math os package string table" as Any,
    ])
    lang.illegal = .regex("\\/\\*")
    lang.contains = [
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("#\\{")
                            mode.end = .regex("\\}")
                            mode.scope = .single("subst")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_1" as Any,
                            ])

                            mode.contains = [
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                /* circular ref: __ref_3 */ .mode(Mode()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("@__[a-zA-Z]\\w*")
                                    mode.scope = .single("built_in")
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("@[a-zA-Z]\\w*")
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("[a-zA-Z]\\w*\\\\[a-zA-Z]\\w*")
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
        /* circular ref: __ref_4 */ .mode(Mode()),
        /* circular ref: __ref_5 */ .mode(Mode()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        .mode(CommonModes.COMMENT("--", "$")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*[A-Za-z$_][0-9A-Za-z$_]*\\s*=\\s*(\\(.*\\)\\s*)?\\B[-=]>")
            mode.end = .regex("[-=]>")
            mode.scope = .single("function")
            mode.returnBegin = true
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\([^\\(]")
                    mode.scope = .single("params")
                    mode.returnBegin = true
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\(")
                            mode.end = .regex("\\)")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_1" as Any,
                            ])

                            mode.contains = [
                                .selfReference,
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                /* circular ref: __ref_3 */ .mode(Mode()),
                                /* circular ref: __ref_4 */ .mode(Mode()),
                                /* circular ref: __ref_5 */ .mode(Mode()),
                                /* circular ref: __ref_6 */ .mode(Mode()),
                            ]
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
            mode.begin = .regex("[\\(,:=]\\s*")
            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("(\\(.*\\)\\s*)?\\B[-=]>")
                    mode.end = .regex("[-=]>")
                    mode.scope = .single("function")
                    mode.returnBegin = true
                    mode.contains = [
                        /* circular ref: __ref_7 */ .mode(Mode()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("$")
            mode.scope = .single("class")
            mode.beginKeywords = "class"
            mode.illegal = .regex("[:=\"\\[\\]]")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.beginKeywords = "extends"
                    mode.illegal = .regex("[:=\"\\[\\]]")
                    mode.endsWithParent = true
                    mode.contains = [
                        /* circular ref: __ref_8 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_8 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[A-Za-z$_][0-9A-Za-z$_]*:")
            mode.end = .regex(":")
            mode.scope = .single("name")
            mode.relevance = 0
            mode.returnBegin = true
            mode.returnEnd = true
            return mode
        }()),
    ]

    return lang
}

/// Register moonscript language
public extension HighlightJS {
    func registerMoonscript() {
        registerLanguage("moonscript", definition: moonscriptLanguage)
    }
}
