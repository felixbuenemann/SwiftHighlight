// Auto-generated from highlight.js
// Language: gcode

import Foundation

/// gcode language definition
public func gcodeLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "G-code (ISO 6983)"

    lang.aliases = ["nc"]
    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": ["THEN", "ELSE", "ENDIF", "IF", "GOTO", "DO", "WHILE", "WH", "END", "CALL", "SUB", "ENDSUB", "EQ", "NE", "LT", "GT", "LE", "GE", "AND", "OR", "XOR", "%"] as Any,
        "built_in": ["ATAN", "ABS", "ACOS", "ASIN", "COS", "EXP", "FIX", "FUP", "ROUND", "LN", "SIN", "SQRT", "TAN", "EXISTS"] as Any,
    ])
    lang.contains = [
        .mode(CommonModes.COMMENT("\\(", "\\)")),
        .mode(CommonModes.COMMENT(";", "$")),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("title.function")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("/\\b//[GM]\\s*\\d+(\\.\\d+)?/")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("[GM]\\s*\\d+(\\.\\d+)?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("/\\b//T\\s*\\d+/")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("T\\s*\\d+")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("symbol")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("/\\b//O\\s*\\d+/")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("O\\s*\\d+")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("/\\b//O<.+>/")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("O<.+>")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\*\\s*\\d+\\s*$")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^N\\s*\\d+")
            mode.scope = .single("operator")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("-?#\\s*\\d+")
            mode.scope = .single("variable")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("property")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("/\\b//[ABCUVWXYZ]\\s*//[+-]?((\\.\\d+)|(\\d+)(\\.\\d*)?)/")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("/[ABCUVWXYZ]\\s*//[+-]?((\\.\\d+)|(\\d+)(\\.\\d*)?)/")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("params")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("/\\b//[FHIJKPQRS]\\s*//[+-]?((\\.\\d+)|(\\d+)(\\.\\d*)?)/")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("/[FHIJKPQRS]\\s*//[+-]?((\\.\\d+)|(\\d+)(\\.\\d*)?)/")
                    return mode
                }(),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register gcode language
public extension HighlightJS {
    func registerGcode() {
        registerLanguage("gcode", definition: gcodeLanguage)
    }
}
