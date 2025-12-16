// Auto-generated from highlight.js
// Language: dart

import Foundation

/// dart language definition
public func dartLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Dart"

    lang.keywords = .grouped([
        "keyword": ["abstract", "as", "assert", "async", "await", "base", "break", "case", "catch", "class", "const", "continue", "covariant", "default", "deferred", "do", "dynamic", "else", "enum", "export", "extends", "extension", "external", "factory", "false", "final", "finally", "for", "Function", "get", "hide", "if", "implements", "import", "in", "interface", "is", "late", "library", "mixin", "new", "null", "on", "operator", "part", "required", "rethrow", "return", "sealed", "set", "show", "static", "super", "switch", "sync", "this", "throw", "true", "try", "typedef", "var", "void", "when", "while", "with", "yield"] as Any,
        "built_in": ["Comparable", "DateTime", "Duration", "Function", "Iterable", "Iterator", "List", "Map", "Match", "Object", "Pattern", "RegExp", "Set", "Stopwatch", "String", "StringBuffer", "StringSink", "Symbol", "Type", "Uri", "bool", "double", "int", "num", "Element", "ElementList", "Comparable?", "DateTime?", "Duration?", "Function?", "Iterable?", "Iterator?", "List?", "Map?", "Match?", "Object?", "Pattern?", "RegExp?", "Set?", "Stopwatch?", "String?", "StringBuffer?", "StringSink?", "Symbol?", "Type?", "Uri?", "bool?", "double?", "int?", "num?", "Element?", "ElementList?", "Never", "Null", "dynamic", "print", "document", "querySelector", "querySelectorAll", "window"] as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("r'''")
                    mode.end = .regex("'''")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("r\"\"\"")
                    mode.end = .regex("\"\"\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("r'")
                    mode.end = .regex("'")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("r\"")
                    mode.end = .regex("\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'''")
                    mode.end = .regex("'''")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("subst")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\$[A-Za-z0-9_]+")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("subst")
                            mode.keywords = .simple("true false null this is new super")

                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.scope = .single("number")
                                    mode.relevance = 0
                                    mode.variants = [
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\b[0-9][0-9_]*(\\.[0-9][0-9_]*)?([eE][+-]?[0-9][0-9_]*)?\\b")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\b0[xX][0-9A-Fa-f][0-9A-Fa-f_]*\\b")
                                            return mode
                                        }(),
                                    ]
                                    return mode
                                }()),
                                /* circular ref: __ref_0 */ .mode(Mode()),
                            ]
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\$\\{")
                                    mode.end = .regex("\\}")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"\"\"")
                    mode.end = .regex("\"\"\"")
                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode(CommonModes.COMMENT("\\/\\*\\*(?!\\/)", "\\*\\/")),
        .mode(CommonModes.COMMENT("\\/{3,} ?", "$")),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\{")
            mode.scope = .single("class")
            mode.beginKeywords = "class interface"
            mode.excludeEnd = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.beginKeywords = "extends implements"
                    return mode
                }()),
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
            ]
            return mode
        }()),
        /* circular ref: __ref_4 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@[A-Za-z]+")
            mode.scope = .single("meta")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("=>")
            return mode
        }()),
    ]

    return lang
}

/// Register dart language
public extension HighlightJS {
    func registerDart() {
        registerLanguage("dart", definition: dartLanguage)
    }
}
