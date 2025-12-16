// Manually ported from highlight.js
// Language: typescript

import Foundation

/// TypeScript language definition
public func typescriptLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "TypeScript"
    lang.aliases = ["ts", "tsx", "mts", "cts"]

    let TS_KEYWORDS = [
        "as", "in", "of", "if", "for", "while", "finally", "var", "new", "function", "do",
        "return", "void", "else", "break", "catch", "instanceof", "with", "throw", "case",
        "default", "try", "switch", "continue", "typeof", "delete", "let", "yield", "const",
        "class", "debugger", "async", "await", "static", "import", "from", "export", "extends",
        // TypeScript-specific
        "type", "interface", "namespace", "module", "declare", "abstract", "implements",
        "private", "protected", "public", "readonly", "override", "infer", "keyof", "unique",
        "is", "enum", "satisfies", "asserts", "out"
    ].joined(separator: " ")

    let TS_LITERALS = "true false null undefined NaN Infinity"

    let TS_BUILT_INS = [
        "setInterval", "setTimeout", "clearInterval", "clearTimeout", "require", "exports",
        "eval", "isFinite", "isNaN", "parseFloat", "parseInt", "decodeURI", "decodeURIComponent",
        "encodeURI", "encodeURIComponent", "escape", "unescape", "Object", "Function", "Boolean",
        "Symbol", "Math", "Date", "Number", "BigInt", "String", "RegExp", "Array", "Float32Array",
        "Float64Array", "Int8Array", "Uint8Array", "Uint8ClampedArray", "Int16Array", "Int32Array",
        "Uint16Array", "Uint32Array", "BigInt64Array", "BigUint64Array", "Set", "Map", "WeakSet",
        "WeakMap", "ArrayBuffer", "SharedArrayBuffer", "Atomics", "DataView", "JSON", "Promise",
        "Generator", "GeneratorFunction", "AsyncFunction", "Reflect", "Proxy", "Intl", "WebAssembly",
        "Error", "EvalError", "InternalError", "RangeError", "ReferenceError", "SyntaxError",
        "TypeError", "URIError", "console", "window", "document"
    ].joined(separator: " ")

    let TS_VARIABLES = "arguments this super"

    lang.keywords = .grouped([
        "keyword": TS_KEYWORDS as Any,
        "literal": TS_LITERALS as Any,
        "built_in": TS_BUILT_INS as Any,
        "variable.language": TS_VARIABLES as Any
    ])

    lang.illegal = .regex("#(?![\\$_A-Za-z])")

    // Template string
    let TEMPLATE_SUBST = Mode()
    TEMPLATE_SUBST.scope = .single("subst")
    TEMPLATE_SUBST.begin = .regex("\\$\\{")
    TEMPLATE_SUBST.end = .regex("\\}")

    let TEMPLATE_STRING = Mode()
    TEMPLATE_STRING.scope = .single("string")
    TEMPLATE_STRING.begin = .regex("`")
    TEMPLATE_STRING.end = .regex("`")
    TEMPLATE_STRING.contains = [
        .mode(CommonModes.BACKSLASH_ESCAPE()),
        .mode(TEMPLATE_SUBST)
    ]

    // Regular string
    let STRING = Mode()
    STRING.scope = .single("string")
    STRING.variants = [
        {
            let m = Mode()
            m.begin = .regex("'")
            m.end = .regex("'")
            m.illegal = .regex("\\n")
            m.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("\"")
            m.end = .regex("\"")
            m.illegal = .regex("\\n")
            m.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]
            return m
        }()
    ]

    // Number
    let NUMBER = Mode()
    NUMBER.scope = .single("number")
    NUMBER.variants = [
        {
            let m = Mode()
            m.begin = .regex("\\b0[xX][0-9a-fA-F](_?[0-9a-fA-F])*n?\\b")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("\\b0[oO][0-7](_?[0-7])*n?\\b")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("\\b0[bB][01](_?[01])*n?\\b")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][+-]?\\d+)?n?\\b")
            return m
        }()
    ]
    NUMBER.relevance = 0

    // Regex
    let REGEXP = Mode()
    REGEXP.scope = .single("regexp")
    REGEXP.begin = .regex("/(?=[^/\\n]*/)")
    REGEXP.end = .regex("/[gimyus]*")
    REGEXP.illegal = .regex("\\n")
    REGEXP.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]

    // Function title
    let FUNC_TITLE = Mode()
    FUNC_TITLE.scope = .single("title.function")
    FUNC_TITLE.begin = .regex("[A-Za-z$_][0-9A-Za-z$_]*")
    FUNC_TITLE.relevance = 0

    // Generic params
    let GENERIC_PARAMS = Mode()
    GENERIC_PARAMS.begin = .regex("<")
    GENERIC_PARAMS.end = .regex(">")

    // Function params
    let FUNC_PARAMS = Mode()
    FUNC_PARAMS.begin = .regex("\\(")
    FUNC_PARAMS.end = .regex("\\)")

    // Function
    let FUNCTION = Mode()
    FUNCTION.beginKeywords = "function"
    FUNCTION.end = .regex("\\{|$")
    FUNCTION.excludeEnd = true
    FUNCTION.contains = [
        .mode(FUNC_TITLE),
        .mode(GENERIC_PARAMS),
        .mode(FUNC_PARAMS)
    ]

    // Extends/implements
    let EXTENDS_KW = Mode()
    EXTENDS_KW.beginKeywords = "extends implements"

    // Class title
    let CLASS_TITLE = Mode()
    CLASS_TITLE.scope = .single("title.class")
    CLASS_TITLE.begin = .regex("[A-Za-z$_][0-9A-Za-z$_]*")
    CLASS_TITLE.relevance = 0

    // Class
    let CLASS = Mode()
    CLASS.beginKeywords = "class interface"
    CLASS.end = .regex("\\{|$")
    CLASS.excludeEnd = true
    CLASS.contains = [.mode(EXTENDS_KW), .mode(CLASS_TITLE)]

    // Type identifier
    let TYPE_ID = Mode()
    TYPE_ID.scope = .single("type")
    TYPE_ID.begin = .regex("[A-Z][A-Za-z0-9_]*")

    // Primitive types
    let PRIMITIVE_TYPE = Mode()
    PRIMITIVE_TYPE.scope = .single("type")
    PRIMITIVE_TYPE.begin = .regex("\\b(string|number|boolean|any|void|never|unknown|object|symbol|bigint|null|undefined)\\b")

    // Type annotation
    let TYPE_ANNOTATION = Mode()
    TYPE_ANNOTATION.begin = .regex(":\\s*")
    TYPE_ANNOTATION.end = .regex("[,;\\)\\}\\{=]|$")
    TYPE_ANNOTATION.excludeEnd = true
    TYPE_ANNOTATION.contains = [.mode(TYPE_ID), .mode(PRIMITIVE_TYPE)]
    TYPE_ANNOTATION.relevance = 0

    // Decorator
    let DECORATOR = Mode()
    DECORATOR.scope = .single("meta")
    DECORATOR.begin = .regex("@[A-Za-z$_][0-9A-Za-z$_]*")

    // Doc tag
    let DOCTAG = Mode()
    DOCTAG.scope = .single("doctag")
    DOCTAG.begin = .regex("@[A-Za-z]+")

    // JSDoc comment
    let JSDOC = Mode()
    JSDOC.scope = .single("comment")
    JSDOC.begin = .regex("/\\*\\*")
    JSDOC.end = .regex("\\*/")
    JSDOC.contains = [.mode(DOCTAG)]
    JSDOC.relevance = 3

    // Arrow function (implied by =>)
    let ARROW = Mode()
    ARROW.scope = .single("operator")
    ARROW.begin = .regex("=>")

    // Generic type in generics
    let GENERIC_TYPE = Mode()
    GENERIC_TYPE.scope = .single("type")
    GENERIC_TYPE.begin = .regex("[A-Z][A-Za-z0-9_]*")

    // Type generics
    let GENERICS = Mode()
    GENERICS.begin = .regex("<")
    GENERICS.end = .regex(">")
    GENERICS.contains = [.mode(GENERIC_TYPE), .selfReference]
    GENERICS.relevance = 0

    lang.contains = [
        .mode(CommonModes.SHEBANG(binary: "node")),
        .mode(JSDOC),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(TEMPLATE_STRING),
        .mode(STRING),
        .mode(NUMBER),
        .mode(REGEXP),
        .mode(FUNCTION),
        .mode(CLASS),
        .mode(TYPE_ANNOTATION),
        .mode(DECORATOR),
        .mode(ARROW),
        .mode(GENERICS)
    ]

    return lang
}

/// Register typescript language
public extension HighlightJS {
    func registerTypescript() {
        registerLanguage("typescript", definition: typescriptLanguage)
    }
}
