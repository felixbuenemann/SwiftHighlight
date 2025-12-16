// Auto-generated from highlight.js
// Language: tcl

import Foundation

/// tcl language definition
public func tclLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Tcl"

    lang.aliases = ["tk"]
    lang.keywords = .array(["after", "append", "apply", "array", "auto_execok", "auto_import", "auto_load", "auto_mkindex", "auto_mkindex_old", "auto_qualify", "auto_reset", "bgerror", "binary", "break", "catch", "cd", "chan", "clock", "close", "concat", "continue", "dde", "dict", "encoding", "eof", "error", "eval", "exec", "exit", "expr", "fblocked", "fconfigure", "fcopy", "file", "fileevent", "filename", "flush", "for", "foreach", "format", "gets", "glob", "global", "history", "http", "if", "incr", "info", "interp", "join", "lappend|10", "lassign|10", "lindex|10", "linsert|10", "list", "llength|10", "load", "lrange|10", "lrepeat|10", "lreplace|10", "lreverse|10", "lsearch|10", "lset|10", "lsort|10", "mathfunc", "mathop", "memory", "msgcat", "namespace", "open", "package", "parray", "pid", "pkg::create", "pkg_mkIndex", "platform", "platform::shell", "proc", "puts", "pwd", "read", "refchan", "regexp", "registry", "regsub|10", "rename", "return", "safe", "scan", "seek", "set", "socket", "source", "split", "string", "subst", "switch", "tcl_endOfWord", "tcl_findLibrary", "tcl_startOfNextWord", "tcl_startOfPreviousWord", "tcl_wordBreakAfter", "tcl_wordBreakBefore", "tcltest", "tclvars", "tell", "time", "tm", "trace", "unknown", "unload", "unset", "update", "uplevel", "upvar", "variable", "vwait", "while"])
    lang.contains = [
        .mode(CommonModes.COMMENT(";[ \\t]*#", "$")),
        .mode(CommonModes.COMMENT("^[ \\t]*#", "$")),
        .mode({
            let mode = Mode()
            mode.end = .regex("[\\{]")
            mode.beginKeywords = "proc"
            mode.excludeEnd = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[ \\t\\n\\r]+(::)?[a-zA-Z_]((::)?[a-zA-Z0-9_])*")
                    mode.end = .regex("[ \\t\\n\\r]")
                    mode.scope = .single("title")
                    mode.endsWithParent = true
                    mode.excludeEnd = true
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("variable")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("/\\$/(?:::)?/[a-zA-Z_][a-zA-Z0-9_]*/(::/[a-zA-Z_][a-zA-Z0-9_]*/)*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\$\\{(::)?[a-zA-Z_]((::)?[a-zA-Z0-9_])*")
                    mode.end = .regex("\\}")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("number")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\b(0b[01]+)")
                                    mode.scope = .single("number")
                                    mode.relevance = 0
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)")
                                    mode.scope = .single("number")
                                    mode.relevance = 0
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        /* circular ref: __ref_0 */ .mode(Mode()),
    ]

    return lang
}

/// Register tcl language
public extension HighlightJS {
    func registerTcl() {
        registerLanguage("tcl", definition: tclLanguage)
    }
}
