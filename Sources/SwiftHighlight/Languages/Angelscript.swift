// Auto-generated from highlight.js
// Language: angelscript

import Foundation

/// angelscript language definition
public func angelscriptLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "AngelScript"

    lang.aliases = ["asc"]
    lang.keywords = .array(["for", "in|0", "break", "continue", "while", "do|0", "return", "if", "else", "case", "switch", "namespace", "is", "cast", "or", "and", "xor", "not", "get|0", "in", "inout|10", "out", "override", "set|0", "private", "public", "const", "default|0", "final", "shared", "external", "mixin|10", "enum", "typedef", "funcdef", "this", "super", "import", "from", "interface", "abstract|0", "try", "catch", "protected", "explicit", "property"])
    lang.illegal = .regex("(^using\\s+[A-Za-z0-9_\\.]+;$|\\bfunction\\s*[^\\(])")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            mode.illegal = .regex("\\n")
            mode.relevance = 0
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"\"\"")
            mode.end = .regex("\"\"\"")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.illegal = .regex("\\n")
            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*\\[")
            mode.end = .regex("\\]")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\{")
            mode.beginKeywords = "interface namespace"
            mode.illegal = .regex("[;.\\-]")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-zA-Z0-9_]+")
                    mode.scope = .single("symbol")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\{")
            mode.beginKeywords = "class"
            mode.illegal = .regex("[;.\\-]")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-zA-Z0-9_]+")
                    mode.scope = .single("symbol")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[:,]\\s*")
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("[a-zA-Z0-9_]+")
                                    mode.scope = .single("symbol")
                                    return mode
                                }()),
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
            mode.begin = .regex("\\b(void|bool|int8|int16|int32|int64|int|uint8|uint16|uint32|uint64|uint|string|ref|array|double|float|auto|dictionary)")
            mode.scope = .single("built_in")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("<")
                    mode.end = .regex(">")
                    mode.scope = .single("keyword")
                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[a-zA-Z0-9_]+@")
                            mode.scope = .single("symbol")
                            mode.contains = [
                                /* circular ref: __ref_2 */ .mode(Mode()),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        /* circular ref: __ref_3 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(null|true|false)")
            mode.scope = .single("literal")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(-?)(\\b0[xXbBoOdD][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?f?|\\.\\d+f?)([eE][-+]?\\d+f?)?)")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
    ]

    return lang
}

/// Register angelscript language
public extension HighlightJS {
    func registerAngelscript() {
        registerLanguage("angelscript", definition: angelscriptLanguage)
    }
}
