// Auto-generated from highlight.js
// Language: vbscript

import Foundation

/// vbscript language definition
public func vbscriptLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "VBScript"

    lang.aliases = ["vbs"]
    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": ["call", "class", "const", "dim", "do", "loop", "erase", "execute", "executeglobal", "exit", "for", "each", "next", "function", "if", "then", "else", "on", "error", "option", "explicit", "new", "private", "property", "let", "get", "public", "randomize", "redim", "rem", "select", "case", "set", "stop", "sub", "while", "wend", "with", "end", "to", "elseif", "is", "or", "xor", "and", "not", "class_initialize", "class_terminate", "default", "preserve", "in", "me", "byval", "byref", "step", "resume", "goto"] as Any,
        "built_in": ["server", "response", "request", "scriptengine", "scriptenginebuildversion", "scriptengineminorversion", "scriptenginemajorversion"] as Any,
        "literal": ["true", "false", "null", "nothing", "empty"] as Any,
    ])
    lang.illegal = .regex("//")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("(?:lcase|month|vartype|instrrev|ubound|setlocale|getobject|rgb|getref|string|weekdayname|rnd|dateadd|monthname|now|day|minute|isarray|cbool|round|formatcurrency|conversions|csng|timevalue|second|year|space|abs|clng|timeserial|fixs|len|asc|isempty|maths|dateserial|atn|timer|isobject|filter|weekday|datevalue|ccur|isdate|instr|datediff|formatdatetime|replace|isnull|right|sgn|array|snumeric|log|cdbl|hex|chr|lbound|msgbox|ucase|getlocale|cos|cdate|cbyte|rtrim|join|hour|oct|typename|trim|strcomp|int|createobject|loadpicture|tan|formatnumber|mid|split|cint|sin|datepart|ltrim|sqr|time|derived|eval|date|formatpercent|exp|inputbox|left|ascw|chrw|regexp|cstr|err)\\s*\\(")
            mode.keywords = .grouped([
                "built_in": ["lcase", "month", "vartype", "instrrev", "ubound", "setlocale", "getobject", "rgb", "getref", "string", "weekdayname", "rnd", "dateadd", "monthname", "now", "day", "minute", "isarray", "cbool", "round", "formatcurrency", "conversions", "csng", "timevalue", "second", "year", "space", "abs", "clng", "timeserial", "fixs", "len", "asc", "isempty", "maths", "dateserial", "atn", "timer", "isobject", "filter", "weekday", "datevalue", "ccur", "isdate", "instr", "datediff", "formatdatetime", "replace", "isnull", "right", "sgn", "array", "snumeric", "log", "cdbl", "hex", "chr", "lbound", "msgbox", "ucase", "getlocale", "cos", "cdate", "cbyte", "rtrim", "join", "hour", "oct", "typename", "trim", "strcomp", "int", "createobject", "loadpicture", "tan", "formatnumber", "mid", "split", "cint", "sin", "datepart", "ltrim", "sqr", "time", "derived", "eval", "date", "formatpercent", "exp", "inputbox", "left", "ascw", "chrw", "regexp", "cstr", "err"] as Any,
            ])

            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.COMMENT("'", "$")),
        .mode(CommonModes.C_NUMBER_MODE()),
    ]

    return lang
}

/// Register vbscript language
public extension HighlightJS {
    func registerVbscript() {
        registerLanguage("vbscript", definition: vbscriptLanguage)
    }
}
