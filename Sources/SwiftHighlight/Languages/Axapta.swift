// Auto-generated from highlight.js
// Language: axapta

import Foundation

/// axapta language definition
public func axaptaLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "X++"

    lang.aliases = ["x++"]
    lang.keywords = .grouped([
        "keyword": ["abstract", "as", "asc", "avg", "break", "breakpoint", "by", "byref", "case", "catch", "changecompany", "class", "client", "client", "common", "const", "continue", "count", "crosscompany", "delegate", "delete_from", "desc", "display", "div", "do", "edit", "else", "eventhandler", "exists", "extends", "final", "finally", "firstfast", "firstonly", "firstonly1", "firstonly10", "firstonly100", "firstonly1000", "flush", "for", "forceliterals", "forcenestedloop", "forceplaceholders", "forceselectorder", "forupdate", "from", "generateonly", "group", "hint", "if", "implements", "in", "index", "insert_recordset", "interface", "internal", "is", "join", "like", "maxof", "minof", "mod", "namespace", "new", "next", "nofetch", "notexists", "optimisticlock", "order", "outer", "pessimisticlock", "print", "private", "protected", "public", "readonly", "repeatableread", "retry", "return", "reverse", "select", "server", "setting", "static", "sum", "super", "switch", "this", "throw", "try", "ttsabort", "ttsbegin", "ttscommit", "unchecked", "update_recordset", "using", "validtimestate", "void", "where", "while"] as Any,
        "built_in": ["anytype", "boolean", "byte", "char", "container", "date", "double", "enum", "guid", "int", "int64", "long", "real", "short", "str", "utcdatetime", "var"] as Any,
        "literal": ["default", "false", "null", "true"] as Any,
    ])
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .multi([2: "title.class", 4: "title.class.inherited"])
            mode.keywords = .grouped([
                "__circularRef": "__ref_0" as Any,
            ])

            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("(class|interface)\\s+"), .regex("[a-zA-Z_]\\w*"), .regex("\\s+(extends|implements)\\s+"), .regex("[a-zA-Z_]\\w*")])
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("class\\s+"), .regex("[a-zA-Z_]\\w*")])
                    return mode
                }(),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register axapta language
public extension HighlightJS {
    func registerAxapta() {
        registerLanguage("axapta", definition: axaptaLanguage)
    }
}
