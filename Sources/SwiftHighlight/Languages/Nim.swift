// Auto-generated from highlight.js
// Language: nim

import Foundation

/// nim language definition
public func nimLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Nim"

    lang.keywords = .grouped([
        "keyword": ["addr", "and", "as", "asm", "bind", "block", "break", "case", "cast", "concept", "const", "continue", "converter", "defer", "discard", "distinct", "div", "do", "elif", "else", "end", "enum", "except", "export", "finally", "for", "from", "func", "generic", "guarded", "if", "import", "in", "include", "interface", "is", "isnot", "iterator", "let", "macro", "method", "mixin", "mod", "nil", "not", "notin", "object", "of", "or", "out", "proc", "ptr", "raise", "ref", "return", "shared", "shl", "shr", "static", "template", "try", "tuple", "type", "using", "var", "when", "while", "with", "without", "xor", "yield"] as Any,
        "literal": ["true", "false"] as Any,
        "type": ["int", "int8", "int16", "int32", "int64", "uint", "uint8", "uint16", "uint32", "uint64", "float", "float32", "float64", "bool", "char", "string", "cstring", "pointer", "expr", "stmt", "void", "auto", "any", "range", "array", "openarray", "varargs", "seq", "set", "clong", "culong", "cchar", "cschar", "cshort", "cint", "csize", "clonglong", "cfloat", "cdouble", "clongdouble", "cuchar", "cushort", "cuint", "culonglong", "cstringarray", "semistatic"] as Any,
        "built_in": ["stdin", "stdout", "stderr", "result"] as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{\\.")
            mode.end = .regex("\\.\\}")
            mode.scope = .single("meta")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z]\\w*\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\"\"")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("([a-zA-Z]\\w*)?\"\"\"")
            mode.end = .regex("\"\"\"")
            mode.scope = .single("string")
            return mode
        }()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b[A-Z]\\w+\\b")
            mode.scope = .single("type")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("number")
            mode.relevance = 0
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b(0[xX][0-9a-fA-F][_0-9a-fA-F]*)('?[iIuU](8|16|32|64))?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b(0o[0-7][_0-7]*)('?[iIuUfF](8|16|32|64))?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b(0(b|B)[01][_01]*)('?[iIuUfF](8|16|32|64))?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b(\\d[_\\d]*)('?[iIuUfF](8|16|32|64))?")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode(CommonModes.HASH_COMMENT_MODE()),
    ]

    return lang
}

/// Register nim language
public extension HighlightJS {
    func registerNim() {
        registerLanguage("nim", definition: nimLanguage)
    }
}
