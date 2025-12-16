// Manually ported from highlight.js
// Language: swift

import Foundation

/// Swift language definition
public func swiftLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Swift"
    lang.aliases = ["swift"]

    // Swift keywords
    let SWIFT_KEYWORDS = [
        "actor", "any", "associatedtype", "async", "await", "as", "break", "case", "catch",
        "class", "continue", "convenience", "default", "defer", "deinit", "didSet", "distributed",
        "do", "dynamic", "each", "else", "enum", "extension", "fallthrough", "fileprivate",
        "final", "for", "func", "get", "guard", "if", "import", "indirect", "infix", "init",
        "inout", "internal", "in", "is", "isolated", "lazy", "let", "macro", "mutating",
        "nonmutating", "nonisolated", "open", "operator", "optional", "override", "package",
        "postfix", "precedencegroup", "prefix", "private", "protocol", "public", "repeat",
        "required", "rethrows", "return", "set", "some", "static", "struct", "subscript",
        "super", "switch", "throw", "throws", "try", "typealias", "unowned", "var", "weak",
        "where", "while", "willSet", "borrowing", "consume", "consuming", "copy"
    ].joined(separator: " ")

    let SWIFT_LITERALS = "true false nil"

    let SWIFT_BUILT_INS = [
        "abs", "all", "any", "assert", "assertionFailure", "debugPrint", "dump", "fatalError",
        "getVaList", "isKnownUniquelyReferenced", "max", "min", "numericCast", "pointwiseMax",
        "pointwiseMin", "precondition", "preconditionFailure", "print", "readLine", "repeatElement",
        "sequence", "stride", "swap", "transcode", "type", "unsafeBitCast", "unsafeDowncast",
        "withExtendedLifetime", "withUnsafeMutablePointer", "withUnsafePointer", "withVaList",
        "withoutActuallyEscaping", "zip"
    ].joined(separator: " ")

    let NUMBER_SIGN_KEYWORDS = [
        "#colorLiteral", "#column", "#dsohandle", "#else", "#elseif", "#endif", "#error",
        "#file", "#fileID", "#fileLiteral", "#filePath", "#function", "#if", "#imageLiteral",
        "#keyPath", "#line", "#selector", "#sourceLocation", "#warning", "#available", "#unavailable"
    ].joined(separator: " ")

    lang.keywords = .grouped([
        "keyword": SWIFT_KEYWORDS + " " + NUMBER_SIGN_KEYWORDS as Any,
        "literal": SWIFT_LITERALS as Any,
        "built_in": SWIFT_BUILT_INS as Any
    ])

    // Block comment with nesting
    let BLOCK_COMMENT = Mode()
    BLOCK_COMMENT.scope = .single("comment")
    BLOCK_COMMENT.begin = .regex("/\\*")
    BLOCK_COMMENT.end = .regex("\\*/")
    BLOCK_COMMENT.contains = [.selfReference]

    // Number patterns
    let NUMBER = Mode()
    NUMBER.scope = .single("number")
    NUMBER.relevance = 0
    NUMBER.variants = [
        // Decimal floating-point
        {
            let m = Mode()
            m.begin = .regex("\\b([0-9]_*)+(\\.([0-9]_*)+)?([eE][+-]?([0-9]_*)+)?\\b")
            return m
        }(),
        // Hexadecimal floating-point
        {
            let m = Mode()
            m.begin = .regex("\\b0x([0-9a-fA-F]_*)+(\\.([0-9a-fA-F]_*)+)?([pP][+-]?([0-9]_*)+)?\\b")
            return m
        }(),
        // Octal
        {
            let m = Mode()
            m.begin = .regex("\\b0o([0-7]_*)+\\b")
            return m
        }(),
        // Binary
        {
            let m = Mode()
            m.begin = .regex("\\b0b([01]_*)+\\b")
            return m
        }()
    ]

    // String with interpolation
    let STRING_INTERPOLATION = Mode()
    STRING_INTERPOLATION.scope = .single("subst")
    STRING_INTERPOLATION.begin = .regex("\\\\\\(")
    STRING_INTERPOLATION.end = .regex("\\)")

    let ESCAPED_CHARACTER = Mode()
    ESCAPED_CHARACTER.scope = .single("subst")
    ESCAPED_CHARACTER.begin = .regex("\\\\[0\\\\tnr\"']")

    let ESCAPED_UNICODE = Mode()
    ESCAPED_UNICODE.scope = .single("subst")
    ESCAPED_UNICODE.begin = .regex("\\\\u\\{[0-9a-fA-F]{1,8}\\}")

    // Multiline string
    let MULTILINE_STRING = Mode()
    MULTILINE_STRING.begin = .regex("\"\"\"")
    MULTILINE_STRING.end = .regex("\"\"\"")
    MULTILINE_STRING.contains = [
        .mode(ESCAPED_CHARACTER),
        .mode(ESCAPED_UNICODE),
        .mode(STRING_INTERPOLATION)
    ]

    // Single line string
    let SINGLE_STRING = Mode()
    SINGLE_STRING.begin = .regex("\"")
    SINGLE_STRING.end = .regex("\"")
    SINGLE_STRING.illegal = .regex("\\n")
    SINGLE_STRING.contains = [
        .mode(ESCAPED_CHARACTER),
        .mode(ESCAPED_UNICODE),
        .mode(STRING_INTERPOLATION)
    ]

    let STRING = Mode()
    STRING.scope = .single("string")
    STRING.variants = [MULTILINE_STRING, SINGLE_STRING]

    // Type identifiers (start with uppercase)
    let TYPE = Mode()
    TYPE.scope = .single("type")
    TYPE.begin = .regex("\\b[A-Z][a-zA-Z0-9_]*\\b")
    TYPE.relevance = 0

    // Apple framework types (for relevance boost)
    let APPLE_TYPE = Mode()
    APPLE_TYPE.scope = .single("type")
    APPLE_TYPE.begin = .regex("\\b(AV|CA|CF|CG|CI|CL|CM|CN|CT|MK|MP|MTK|MTL|NS|SCN|SK|UI|WK|XC)[A-Za-z0-9_]+\\b")

    // Function title
    let FUNC_TITLE = Mode()
    FUNC_TITLE.scope = .single("title.function")
    FUNC_TITLE.begin = .regex("[A-Za-z_][A-Za-z0-9_]*")
    FUNC_TITLE.relevance = 0

    // Generic params
    let GENERIC_PARAMS = Mode()
    GENERIC_PARAMS.begin = .regex("<")
    GENERIC_PARAMS.end = .regex(">")

    // Function params
    let FUNC_PARAMS = Mode()
    FUNC_PARAMS.begin = .regex("\\(")
    FUNC_PARAMS.end = .regex("\\)")
    FUNC_PARAMS.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(BLOCK_COMMENT),
        .mode(STRING),
        .mode(NUMBER),
        .mode(TYPE)
    ]

    // Function declaration
    let FUNC = Mode()
    FUNC.beginKeywords = "func"
    FUNC.end = .regex("\\{|$")
    FUNC.excludeEnd = true
    FUNC.contains = [
        .mode(FUNC_TITLE),
        .mode(GENERIC_PARAMS),
        .mode(FUNC_PARAMS)
    ]

    // Type title
    let TYPE_TITLE = Mode()
    TYPE_TITLE.scope = .single("title.class")
    TYPE_TITLE.begin = .regex("[A-Za-z_][A-Za-z0-9_]*")
    TYPE_TITLE.relevance = 0

    // Class/struct/enum/protocol/extension declaration
    let TYPE_DECLARATION = Mode()
    TYPE_DECLARATION.beginKeywords = "struct protocol class extension enum actor"
    TYPE_DECLARATION.end = .regex("\\{|$")
    TYPE_DECLARATION.excludeEnd = true
    TYPE_DECLARATION.contains = [.mode(TYPE_TITLE)]

    // Import statement
    let IMPORT = Mode()
    IMPORT.beginKeywords = "import"
    IMPORT.end = .regex("$")
    IMPORT.relevance = 0

    // Attributes
    let ATTRIBUTE = Mode()
    ATTRIBUTE.scope = .single("meta")
    ATTRIBUTE.begin = .regex("@[A-Za-z_][A-Za-z0-9_]*")

    // Implicit parameter ($0, $1, etc)
    let IMPLICIT_PARAM = Mode()
    IMPLICIT_PARAM.scope = .single("variable")
    IMPLICIT_PARAM.begin = .regex("\\$[0-9]+")

    // Property wrapper projection
    let PROPERTY_WRAPPER = Mode()
    PROPERTY_WRAPPER.scope = .single("variable")
    PROPERTY_WRAPPER.begin = .regex("\\$[A-Za-z_][A-Za-z0-9_]*")

    // Operator
    let OPERATOR = Mode()
    OPERATOR.scope = .single("operator")
    OPERATOR.begin = .regex("[/=\\-+!*%<>&|^~?]+")
    OPERATOR.relevance = 0

    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(BLOCK_COMMENT),
        .mode(FUNC),
        .mode(TYPE_DECLARATION),
        .mode(IMPORT),
        .mode(STRING),
        .mode(NUMBER),
        .mode(APPLE_TYPE),
        .mode(TYPE),
        .mode(ATTRIBUTE),
        .mode(IMPLICIT_PARAM),
        .mode(PROPERTY_WRAPPER),
        .mode(OPERATOR)
    ]

    return lang
}

/// Register swift language
public extension HighlightJS {
    func registerSwift() {
        registerLanguage("swift", definition: swiftLanguage)
    }
}
