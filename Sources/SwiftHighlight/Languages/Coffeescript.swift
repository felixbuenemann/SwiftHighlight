// Language: CoffeeScript
// Author: Dmytrii Nagirniak <dnagir@gmail.com>
// Description: CoffeeScript - a language that transcompiles to JavaScript
// Category: scripting

import Foundation

/// CoffeeScript language definition
public func coffeescriptLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "CoffeeScript"
    lang.aliases = ["coffee", "cson", "iced"]

    // ECMAScript keywords (excluding CoffeeScript invalid ones)
    let ecmaKeywords = "as in of if for while finally new function do return void else break catch " +
        "instanceof with throw case default try switch continue typeof delete " +
        "yield class debugger async await extends using"

    let coffeeKeywords = "then unless until loop by when and or is isnt not"

    // ECMAScript literals
    let ecmaLiterals = "true false null undefined NaN Infinity"
    let coffeeLiterals = "yes no on off"

    // ECMAScript built-ins
    let ecmaBuiltins = "Object Function Boolean Symbol Math Date Number BigInt String RegExp Array " +
        "Float32Array Float64Array Int8Array Uint8Array Uint8ClampedArray Int16Array Int32Array " +
        "Uint16Array Uint32Array BigInt64Array BigUint64Array Set Map WeakSet WeakMap ArrayBuffer " +
        "SharedArrayBuffer Atomics DataView JSON Promise Generator GeneratorFunction AsyncFunction " +
        "Reflect Proxy Intl WebAssembly Error EvalError InternalError RangeError ReferenceError " +
        "SyntaxError TypeError URIError setInterval setTimeout clearInterval clearTimeout require " +
        "exports eval isFinite isNaN parseFloat parseInt decodeURI decodeURIComponent encodeURI " +
        "encodeURIComponent escape unescape arguments this super console window document " +
        "localStorage sessionStorage module global"
    let coffeeBuiltins = "npm print"

    lang.keywords = .grouped([
        "keyword": (ecmaKeywords + " " + coffeeKeywords) as Any,
        "literal": (ecmaLiterals + " " + coffeeLiterals) as Any,
        "built_in": (ecmaBuiltins + " " + coffeeBuiltins) as Any
    ])

    lang.illegal = .regex("/\\*")

    let JS_IDENT_RE = "[A-Za-z$_][0-9A-Za-z$_]*"

    // Substitution in strings
    let SUBST = Mode()
    SUBST.scope = .single("subst")
    SUBST.begin = .regex("#\\{")
    SUBST.end = .regex("\\}")

    // Single-quoted strings (no interpolation)
    let APOS_STRING = Mode()
    APOS_STRING.scope = .single("string")
    APOS_STRING.begin = .regex("'")
    APOS_STRING.end = .regex("'")
    APOS_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]

    // Triple single-quoted strings
    let TRIPLE_APOS_STRING = Mode()
    TRIPLE_APOS_STRING.scope = .single("string")
    TRIPLE_APOS_STRING.begin = .regex("'''")
    TRIPLE_APOS_STRING.end = .regex("'''")
    TRIPLE_APOS_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]

    // Double-quoted strings (with interpolation)
    let QUOTE_STRING = Mode()
    QUOTE_STRING.scope = .single("string")
    QUOTE_STRING.begin = .regex("\"")
    QUOTE_STRING.end = .regex("\"")
    QUOTE_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE()), .mode(SUBST)]

    // Triple double-quoted strings
    let TRIPLE_QUOTE_STRING = Mode()
    TRIPLE_QUOTE_STRING.scope = .single("string")
    TRIPLE_QUOTE_STRING.begin = .regex("\"\"\"")
    TRIPLE_QUOTE_STRING.end = .regex("\"\"\"")
    TRIPLE_QUOTE_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE()), .mode(SUBST)]

    // Strings mode with variants
    let STRING = Mode()
    STRING.scope = .single("string")
    STRING.variants = [TRIPLE_APOS_STRING, APOS_STRING, TRIPLE_QUOTE_STRING, QUOTE_STRING]

    // Heregex (triple-slash regex)
    let HEREGEX = Mode()
    HEREGEX.scope = .single("regexp")
    HEREGEX.begin = .regex("///")
    HEREGEX.end = .regex("///")
    HEREGEX.contains = [.mode(SUBST), .mode(CommonModes.HASH_COMMENT_MODE())]

    // Simple regex patterns
    let REGEX_SIMPLE = Mode()
    REGEX_SIMPLE.scope = .single("regexp")
    REGEX_SIMPLE.begin = .regex("//[gim]{0,3}(?=\\\\W)")
    REGEX_SIMPLE.relevance = 0

    // Regular regex
    let REGEX = Mode()
    REGEX.scope = .single("regexp")
    REGEX.begin = .regex("/(?![ *]).*?(?![\\\\\\\\])./[gim]{0,3}(?=\\\\W)")

    // Regex variants
    let REGEXP_MODE = Mode()
    REGEXP_MODE.scope = .single("regexp")
    REGEXP_MODE.variants = [HEREGEX, REGEX_SIMPLE, REGEX]

    // Instance variable (@variable)
    let INSTANCE_VAR = Mode()
    INSTANCE_VAR.begin = .regex("@" + JS_IDENT_RE)

    // Embedded JavaScript
    let EMBEDDED_JS_BLOCK = Mode()
    EMBEDDED_JS_BLOCK.begin = .regex("```")
    EMBEDDED_JS_BLOCK.end = .regex("```")
    EMBEDDED_JS_BLOCK.excludeBegin = true
    EMBEDDED_JS_BLOCK.excludeEnd = true
    EMBEDDED_JS_BLOCK.subLanguage = .single("javascript")

    let EMBEDDED_JS_INLINE = Mode()
    EMBEDDED_JS_INLINE.begin = .regex("`")
    EMBEDDED_JS_INLINE.end = .regex("`")
    EMBEDDED_JS_INLINE.excludeBegin = true
    EMBEDDED_JS_INLINE.excludeEnd = true
    EMBEDDED_JS_INLINE.subLanguage = .single("javascript")

    // Block comment
    let BLOCK_COMMENT = Mode()
    BLOCK_COMMENT.scope = .single("comment")
    BLOCK_COMMENT.begin = .regex("###")
    BLOCK_COMMENT.end = .regex("###")

    // Number with optional trailing regex check
    let NUMBER = Mode()
    NUMBER.scope = .single("number")
    NUMBER.begin = .regex("(-?)(\\\\b0[xX][a-fA-F0-9]+|(\\\\b\\\\d+(\\\\.\\\\d*)?|\\\\.\\\\d+)([eE][-+]?\\\\d+)?)")
    NUMBER.relevance = 0

    // Title for functions
    let TITLE = Mode()
    TITLE.scope = .single("title")
    TITLE.begin = .regex(JS_IDENT_RE)
    TITLE.relevance = 0

    // Params mode
    let PARAMS_INNER = Mode()
    PARAMS_INNER.begin = .regex("\\\\(")
    PARAMS_INNER.end = .regex("\\\\)")
    PARAMS_INNER.contains = [
        .selfReference,
        .mode(CommonModes.BINARY_NUMBER_MODE()),
        .mode(NUMBER),
        .mode(STRING),
        .mode(REGEXP_MODE),
        .mode(INSTANCE_VAR)
    ]

    let PARAMS = Mode()
    PARAMS.scope = .single("params")
    PARAMS.begin = .regex("\\\\([^\\\\(]")
    PARAMS.returnBegin = true
    PARAMS.contains = [.mode(PARAMS_INNER)]

    // Function definition
    let POSSIBLE_PARAMS_RE = "(\\\\(.*\\\\)\\\\s*)?\\\\B[-=]>"

    let FUNCTION = Mode()
    FUNCTION.scope = .single("function")
    FUNCTION.begin = .regex("^\\\\s*" + JS_IDENT_RE + "\\\\s*=\\\\s*" + POSSIBLE_PARAMS_RE)
    FUNCTION.end = .regex("[-=]>")
    FUNCTION.returnBegin = true
    FUNCTION.contains = [.mode(TITLE), .mode(PARAMS)]

    // Anonymous function
    let ANON_FUNC_INNER = Mode()
    ANON_FUNC_INNER.scope = .single("function")
    ANON_FUNC_INNER.begin = .regex(POSSIBLE_PARAMS_RE)
    ANON_FUNC_INNER.end = .regex("[-=]>")
    ANON_FUNC_INNER.returnBegin = true
    ANON_FUNC_INNER.contains = [.mode(PARAMS)]

    let ANON_FUNC = Mode()
    ANON_FUNC.begin = .regex("[:\\\\(,=]\\\\s*")
    ANON_FUNC.relevance = 0
    ANON_FUNC.contains = [.mode(ANON_FUNC_INNER)]

    // Class definition
    let CLASS_DEF = Mode()
    CLASS_DEF.begin = .regex("class\\\\s+" + JS_IDENT_RE + "(\\\\s+extends\\\\s+" + JS_IDENT_RE + ")?")
    CLASS_DEF.scope = .multi([1: "keyword", 2: "title.class", 4: "title.class.inherited"])
    CLASS_DEF.relevance = 10

    // Property definition
    let PROPERTY = Mode()
    PROPERTY.begin = .regex(JS_IDENT_RE + ":")
    PROPERTY.end = .regex(":")
    PROPERTY.returnBegin = true
    PROPERTY.returnEnd = true
    PROPERTY.relevance = 0

    // Set up SUBST contains
    SUBST.contains = [
        .mode(CommonModes.BINARY_NUMBER_MODE()),
        .mode(NUMBER),
        .mode(STRING),
        .mode(REGEXP_MODE),
        .mode(INSTANCE_VAR)
    ]

    lang.contains = [
        .mode(CommonModes.BINARY_NUMBER_MODE()),
        .mode(NUMBER),
        .mode(STRING),
        .mode(REGEXP_MODE),
        .mode(INSTANCE_VAR),
        .mode(EMBEDDED_JS_BLOCK),
        .mode(EMBEDDED_JS_INLINE),
        .mode(BLOCK_COMMENT),
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode(FUNCTION),
        .mode(ANON_FUNC),
        .mode(CLASS_DEF),
        .mode(PROPERTY)
    ]

    return lang
}

/// Register CoffeeScript language
public extension HighlightJS {
    func registerCoffeescript() {
        registerLanguage("coffeescript", definition: coffeescriptLanguage)
    }
}
