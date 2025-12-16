// Language: WebAssembly
// Category: web, common

import Foundation

/// WebAssembly language definition
public func wasmLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "WebAssembly"

    let keywords = [
        "anyfunc", "block", "br", "br_if", "br_table", "call", "call_indirect",
        "data", "drop", "elem", "else", "end", "export", "func", "global.get",
        "global.set", "local.get", "local.set", "local.tee", "get_global",
        "get_local", "global", "if", "import", "local", "loop", "memory",
        "memory.grow", "memory.size", "module", "mut", "nop", "offset", "param",
        "result", "return", "select", "set_global", "set_local", "start",
        "table", "tee_local", "then", "type", "unreachable"
    ]

    lang.keywords = .grouped([
        "keyword": keywords.joined(separator: " ") as Any
    ])

    // Block comment (; ... ;)
    let BLOCK_COMMENT = Mode()
    BLOCK_COMMENT.scope = .single("comment")
    BLOCK_COMMENT.begin = .regex("\\(;")
    BLOCK_COMMENT.end = .regex(";\\)")
    BLOCK_COMMENT.contains = [.selfReference]

    // Line comment
    let LINE_COMMENT = Mode()
    LINE_COMMENT.scope = .single("comment")
    LINE_COMMENT.begin = .regex(";;")
    LINE_COMMENT.end = .regex("$")

    // Function reference
    let FUNC_REF = Mode()
    FUNC_REF.begin = .regex("(func|call|call_indirect)\\s+(\\$[^\\s)]+)")
    FUNC_REF.beginScope = .multi([1: "keyword", 2: "title.function"])

    // Variable/argument
    let ARGUMENT = Mode()
    ARGUMENT.scope = .single("variable")
    ARGUMENT.begin = .regex("\\$[\\w_]+")

    // Parentheses
    let PARENS = Mode()
    PARENS.scope = .single("punctuation")
    PARENS.begin = .regex("(\\((?!;)|\\))+")
    PARENS.relevance = 0

    // Numbers
    let NUMBER = Mode()
    NUMBER.scope = .single("number")
    NUMBER.begin = .regex("[+-]?\\b(?:\\d(?:_?\\d)*(?:\\.\\d(?:_?\\d)*)?(?:[eE][+-]?\\d(?:_?\\d)*)?|0x[\\da-fA-F](?:_?[\\da-fA-F])*(?:\\.[\\da-fA-F](?:_?[\\da-fA-D])*)?(?:[pP][+-]?\\d(?:_?\\d)*)?)\\b|\\binf\\b|\\bnan(?::0x[\\da-fA-F](?:_?[\\da-fA-D])*)?\\b")
    NUMBER.relevance = 0

    // Type
    let TYPE = Mode()
    TYPE.scope = .single("type")
    TYPE.begin = .regex("(i32|i64|f32|f64)(?!\\.)")

    // Math operations
    let MATH_OPERATIONS = Mode()
    MATH_OPERATIONS.scope = .single("keyword")
    MATH_OPERATIONS.begin = .regex("\\b(f32|f64|i32|i64)(?:\\.(?:abs|add|and|ceil|clz|const|convert_[su]/i(?:32|64)|copysign|ctz|demote/f64|div(?:_[su])?|eqz?|extend_[su]/i32|floor|ge(?:_[su])?|gt(?:_[su])?|le(?:_[su])?|load(?:(?:8|16|32)_[su])?|lt(?:_[su])?|max|min|mul|nearest|neg?|or|popcnt|promote/f32|reinterpret/[fi](?:32|64)|rem_[su]|rot[lr]|shl|shr_[su]|store(?:8|16|32)?|sqrt|sub|trunc(?:_[su]/f(?:32|64))?|wrap/i64|xor))\\b")

    // Offset/align
    let OFFSET_ALIGN = Mode()
    OFFSET_ALIGN.begin = .regex("(offset|align)(\\s*)(=)")
    OFFSET_ALIGN.beginScope = .multi([1: "keyword", 3: "operator"])

    // String
    let STRING = CommonModes.QUOTE_STRING_MODE()

    lang.contains = [
        .mode(LINE_COMMENT),
        .mode(BLOCK_COMMENT),
        .mode(OFFSET_ALIGN),
        .mode(ARGUMENT),
        .mode(PARENS),
        .mode(FUNC_REF),
        .mode(STRING),
        .mode(TYPE),
        .mode(MATH_OPERATIONS),
        .mode(NUMBER)
    ]

    return lang
}

/// Register WebAssembly language
public extension HighlightJS {
    func registerWasm() {
        registerLanguage("wasm", definition: wasmLanguage)
    }
}
