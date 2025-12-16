// Auto-generated from highlight.js
// Language: dos

import Foundation

/// dos language definition
public func dosLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Batch file (DOS)"

    lang.aliases = ["bat", "cmd"]
    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": ["if", "else", "goto", "for", "in", "do", "call", "exit", "not", "exist", "errorlevel", "defined", "equ", "neq", "lss", "leq", "gtr", "geq"] as Any,
        "built_in": ["prn", "nul", "lpt3", "lpt2", "lpt1", "con", "com4", "com3", "com2", "com1", "aux", "shift", "cd", "dir", "echo", "setlocal", "endlocal", "set", "pause", "copy", "append", "assoc", "at", "attrib", "break", "cacls", "cd", "chcp", "chdir", "chkdsk", "chkntfs", "cls", "cmd", "color", "comp", "compact", "convert", "date", "dir", "diskcomp", "diskcopy", "doskey", "erase", "fs", "find", "findstr", "format", "ftype", "graftabl", "help", "keyb", "label", "md", "mkdir", "mode", "more", "move", "path", "pause", "print", "popd", "pushd", "promt", "rd", "recover", "rem", "rename", "replace", "restore", "rmdir", "shift", "sort", "start", "subst", "time", "title", "tree", "type", "ver", "verify", "vol", "ping", "net", "ipconfig", "taskkill", "xcopy", "ren", "del"] as Any,
    ])
    lang.illegal = .regex("\\/\\*")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("%%[^ ]|%[^ ]+?%|![^ ]+?!")
            mode.scope = .single("variable")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*[A-Za-z._?][A-Za-z0-9_$#@~.?]*(:|\\s+label)")
            mode.end = .regex("goto:eof")
            mode.scope = .single("function")
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
                .mode(CommonModes.COMMENT("^\\s*@?rem\\b", "$")),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b\\d+")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        /* circular ref: __ref_0 */ .mode(Mode()),
    ]

    return lang
}

/// Register dos language
public extension HighlightJS {
    func registerDos() {
        registerLanguage("dos", definition: dosLanguage)
    }
}
