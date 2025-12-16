// Auto-generated from highlight.js
// Language: vala

import Foundation

/// vala language definition
public func valaLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Vala"

    lang.keywords = .grouped([
        "keyword": "char uchar unichar int uint long ulong short ushort int8 int16 int32 int64 uint8 uint16 uint32 uint64 float double bool struct enum string void weak unowned owned async signal static abstract interface override virtual delegate if while do for foreach else switch case break default return try catch public private protected internal using new this get set const stdout stdin stderr var" as Any,
        "built_in": "DBus GLib CCode Gee Object Gtk Posix" as Any,
        "literal": "false true null" as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.end = .regex("\\{")
            mode.scope = .single("class")
            mode.beginKeywords = "class interface namespace"
            mode.illegal = .regex("[^,:\\n\\s\\.]")
            mode.excludeEnd = true
            mode.contains = [
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
            ]
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"\"\"")
            mode.end = .regex("\"\"\"")
            mode.scope = .single("string")
            mode.relevance = 5
            return mode
        }()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^#")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            return mode
        }()),
    ]

    return lang
}

/// Register vala language
public extension HighlightJS {
    func registerVala() {
        registerLanguage("vala", definition: valaLanguage)
    }
}
