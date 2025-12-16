// Auto-generated from highlight.js
// Language: actionscript

import Foundation

/// actionscript language definition
public func actionscriptLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "ActionScript"

    lang.aliases = ["as"]
    lang.keywords = .grouped([
        "keyword": ["as", "break", "case", "catch", "class", "const", "continue", "default", "delete", "do", "dynamic", "each", "else", "extends", "final", "finally", "for", "function", "get", "if", "implements", "import", "in", "include", "instanceof", "interface", "internal", "is", "namespace", "native", "new", "override", "package", "private", "protected", "public", "return", "set", "static", "super", "switch", "this", "throw", "try", "typeof", "use", "var", "void", "while", "with"] as Any,
        "literal": ["true", "false", "null", "undefined"] as Any,
    ])
    lang.illegal = .regex("#")
    lang.contains = [
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("\\bpackage"), .regex("\\s+"), .regex("/[a-zA-Z_$][a-zA-Z0-9_$]*/(\\./[a-zA-Z_$][a-zA-Z0-9_$]*/)*")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("\\b(?:class|interface|extends|implements)"), .regex("\\s+"), .regex("[a-zA-Z_$][a-zA-Z0-9_$]*")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex(";")
            mode.scope = .single("meta")
            mode.keywords = .grouped([
                "keyword": "import include" as Any,
            ])

            mode.beginKeywords = "import include"
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[{;]")
            mode.beginKeywords = "function"
            mode.illegal = .regex("\\S")
            mode.excludeEnd = true
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[.]{3}")
                            mode.end = .regex("[a-zA-Z_$][a-zA-Z0-9_$]*")
                            mode.scope = .single("rest_arg")
                            mode.relevance = 10
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("/:\\s*//([*]|[a-zA-Z_$][a-zA-Z0-9_$]*)/")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode(Mode()),
    ]

    return lang
}

/// Register actionscript language
public extension HighlightJS {
    func registerActionscript() {
        registerLanguage("actionscript", definition: actionscriptLanguage)
    }
}
