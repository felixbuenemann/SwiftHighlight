// Auto-generated from highlight.js
// Language: csharp

import Foundation

/// csharp language definition
public func csharpLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "C#"

    lang.aliases = ["cs", "c#"]
    lang.keywords = .grouped([
        "keyword": ["abstract", "as", "base", "break", "case", "catch", "class", "const", "continue", "do", "else", "event", "explicit", "extern", "finally", "fixed", "for", "foreach", "goto", "if", "implicit", "in", "interface", "internal", "is", "lock", "namespace", "new", "operator", "out", "override", "params", "private", "protected", "public", "readonly", "record", "ref", "return", "scoped", "sealed", "sizeof", "stackalloc", "static", "struct", "switch", "this", "throw", "try", "typeof", "unchecked", "unsafe", "using", "virtual", "void", "volatile", "while", "add", "alias", "and", "ascending", "args", "async", "await", "by", "descending", "dynamic", "equals", "file", "from", "get", "global", "group", "init", "into", "join", "let", "nameof", "not", "notnull", "on", "or", "orderby", "partial", "record", "remove", "required", "scoped", "select", "set", "unmanaged", "value|0", "var", "when", "where", "with", "yield"] as Any,
        "built_in": ["bool", "byte", "char", "decimal", "delegate", "double", "dynamic", "enum", "float", "int", "long", "nint", "nuint", "object", "sbyte", "short", "string", "ulong", "uint", "ushort"] as Any,
        "literal": ["default", "false", "null", "true"] as Any,
    ])
    lang.illegal = .regex("::")
    lang.contains = [
        .mode(CommonModes.COMMENT("///", "$")),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            mode.keywords = .grouped([
                "keyword": "if else elif endif define undef warning error line region endregion pragma checksum" as Any,
            ])

            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\"\"\"(\"*)(?!\")(.|\\n)*?\"\"\"\\1")
                    mode.scope = .single("string")
                    mode.relevance = 1
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\$@\"")
                    mode.end = .regex("\"")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\{\\{")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\}\\}")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\"\"")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\{")
                            mode.end = .regex("\\}")
                            mode.scope = .single("subst")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_0" as Any,
                            ])

                            mode.contains = [
                                /* circular ref: __ref_1 */ .mode(Mode()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\$\"")
                                    mode.end = .regex("\"")
                                    mode.scope = .single("string")
                                    mode.illegal = .regex("\\n")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\{\\{")
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\}\\}")
                                            return mode
                                        }()),
                                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\{")
                                            mode.end = .regex("\\}")
                                            mode.scope = .single("subst")
                                            mode.keywords = .grouped([
                                                "__circularRef": "__ref_0" as Any,
                                            ])

                                            mode.illegal = .regex("\\n")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\$@\"")
                                                    mode.end = .regex("\"")
                                                    mode.scope = .single("string")
                                                    mode.illegal = .regex("\\n")
                                                    mode.contains = [
                                                        .mode({
                                                            let mode = Mode()
                                                            mode.begin = .regex("\\{\\{")
                                                            return mode
                                                        }()),
                                                        .mode({
                                                            let mode = Mode()
                                                            mode.begin = .regex("\\}\\}")
                                                            return mode
                                                        }()),
                                                        .mode({
                                                            let mode = Mode()
                                                            mode.begin = .regex("\"\"")
                                                            return mode
                                                        }()),
                                                        /* circular ref: __ref_2 */ .mode(Mode()),
                                                    ]
                                                    return mode
                                                }()),
                                                /* circular ref: __ref_3 */ .mode(Mode()),
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("@\"")
                                                    mode.end = .regex("\"")
                                                    mode.scope = .single("string")
                                                    mode.illegal = .regex("\\n")
                                                    mode.contains = [
                                                        .mode({
                                                            let mode = Mode()
                                                            mode.begin = .regex("\"\"")
                                                            return mode
                                                        }()),
                                                    ]
                                                    return mode
                                                }()),
                                                .mode(CommonModes.APOS_STRING_MODE()),
                                                .mode(CommonModes.QUOTE_STRING_MODE()),
                                                .mode({
                                                    let mode = Mode()
                                                    mode.scope = .single("number")
                                                    mode.relevance = 0
                                                    mode.variants = [
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("\\b(0b[01']+)")
                                                            return mode
                                                        }(),
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("(-?)\\b([\\d']+(\\.[\\d']*)?|\\.[\\d']+)(u|U|l|L|ul|UL|f|F|b|B)")
                                                            return mode
                                                        }(),
                                                        {
                                                            let mode = Mode()
                                                            mode.begin = .regex("(-?)(\\b0[xX][a-fA-F0-9'_]+|(\\b[\\d'_]+(\\.[\\d'_]*)?|\\.[\\d'_]+)([eE][-+]?[\\d'_]+)?)")
                                                            return mode
                                                        }(),
                                                    ]
                                                    return mode
                                                }()),
                                                .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
                                            ]
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("@\"")
                                    mode.end = .regex("\"")
                                    mode.scope = .single("string")
                                    mode.contains = [
                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                                /* circular ref: __ref_5 */ .mode(Mode()),
                                /* circular ref: __ref_6 */ .mode(Mode()),
                                /* circular ref: __ref_7 */ .mode(Mode()),
                                /* circular ref: __ref_8 */ .mode(Mode()),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    return mode
                }(),
                {
                    let mode = Mode()
                    return mode
                }(),
                {
                    let mode = Mode()
                    return mode
                }(),
                {
                    let mode = Mode()
                    return mode
                }(),
            ]
            return mode
        }()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[{;=]")
            mode.beginKeywords = "class interface"
            mode.illegal = .regex("[^\\s:,]")
            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.beginKeywords = "where class"
                    return mode
                }()),
                .mode(CommonModes.TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("<")
                    mode.end = .regex(">")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.beginKeywords = "in out"
                            return mode
                        }()),
                        /* circular ref: __ref_10 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_11 */ .mode(Mode()),
                /* circular ref: __ref_8 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[{;=]")
            mode.beginKeywords = "namespace"
            mode.illegal = .regex("[^\\s:]")
            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_10 */ .mode(Mode()),
                /* circular ref: __ref_11 */ .mode(Mode()),
                /* circular ref: __ref_8 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[{;=]")
            mode.beginKeywords = "record"
            mode.illegal = .regex("[^\\s:]")
            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_10 */ .mode(Mode()),
                /* circular ref: __ref_12 */ .mode(Mode()),
                /* circular ref: __ref_11 */ .mode(Mode()),
                /* circular ref: __ref_8 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*\\[(?=[\\w])")
            mode.end = .regex("\\]")
            mode.scope = .single("meta")
            mode.excludeBegin = true
            mode.excludeEnd = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.scope = .single("string")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.beginKeywords = "new return throw await else"
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("([a-zA-Z]\\w*(<[a-zA-Z]\\w*(\\s*,\\s*[a-zA-Z]\\w*)*>)?(\\[\\])?\\s+)+[a-zA-Z]\\w*\\s*(<[^=]+>\\s*)?\\(")
            mode.end = .regex("\\s*[{;=]")
            mode.scope = .single("function")
            mode.keywords = .grouped([
                "__circularRef": "__ref_0" as Any,
            ])

            mode.excludeEnd = true
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.beginKeywords = "public private protected static internal protected abstract async extern override unsafe virtual new sealed partial"
                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-zA-Z]\\w*\\s*(<[^=]+>\\s*)?\\(")
                    mode.relevance = 0
                    mode.returnBegin = true
                    mode.contains = [
                        .mode(CommonModes.TITLE_MODE()),
                        /* circular ref: __ref_12 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(\\)")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_0" as Any,
                    ])

                    mode.relevance = 0
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    mode.contains = [
                        /* circular ref: __ref_13 */ .mode(Mode()),
                        /* circular ref: __ref_7 */ .mode(Mode()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_11 */ .mode(Mode()),
                /* circular ref: __ref_8 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@[a-zA-Z]\\w*")
            mode.relevance = 0
            return mode
        }()),
    ]

    return lang
}

/// Register csharp language
public extension HighlightJS {
    func registerCsharp() {
        registerLanguage("csharp", definition: csharpLanguage)
    }
}
