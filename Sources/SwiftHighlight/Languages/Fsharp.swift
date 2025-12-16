// Language: F#
// Author: Jonas Follesø <jonas@follesoe.no>
// Category: functional

import Foundation

/// F# language definition
public func fsharpLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "F#"
    lang.aliases = ["fs", "f#"]

    let keywords = [
        "abstract", "and", "as", "assert", "base", "begin", "class", "default",
        "delegate", "do", "done", "downcast", "downto", "elif", "else", "end",
        "exception", "extern", "finally", "fixed", "for", "fun", "function",
        "global", "if", "in", "inherit", "inline", "interface", "internal",
        "lazy", "let", "match", "member", "module", "mutable", "namespace",
        "new", "of", "open", "or", "override", "private", "public", "rec",
        "return", "static", "struct", "then", "to", "try", "type", "upcast",
        "use", "val", "void", "when", "while", "with", "yield"
    ]

    let literals = [
        "true", "false", "null", "Some", "None", "Ok", "Error",
        "infinity", "infinityf", "nan", "nanf"
    ]

    let builtins = [
        "not", "ref", "raise", "reraise", "dict", "readOnlyDict", "set", "get",
        "enum", "sizeof", "typeof", "typedefof", "nameof", "nullArg", "invalidArg",
        "invalidOp", "id", "fst", "snd", "ignore", "lock", "using", "box", "unbox",
        "tryUnbox", "printf", "printfn", "sprintf", "eprintf", "eprintfn", "fprintf",
        "fprintfn", "failwith", "failwithf"
    ]

    let types = [
        "bool", "byte", "sbyte", "int8", "int16", "int32", "uint8", "uint16",
        "uint32", "int", "uint", "int64", "uint64", "nativeint", "unativeint",
        "decimal", "float", "double", "float32", "single", "char", "string",
        "unit", "bigint", "option", "voption", "list", "array", "seq", "byref",
        "exn", "inref", "nativeptr", "obj", "outref", "voidptr", "Result"
    ]

    lang.keywords = .grouped([
        "keyword": keywords.joined(separator: " ") as Any,
        "literal": literals.joined(separator: " ") as Any,
        "built_in": builtins.joined(separator: " ") as Any,
        "type": types.joined(separator: " ") as Any
    ])

    lang.illegal = .regex("/\\*")

    // ML-style comment (* ... *)
    let ML_COMMENT = Mode()
    ML_COMMENT.scope = .single("comment")
    ML_COMMENT.begin = .regex("\\(\\*(?!\\))")
    ML_COMMENT.end = .regex("\\*\\)")
    ML_COMMENT.contains = [.selfReference]

    // C-style line comment
    let LINE_COMMENT = CommonModes.C_LINE_COMMENT_MODE()

    // Comment variants
    let COMMENT = Mode()
    COMMENT.variants = [ML_COMMENT, LINE_COMMENT]

    // Bang keywords (monad builders)
    let BANG_KEYWORD = Mode()
    BANG_KEYWORD.scope = .single("keyword")
    BANG_KEYWORD.begin = .regex("\\b(yield|return|let|do|match|use)!")

    // Quoted identifier ``...``
    let QUOTED_IDENTIFIER = Mode()
    QUOTED_IDENTIFIER.scope = .single("variable")
    QUOTED_IDENTIFIER.begin = .regex("``")
    QUOTED_IDENTIFIER.end = .regex("``")

    // Generic type symbol 'a or ^a
    let GENERIC_TYPE_SYMBOL = Mode()
    GENERIC_TYPE_SYMBOL.scope = .single("symbol")
    GENERIC_TYPE_SYMBOL.begin = .regex("\\B('|\\^)[a-zA-Z_]\\w*")
    GENERIC_TYPE_SYMBOL.relevance = 0

    // Operators
    let OPERATOR = Mode()
    OPERATOR.scope = .single("operator")
    OPERATOR.begin = .regex("[!%&*+\\-/<=>@^|~?]+|:\\?>|:\\?|:>|:=|::?|\\$")
    OPERATOR.relevance = 0

    // Strings
    let QUOTED_STRING = Mode()
    QUOTED_STRING.scope = .single("string")
    QUOTED_STRING.begin = .regex("\"")
    QUOTED_STRING.end = .regex("\"")
    QUOTED_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]

    let VERBATIM_STRING = Mode()
    VERBATIM_STRING.scope = .single("string")
    VERBATIM_STRING.begin = .regex("@\"")
    VERBATIM_STRING.end = .regex("\"")
    VERBATIM_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]

    let TRIPLE_QUOTED_STRING = Mode()
    TRIPLE_QUOTED_STRING.scope = .single("string")
    TRIPLE_QUOTED_STRING.begin = .regex("\"\"\"")
    TRIPLE_QUOTED_STRING.end = .regex("\"\"\"")
    TRIPLE_QUOTED_STRING.relevance = 2

    // Interpolated strings
    let SUBST = Mode()
    SUBST.scope = .single("subst")
    SUBST.begin = .regex("\\{")
    SUBST.end = .regex("\\}")

    let INTERPOLATED_STRING = Mode()
    INTERPOLATED_STRING.scope = .single("string")
    INTERPOLATED_STRING.begin = .regex("\\$\"")
    INTERPOLATED_STRING.end = .regex("\"")
    INTERPOLATED_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE()), .mode(SUBST)]

    let INTERPOLATED_VERBATIM_STRING = Mode()
    INTERPOLATED_VERBATIM_STRING.scope = .single("string")
    INTERPOLATED_VERBATIM_STRING.begin = .regex("(\\$@|@\\$)\"")
    INTERPOLATED_VERBATIM_STRING.end = .regex("\"")
    INTERPOLATED_VERBATIM_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE()), .mode(SUBST)]

    let INTERPOLATED_TRIPLE_STRING = Mode()
    INTERPOLATED_TRIPLE_STRING.scope = .single("string")
    INTERPOLATED_TRIPLE_STRING.begin = .regex("\\$\"\"\"")
    INTERPOLATED_TRIPLE_STRING.end = .regex("\"\"\"")
    INTERPOLATED_TRIPLE_STRING.contains = [.mode(SUBST)]
    INTERPOLATED_TRIPLE_STRING.relevance = 2

    // Character literal
    let CHAR_LITERAL = Mode()
    CHAR_LITERAL.scope = .single("string")
    CHAR_LITERAL.begin = .regex("'(?:[^\\\\']|\\\\(?:.|\\d{3}|x[a-fA-F\\d]{2}|u[a-fA-F\\d]{4}|U[a-fA-F\\d]{8}))'")

    // String variants
    let STRING = Mode()
    STRING.variants = [
        INTERPOLATED_TRIPLE_STRING,
        INTERPOLATED_VERBATIM_STRING,
        INTERPOLATED_STRING,
        TRIPLE_QUOTED_STRING,
        VERBATIM_STRING,
        QUOTED_STRING,
        CHAR_LITERAL
    ]

    // Type declaration
    let TYPE_TITLE = Mode()
    TYPE_TITLE.scope = .single("title.class")
    TYPE_TITLE.begin = .regex("[a-zA-Z_][\\w']*")
    TYPE_TITLE.relevance = 0

    let TYPE_DECLARATION = Mode()
    TYPE_DECLARATION.begin = .regex("\\btype\\s+")
    TYPE_DECLARATION.end = .regex("(?=\\(|=|$)")
    TYPE_DECLARATION.beginScope = .single("keyword")
    TYPE_DECLARATION.contains = [.mode(COMMENT), .mode(QUOTED_IDENTIFIER), .mode(GENERIC_TYPE_SYMBOL), .mode(TYPE_TITLE)]

    // Attributes [< ... >]
    let ATTRIBUTE = Mode()
    ATTRIBUTE.scope = .single("meta")
    ATTRIBUTE.begin = .regex("\\[<")
    ATTRIBUTE.end = .regex(">\\]")
    ATTRIBUTE.relevance = 2
    ATTRIBUTE.contains = [
        .mode(QUOTED_IDENTIFIER),
        .mode(TRIPLE_QUOTED_STRING),
        .mode(VERBATIM_STRING),
        .mode(QUOTED_STRING),
        .mode(CHAR_LITERAL),
        .mode(CommonModes.BINARY_NUMBER_MODE()),
        .mode(CommonModes.C_NUMBER_MODE())
    ]

    // Computation expression
    let COMPUTATION_EXPR = Mode()
    COMPUTATION_EXPR.scope = .single("keyword")
    COMPUTATION_EXPR.begin = .regex("\\b[_a-z]\\w*(?=\\s*\\{)")

    // Preprocessor
    let PREPROCESSOR = Mode()
    PREPROCESSOR.scope = .single("meta")
    PREPROCESSOR.begin = .regex("^\\s*#(if|else|endif|line|nowarn|light|r|i|I|load|time|help|quit)\\b")
    PREPROCESSOR.end = .regex("(?=\\s|$)")

    // Number
    let NUMBER = Mode()
    NUMBER.variants = [CommonModes.BINARY_NUMBER_MODE(), CommonModes.C_NUMBER_MODE()]

    // Type annotation
    let TYPE_ANNOTATION = Mode()
    TYPE_ANNOTATION.begin = .regex(":\\s*(?=[\\w'\\^#`\\(\\{\\|])")
    TYPE_ANNOTATION.beginScope = .single("operator")
    TYPE_ANNOTATION.end = .regex("(?=\\n|=)")
    TYPE_ANNOTATION.relevance = 0
    TYPE_ANNOTATION.contains = [.mode(COMMENT), .mode(GENERIC_TYPE_SYMBOL), .mode(QUOTED_IDENTIFIER), .mode(OPERATOR)]

    lang.contains = [
        .mode(BANG_KEYWORD),
        .mode(STRING),
        .mode(COMMENT),
        .mode(QUOTED_IDENTIFIER),
        .mode(TYPE_DECLARATION),
        .mode(ATTRIBUTE),
        .mode(TYPE_ANNOTATION),
        .mode(COMPUTATION_EXPR),
        .mode(PREPROCESSOR),
        .mode(NUMBER),
        .mode(GENERIC_TYPE_SYMBOL),
        .mode(OPERATOR)
    ]

    return lang
}

/// Register F# language
public extension HighlightJS {
    func registerFsharp() {
        registerLanguage("fsharp", definition: fsharpLanguage)
    }
}
