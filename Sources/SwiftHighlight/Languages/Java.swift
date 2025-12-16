// Manually ported from highlight.js
// Language: java

import Foundation

/// Java language definition
public func javaLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Java"
    lang.aliases = ["java", "jsp"]

    let JAVA_KEYWORDS = [
        "synchronized", "abstract", "private", "var", "static", "if", "const", "for", "while",
        "strictfp", "finally", "protected", "import", "native", "final", "void", "enum", "else",
        "break", "transient", "catch", "instanceof", "volatile", "case", "assert", "package",
        "default", "public", "try", "switch", "continue", "throws", "protected", "public",
        "private", "module", "requires", "exports", "do", "sealed", "yield", "permits", "goto", "when"
    ].joined(separator: " ")

    let JAVA_LITERALS = "true false null"

    let JAVA_TYPES = [
        "char", "boolean", "long", "float", "int", "short", "double", "byte"
    ].joined(separator: " ")

    let JAVA_BUILT_IN = [
        "super", "this"
    ].joined(separator: " ")

    lang.keywords = .grouped([
        "keyword": JAVA_KEYWORDS as Any,
        "literal": JAVA_LITERALS as Any,
        "type": JAVA_TYPES as Any,
        "built_in": JAVA_BUILT_IN as Any
    ])

    // Java number patterns
    let NUMBER = Mode()
    NUMBER.scope = .single("number")
    NUMBER.relevance = 0
    NUMBER.variants = [
        // Decimal floating-point with exponent
        {
            let m = Mode()
            m.begin = .regex("\\b([0-9](_*[0-9])*)(\\.[0-9](_*[0-9])*)?[eE][+-]?[0-9](_*[0-9])*[fFdD]?\\b")
            return m
        }(),
        // Decimal floating-point without exponent
        {
            let m = Mode()
            m.begin = .regex("\\b([0-9](_*[0-9])*)((\\.[0-9](_*[0-9])*)[fFdD]?\\b|\\.([fFdD]\\b)?)")
            return m
        }(),
        // Fractional part
        {
            let m = Mode()
            m.begin = .regex("(\\.[0-9](_*[0-9])*)[fFdD]?\\b")
            return m
        }(),
        // Decimal integer with suffix
        {
            let m = Mode()
            m.begin = .regex("\\b([0-9](_*[0-9])*)[fFdD]\\b")
            return m
        }(),
        // Hexadecimal floating-point
        {
            let m = Mode()
            m.begin = .regex("\\b0[xX](([0-9a-fA-F](_*[0-9a-fA-F])*)\\.?|([0-9a-fA-F](_*[0-9a-fA-F])*)?\\.([0-9a-fA-F](_*[0-9a-fA-F])*))[pP][+-]?[0-9](_*[0-9])*[fFdD]?\\b")
            return m
        }(),
        // Decimal integer
        {
            let m = Mode()
            m.begin = .regex("\\b(0|[1-9](_*[0-9])*)[lL]?\\b")
            return m
        }(),
        // Hexadecimal integer
        {
            let m = Mode()
            m.begin = .regex("\\b0[xX]([0-9a-fA-F](_*[0-9a-fA-F])*)[lL]?\\b")
            return m
        }(),
        // Octal integer
        {
            let m = Mode()
            m.begin = .regex("\\b0(_*[0-7])*[lL]?\\b")
            return m
        }(),
        // Binary integer
        {
            let m = Mode()
            m.begin = .regex("\\b0[bB][01](_*[01])*[lL]?\\b")
            return m
        }()
    ]

    // String
    let STRING = Mode()
    STRING.scope = .single("string")
    STRING.begin = .regex("\"")
    STRING.end = .regex("\"")
    STRING.illegal = .regex("\\n")
    STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]

    // Text block (multiline string)
    let TEXT_BLOCK = Mode()
    TEXT_BLOCK.scope = .single("string")
    TEXT_BLOCK.begin = .regex("\"\"\"")
    TEXT_BLOCK.end = .regex("\"\"\"")
    TEXT_BLOCK.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]

    // Character literal
    let CHAR = Mode()
    CHAR.scope = .single("string")
    CHAR.begin = .regex("'")
    CHAR.end = .regex("'")
    CHAR.illegal = .regex("[^\\\\]'")
    CHAR.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]

    // Annotation params
    let ANNOTATION_PARAMS = Mode()
    ANNOTATION_PARAMS.begin = .regex("\\(")
    ANNOTATION_PARAMS.end = .regex("\\)")
    ANNOTATION_PARAMS.contains = [
        .mode(STRING),
        .mode(NUMBER),
        .selfReference
    ]

    // Annotation
    let ANNOTATION = Mode()
    ANNOTATION.scope = .single("meta")
    ANNOTATION.begin = .regex("@[A-Za-z][A-Za-z0-9_]*")
    ANNOTATION.contains = [.mode(ANNOTATION_PARAMS)]

    // Extends/implements keywords
    let EXTENDS_KW = Mode()
    EXTENDS_KW.beginKeywords = "extends implements permits"

    // Class title
    let CLASS_TITLE = Mode()
    CLASS_TITLE.scope = .single("title.class")
    CLASS_TITLE.begin = .regex("[A-Za-z_][A-Za-z0-9_]*")
    CLASS_TITLE.relevance = 0

    // Class declaration
    let CLASS = Mode()
    CLASS.beginKeywords = "class interface enum record"
    CLASS.end = .regex("[{;=]")
    CLASS.excludeEnd = true
    CLASS.relevance = 0
    CLASS.contains = [.mode(EXTENDS_KW), .mode(CLASS_TITLE)]

    // Method declaration
    let METHOD = Mode()
    METHOD.scope = .single("title.function")
    METHOD.begin = .regex("[A-Za-z_][A-Za-z0-9_]*(?=\\s*\\()")
    METHOD.relevance = 0

    // Generic type
    let GENERIC_TYPE = Mode()
    GENERIC_TYPE.scope = .single("type")
    GENERIC_TYPE.begin = .regex("[A-Z][A-Za-z0-9_]*")

    // Generic type parameters
    let GENERICS = Mode()
    GENERICS.begin = .regex("<")
    GENERICS.end = .regex(">")
    GENERICS.contains = [.mode(GENERIC_TYPE), .selfReference]

    // Type
    let TYPE = Mode()
    TYPE.scope = .single("type")
    TYPE.begin = .regex("\\b[A-Z][A-Za-z0-9_]*\\b")
    TYPE.relevance = 0

    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(TEXT_BLOCK),
        .mode(STRING),
        .mode(CHAR),
        .mode(ANNOTATION),
        .mode(CLASS),
        .mode(METHOD),
        .mode(NUMBER),
        .mode(GENERICS),
        .mode(TYPE)
    ]

    return lang
}

/// Register java language
public extension HighlightJS {
    func registerJava() {
        registerLanguage("java", definition: javaLanguage)
    }
}
