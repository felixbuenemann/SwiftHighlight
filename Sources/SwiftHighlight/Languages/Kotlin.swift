// Language: Kotlin
// Author: Sergey Mashkov <cy6erGn0m@gmail.com>
// Category: common

import Foundation

/// Kotlin language definition
public func kotlinLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Kotlin"
    lang.aliases = ["kt", "kts"]

    lang.keywords = .grouped([
        "keyword": "abstract as val var vararg get set class object open private protected public noinline crossinline dynamic final enum if else do while for when throw try catch finally import package is in fun override companion reified inline lateinit init interface annotation data sealed internal infix operator out by constructor super tailrec where const inner suspend typealias external expect actual" as Any,
        "built_in": "Byte Short Char Int Long Boolean Float Double Void Unit Nothing" as Any,
        "literal": "true false null" as Any
    ])

    // Keywords with label
    let LABEL_REF = Mode()
    LABEL_REF.scope = .single("symbol")
    LABEL_REF.begin = .regex("@\\w+")

    let KEYWORDS_WITH_LABEL = Mode()
    KEYWORDS_WITH_LABEL.scope = .single("keyword")
    KEYWORDS_WITH_LABEL.begin = .regex("\\b(break|continue|return|this)\\b")
    KEYWORDS_WITH_LABEL.starts = LABEL_REF

    // Label definition
    let LABEL = Mode()
    LABEL.scope = .single("symbol")
    LABEL.begin = .regex("[a-zA-Z_]\\w*@")

    // String interpolation
    let SUBST = Mode()
    SUBST.scope = .single("subst")
    SUBST.begin = .regex("\\$\\{")
    SUBST.end = .regex("\\}")
    SUBST.contains = [.mode(CommonModes.C_NUMBER_MODE())]

    let VARIABLE = Mode()
    VARIABLE.scope = .single("variable")
    VARIABLE.begin = .regex("\\$[a-zA-Z_]\\w*")

    // Strings
    let TRIPLE_STRING = Mode()
    TRIPLE_STRING.scope = .single("string")
    TRIPLE_STRING.begin = .regex("\"\"\"")
    TRIPLE_STRING.end = .regex("\"\"\"(?=[^\"])")
    TRIPLE_STRING.contains = [.mode(VARIABLE), .mode(SUBST)]

    let CHAR_STRING = Mode()
    CHAR_STRING.scope = .single("string")
    CHAR_STRING.begin = .regex("'")
    CHAR_STRING.end = .regex("'")
    CHAR_STRING.illegal = .regex("\\n")
    CHAR_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]

    let QUOTE_STRING = Mode()
    QUOTE_STRING.scope = .single("string")
    QUOTE_STRING.begin = .regex("\"")
    QUOTE_STRING.end = .regex("\"")
    QUOTE_STRING.illegal = .regex("\\n")
    QUOTE_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE()), .mode(VARIABLE), .mode(SUBST)]

    let STRING = Mode()
    STRING.variants = [TRIPLE_STRING, CHAR_STRING, QUOTE_STRING]

    // Add STRING to SUBST
    SUBST.contains = [.mode(CommonModes.C_NUMBER_MODE()), .mode(STRING)]

    // Annotations
    let ANNOTATION_USE_SITE = Mode()
    ANNOTATION_USE_SITE.scope = .single("meta")
    ANNOTATION_USE_SITE.begin = .regex("@(?:file|property|field|get|set|receiver|param|setparam|delegate)\\s*:(?:\\s*[a-zA-Z_]\\w*)?")

    let ANNOTATION_PARAMS = Mode()
    ANNOTATION_PARAMS.begin = .regex("\\(")
    ANNOTATION_PARAMS.end = .regex("\\)")
    ANNOTATION_PARAMS.contains = [.mode(STRING), .selfReference]

    let ANNOTATION = Mode()
    ANNOTATION.scope = .single("meta")
    ANNOTATION.begin = .regex("@[a-zA-Z_]\\w*")
    ANNOTATION.contains = [.mode(ANNOTATION_PARAMS)]

    // Numbers (Java-style)
    let NUMBER = Mode()
    NUMBER.scope = .single("number")
    NUMBER.begin = .regex("\\b(0[bB][01][01_]*[01][lL]?|0[xX][0-9a-fA-F][0-9a-fA-F_]*[0-9a-fA-F][lL]?|[0-9][0-9_]*\\.?[0-9_]*([eE][-+]?[0-9_]+)?[fFlL]?|[0-9][0-9_]*[lL]?)\\b")
    NUMBER.relevance = 0

    // Nested comment
    let NESTED_COMMENT = Mode()
    NESTED_COMMENT.scope = .single("comment")
    NESTED_COMMENT.begin = .regex("/\\*")
    NESTED_COMMENT.end = .regex("\\*/")
    NESTED_COMMENT.contains = [.mode(CommonModes.C_BLOCK_COMMENT_MODE())]

    // Doc comment
    let DOCTAG = Mode()
    DOCTAG.scope = .single("doctag")
    DOCTAG.begin = .regex("@[A-Za-z]+")

    let DOC_COMMENT = Mode()
    DOC_COMMENT.scope = .single("comment")
    DOC_COMMENT.begin = .regex("/\\*\\*")
    DOC_COMMENT.end = .regex("\\*/")
    DOC_COMMENT.relevance = 0
    DOC_COMMENT.contains = [.mode(DOCTAG)]

    // Type parameters
    let TYPE_PARAMS = Mode()
    TYPE_PARAMS.scope = .single("type")
    TYPE_PARAMS.begin = .regex("<")
    TYPE_PARAMS.end = .regex(">")
    TYPE_PARAMS.relevance = 0

    // Function title
    let FUNC_TITLE = Mode()
    FUNC_TITLE.scope = .single("title.function")
    FUNC_TITLE.begin = .regex("[a-zA-Z_]\\w*\\s*(?=\\()")
    FUNC_TITLE.relevance = 0

    // Function params
    let FUNC_PARAMS = Mode()
    FUNC_PARAMS.scope = .single("params")
    FUNC_PARAMS.begin = .regex("\\(")
    FUNC_PARAMS.end = .regex("\\)")
    FUNC_PARAMS.endsParent = true
    FUNC_PARAMS.relevance = 0
    FUNC_PARAMS.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(NESTED_COMMENT),
        .mode(ANNOTATION_USE_SITE),
        .mode(ANNOTATION),
        .mode(STRING),
        .mode(CommonModes.C_NUMBER_MODE())
    ]

    // Function definition
    let FUNCTION = Mode()
    FUNCTION.scope = .single("function")
    FUNCTION.beginKeywords = "fun"
    FUNCTION.end = .regex("[(]|$")
    FUNCTION.returnBegin = true
    FUNCTION.excludeEnd = true
    FUNCTION.relevance = 5
    FUNCTION.contains = [
        .mode(FUNC_TITLE),
        .mode(TYPE_PARAMS),
        .mode(FUNC_PARAMS),
        .mode(NESTED_COMMENT)
    ]

    // Class title
    let CLASS_TITLE = Mode()
    CLASS_TITLE.scope = .single("title.class")
    CLASS_TITLE.begin = .regex("[a-zA-Z_]\\w*")
    CLASS_TITLE.relevance = 0

    // Class definition
    let CLASS = Mode()
    CLASS.begin = .regex("(class|interface|trait)\\s+")
    CLASS.end = .regex("[:\\{(]|$")
    CLASS.excludeEnd = true
    CLASS.illegal = .regex("extends|implements")
    CLASS.contains = [
        .mode(CLASS_TITLE),
        .mode(TYPE_PARAMS),
        .mode(ANNOTATION_USE_SITE),
        .mode(ANNOTATION)
    ]

    // Shebang
    let SHEBANG = Mode()
    SHEBANG.scope = .single("meta")
    SHEBANG.begin = .regex("^#!/usr/bin/env")
    SHEBANG.end = .regex("$")
    SHEBANG.illegal = .regex("\\n")

    lang.contains = [
        .mode(DOC_COMMENT),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(NESTED_COMMENT),
        .mode(KEYWORDS_WITH_LABEL),
        .mode(LABEL),
        .mode(ANNOTATION_USE_SITE),
        .mode(ANNOTATION),
        .mode(FUNCTION),
        .mode(CLASS),
        .mode(STRING),
        .mode(SHEBANG),
        .mode(NUMBER)
    ]

    return lang
}

/// Register Kotlin language
public extension HighlightJS {
    func registerKotlin() {
        registerLanguage("kotlin", definition: kotlinLanguage)
    }
}
