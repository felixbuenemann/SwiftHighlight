// Auto-generated from highlight.js
// Language: go

import Foundation

/// go language definition
public func goLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Go"

    lang.aliases = ["golang"]
    lang.keywords = .grouped([
        "keyword": ["break", "case", "chan", "const", "continue", "default", "defer", "else", "fallthrough", "for", "func", "go", "goto", "if", "import", "interface", "map", "package", "range", "return", "select", "struct", "switch", "type", "var"] as Any,
        "type": ["bool", "byte", "complex64", "complex128", "error", "float32", "float64", "int8", "int16", "int32", "int64", "string", "uint8", "uint16", "uint32", "uint64", "int", "uint", "uintptr", "rune"] as Any,
        "literal": ["true", "false", "iota", "nil"] as Any,
        "built_in": ["append", "cap", "close", "complex", "copy", "imag", "len", "make", "new", "panic", "print", "println", "real", "recover", "delete"] as Any,
    ])
    lang.illegal = .regex("</")
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("`")
                    mode.end = .regex("`")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("number")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("-?\\b0[xX]\\.[a-fA-F0-9](_?[a-fA-F0-9])*[pP][+-]?\\d(_?\\d)*i?")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("-?\\b0[xX](_?[a-fA-F0-9])+((\\.([a-fA-F0-9](_?[a-fA-F0-9])*)?)?[pP][+-]?\\d(_?\\d)*)?i?")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("-?\\b0[oO](_?[0-7])*i?")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("-?\\.\\d(_?\\d)*([eE][+-]?\\d(_?\\d)*)?i?")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("-?\\b\\d(_?\\d)*(\\.(\\d(_?\\d)*)?)?([eE][+-]?\\d(_?\\d)*)?i?")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(":=")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\s*(\\{|$)")
            mode.scope = .single("function")
            mode.beginKeywords = "func"
            mode.excludeEnd = true
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_0" as Any,
                    ])

                    mode.illegal = .regex("[\"']")
                    mode.endsParent = true
                    return mode
                }()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register go language
public extension HighlightJS {
    func registerGo() {
        registerLanguage("go", definition: goLanguage)
    }
}
