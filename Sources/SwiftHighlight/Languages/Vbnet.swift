// Language: Visual Basic .NET
// Authors: Poren Chiang, Jan Pilzer
// Category: common

import Foundation

/// Visual Basic .NET language definition
public func vbnetLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Visual Basic .NET"
    lang.aliases = ["vb"]
    lang.caseInsensitive = true

    lang.keywords = .grouped([
        "keyword": "addhandler alias aggregate ansi as async assembly auto binary by byref byval call case catch class compare const continue custom declare default delegate dim distinct do each equals else elseif end enum erase error event exit explicit finally for friend from function get global goto group handles if implements imports in inherits interface into iterator join key let lib loop me mid module mustinherit mustoverride mybase myclass namespace narrowing new next notinheritable notoverridable of off on operator option optional order overloads overridable overrides paramarray partial preserve private property protected public raiseevent readonly redim removehandler resume return select set shadows shared skip static step stop structure strict sub synclock take text then throw to try unicode until using when where while widening with withevents writeonly yield" as Any,
        "built_in": "addressof and andalso await directcast gettype getxmlnamespace is isfalse isnot istrue like mod nameof new not or orelse trycast typeof xor cbool cbyte cchar cdate cdbl cdec cint clng cobj csbyte cshort csng cstr cuint culng cushort" as Any,
        "type": "boolean byte char date decimal double integer long object sbyte short single string uinteger ulong ushort" as Any,
        "literal": "true false nothing" as Any
    ])

    lang.illegal = .regex("//|\\\\{|\\\\}|endif|gosub|variant|wend|^\\\\$")

    // Character literal ("a"C)
    let CHARACTER = Mode()
    CHARACTER.scope = .single("string")
    CHARACTER.begin = .regex("\"(\"\"|[^/n])\"C\\b")

    // String with double quote escape
    let DOUBLE_QUOTE_ESCAPE = Mode()
    DOUBLE_QUOTE_ESCAPE.begin = .regex("\"\"")

    let STRING = Mode()
    STRING.scope = .single("string")
    STRING.begin = .regex("\"")
    STRING.end = .regex("\"")
    STRING.illegal = .regex("\\n")
    STRING.contains = [.mode(DOUBLE_QUOTE_ESCAPE)]

    // Date literals #...#
    let DATE_ISO = Mode()
    DATE_ISO.scope = .single("literal")
    DATE_ISO.begin = .regex("# *\\d{4}-\\d{1,2}-\\d{1,2} *#")

    let DATE_US = Mode()
    DATE_US.scope = .single("literal")
    DATE_US.begin = .regex("# *\\d{1,2}/\\d{1,2}/\\d{4} *#")

    let TIME_24H = Mode()
    TIME_24H.scope = .single("literal")
    TIME_24H.begin = .regex("# *\\d{1,2}(:\\d{1,2}){1,2} *#")

    let TIME_12H = Mode()
    TIME_12H.scope = .single("literal")
    TIME_12H.begin = .regex("# *(\\d|1[012])(:\\d+){0,2} *(AM|PM) *#")

    let DATE = Mode()
    DATE.variants = [DATE_ISO, DATE_US, TIME_24H, TIME_12H]

    // Numbers
    let NUMBER_FLOAT = Mode()
    NUMBER_FLOAT.scope = .single("number")
    NUMBER_FLOAT.begin = .regex("\\b\\d[\\d_]*((\\.\\d[\\d_]*(E[+-]?[\\d_]+)?)|E[+-]?[\\d_]+)[RFD@!#]?")
    NUMBER_FLOAT.relevance = 0

    let NUMBER_INT = Mode()
    NUMBER_INT.scope = .single("number")
    NUMBER_INT.begin = .regex("\\b\\d[\\d_]*((U?[SIL])|[%&])?")
    NUMBER_INT.relevance = 0

    let NUMBER_HEX = Mode()
    NUMBER_HEX.scope = .single("number")
    NUMBER_HEX.begin = .regex("&H[\\dA-F_]+((U?[SIL])|[%&])?")
    NUMBER_HEX.relevance = 0

    let NUMBER_OCT = Mode()
    NUMBER_OCT.scope = .single("number")
    NUMBER_OCT.begin = .regex("&O[0-7_]+((U?[SIL])|[%&])?")
    NUMBER_OCT.relevance = 0

    let NUMBER_BIN = Mode()
    NUMBER_BIN.scope = .single("number")
    NUMBER_BIN.begin = .regex("&B[01_]+((U?[SIL])|[%&])?")
    NUMBER_BIN.relevance = 0

    let NUMBER = Mode()
    NUMBER.variants = [NUMBER_FLOAT, NUMBER_INT, NUMBER_HEX, NUMBER_OCT, NUMBER_BIN]

    // Label
    let LABEL = Mode()
    LABEL.scope = .single("symbol")
    LABEL.begin = .regex("^\\w+:")

    // Doc comment
    let DOCTAG = Mode()
    DOCTAG.scope = .single("doctag")
    DOCTAG.begin = .regex("</?")
    DOCTAG.end = .regex(">")

    let DOC_COMMENT = Mode()
    DOC_COMMENT.scope = .single("comment")
    DOC_COMMENT.begin = .regex("'''")
    DOC_COMMENT.end = .regex("$")
    DOC_COMMENT.contains = [.mode(DOCTAG)]

    // Regular comment
    let APOS_COMMENT = Mode()
    APOS_COMMENT.scope = .single("comment")
    APOS_COMMENT.begin = .regex("'")
    APOS_COMMENT.end = .regex("$")

    let REM_COMMENT = Mode()
    REM_COMMENT.scope = .single("comment")
    REM_COMMENT.begin = .regex("([\\t ]|^)REM(?=\\s)")
    REM_COMMENT.end = .regex("$")

    let COMMENT = Mode()
    COMMENT.variants = [APOS_COMMENT, REM_COMMENT]

    // Preprocessor directives
    let DIRECTIVES = Mode()
    DIRECTIVES.scope = .single("meta")
    DIRECTIVES.begin = .regex("[\\t ]*#(const|disable|else|elseif|enable|end|externalsource|if|region)\\b")
    DIRECTIVES.end = .regex("$")
    DIRECTIVES.contains = [.mode(COMMENT)]

    lang.contains = [
        .mode(CHARACTER),
        .mode(STRING),
        .mode(DATE),
        .mode(NUMBER),
        .mode(LABEL),
        .mode(DOC_COMMENT),
        .mode(COMMENT),
        .mode(DIRECTIVES)
    ]

    return lang
}

/// Register VB.NET language
public extension HighlightJS {
    func registerVbnet() {
        registerLanguage("vbnet", definition: vbnetLanguage)
    }
}
