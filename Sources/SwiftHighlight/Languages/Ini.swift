// Language: TOML, also INI
// Description: TOML/INI configuration file format
// Contributors: Guillaume Gomez <guillaume1.gomez@gmail.com>
// Category: common, config

import Foundation

/// INI/TOML language definition
public func iniLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "TOML, also INI"
    lang.aliases = ["toml"]
    lang.caseInsensitive = true
    lang.illegal = .regex("\\\\S")

    // Comments (; and #)
    let SEMICOLON_COMMENT = Mode()
    SEMICOLON_COMMENT.scope = .single("comment")
    SEMICOLON_COMMENT.begin = .regex(";")
    SEMICOLON_COMMENT.end = .regex("$")

    let HASH_COMMENT = Mode()
    HASH_COMMENT.scope = .single("comment")
    HASH_COMMENT.begin = .regex("#")
    HASH_COMMENT.end = .regex("$")

    let COMMENT = Mode()
    COMMENT.variants = [SEMICOLON_COMMENT, HASH_COMMENT]

    // Numbers
    let NUMBER_WITH_UNDERSCORES = Mode()
    NUMBER_WITH_UNDERSCORES.scope = .single("number")
    NUMBER_WITH_UNDERSCORES.begin = .regex("([+-]+)?[\\\\d]+_[\\\\d_]+")
    NUMBER_WITH_UNDERSCORES.relevance = 0

    let PLAIN_NUMBER = Mode()
    PLAIN_NUMBER.scope = .single("number")
    PLAIN_NUMBER.begin = .regex("\\\\b\\\\d+(\\\\.\\\\d+)?")
    PLAIN_NUMBER.relevance = 0

    let NUMBERS = Mode()
    NUMBERS.variants = [NUMBER_WITH_UNDERSCORES, PLAIN_NUMBER]

    // Variables
    let VARIABLE_SIMPLE = Mode()
    VARIABLE_SIMPLE.scope = .single("variable")
    VARIABLE_SIMPLE.begin = .regex("\\\\$[\\\\w\\\\d\"][\\\\w\\\\d_]*")

    let VARIABLE_BRACES = Mode()
    VARIABLE_BRACES.scope = .single("variable")
    VARIABLE_BRACES.begin = .regex("\\\\$\\\\{(.*?)\\\\}")

    let VARIABLES = Mode()
    VARIABLES.variants = [VARIABLE_SIMPLE, VARIABLE_BRACES]

    // Literals
    let LITERALS = Mode()
    LITERALS.scope = .single("literal")
    LITERALS.begin = .regex("\\\\bon|off|true|false|yes|no\\\\b")

    // Strings
    let TRIPLE_APOS_STRING = Mode()
    TRIPLE_APOS_STRING.scope = .single("string")
    TRIPLE_APOS_STRING.begin = .regex("'''")
    TRIPLE_APOS_STRING.end = .regex("'''")
    TRIPLE_APOS_STRING.relevance = 10

    let TRIPLE_QUOTE_STRING = Mode()
    TRIPLE_QUOTE_STRING.scope = .single("string")
    TRIPLE_QUOTE_STRING.begin = .regex("\"\"\"")
    TRIPLE_QUOTE_STRING.end = .regex("\"\"\"")
    TRIPLE_QUOTE_STRING.relevance = 10

    let QUOTE_STRING = Mode()
    QUOTE_STRING.scope = .single("string")
    QUOTE_STRING.begin = .regex("\"")
    QUOTE_STRING.end = .regex("\"")
    QUOTE_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]

    let APOS_STRING = Mode()
    APOS_STRING.scope = .single("string")
    APOS_STRING.begin = .regex("'")
    APOS_STRING.end = .regex("'")

    let STRINGS = Mode()
    STRINGS.variants = [TRIPLE_APOS_STRING, TRIPLE_QUOTE_STRING, QUOTE_STRING, APOS_STRING]

    // Array
    let ARRAY = Mode()
    ARRAY.begin = .regex("\\\\[")
    ARRAY.end = .regex("\\\\]")
    ARRAY.contains = [
        .mode(COMMENT),
        .mode(LITERALS),
        .mode(VARIABLES),
        .mode(STRINGS),
        .mode(NUMBERS),
        .selfReference
    ]
    ARRAY.relevance = 0

    // Section headers
    let SECTION = Mode()
    SECTION.scope = .single("section")
    SECTION.begin = .regex("\\\\[+")
    SECTION.end = .regex("\\\\]+")

    // Attribute key
    let BARE_KEY = "[A-Za-z0-9_-]+"
    let QUOTED_KEY_DOUBLE = "\"(\\\\\\\\\"|[^\"])*\""
    let QUOTED_KEY_SINGLE = "'[^']*'"
    let ANY_KEY = "(?:\(BARE_KEY)|\(QUOTED_KEY_DOUBLE)|\(QUOTED_KEY_SINGLE))"
    let DOTTED_KEY = "\(ANY_KEY)(\\\\s*\\\\.\\\\s*\(ANY_KEY))*(?=\\\\s*=\\\\s*[^#\\\\s])"

    // Attribute with value
    let ATTR_VALUE = Mode()
    ATTR_VALUE.end = .regex("$")
    ATTR_VALUE.contains = [
        .mode(COMMENT),
        .mode(ARRAY),
        .mode(LITERALS),
        .mode(VARIABLES),
        .mode(STRINGS),
        .mode(NUMBERS)
    ]

    let ATTR = Mode()
    ATTR.scope = .single("attr")
    ATTR.begin = .regex(DOTTED_KEY)
    ATTR.starts = ATTR_VALUE

    lang.contains = [
        .mode(COMMENT),
        .mode(SECTION),
        .mode(ATTR)
    ]

    return lang
}

/// Register INI language
public extension HighlightJS {
    func registerIni() {
        registerLanguage("ini", definition: iniLanguage)
    }
}
