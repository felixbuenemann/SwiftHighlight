// Auto-generated from highlight.js
// Language: autohotkey

import Foundation

/// autohotkey language definition
public func autohotkeyLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "AutoHotkey"

    lang.aliases = ["ahk"]
    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": "Break Continue Critical Exit ExitApp Gosub Goto New OnExit Pause return SetBatchLines SetTimer Suspend Thread Throw Until ahk_id ahk_class ahk_pid ahk_exe ahk_group" as Any,
        "literal": "true false NOT AND OR" as Any,
        "built_in": "ComSpec Clipboard ClipboardAll ErrorLevel" as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("`[\\s\\S]")
            return mode
        }()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.COMMENT(";", "$")),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b\\d+(\\.\\d+)?")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("%[a-zA-Z0-9#_$@]+%")
            mode.scope = .single("variable")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*\\w+\\s*(,|%)")
            mode.scope = .single("built_in")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("title")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("^[^\\n\";]+::(?!=)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("^[^\\n\";]+:(?!=)")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*#\\w+")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("A_[a-zA-Z0-9]+")
            mode.scope = .single("built_in")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(",\\s*,")
            return mode
        }()),
    ]

    return lang
}

/// Register autohotkey language
public extension HighlightJS {
    func registerAutohotkey() {
        registerLanguage("autohotkey", definition: autohotkeyLanguage)
    }
}
