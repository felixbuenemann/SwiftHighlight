// Auto-generated from highlight.js
// Language: cos

import Foundation

/// cos language definition
public func cosLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Caché Object Script"

    lang.aliases = ["cls"]
    lang.caseInsensitive = true
    lang.keywords = .simple("property parameter class classmethod clientmethod extends as break catch close continue do d|0 else elseif for goto halt hang h|0 if job j|0 kill k|0 lock l|0 merge new open quit q|0 read r|0 return set s|0 tcommit throw trollback try tstart use view while write w|0 xecute x|0 zkill znspace zn ztrap zwrite zw zzdump zzwrite print zbreak zinsert zload zprint zremove zsave zzprint mv mvcall mvcrt mvdim mvprint zquit zsync ascii")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(\\d+(\\.\\d*)?|\\.\\d+)")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\"\"")
                            mode.relevance = 0
                            return mode
                        }()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(";")
            mode.end = .regex("$")
            mode.scope = .single("comment")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(?:\\$\\$?|\\.\\.)\\^?[a-zA-Z]+")
            mode.scope = .single("built_in")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$\\$\\$[a-zA-Z]+")
            mode.scope = .single("built_in")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("%[a-z]+(?:\\.[a-z]+)*")
            mode.scope = .single("built_in")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\^%?[a-zA-Z][\\w]*")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("##class|##super|#define|#dim")
            mode.scope = .single("keyword")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("&sql\\(")
            mode.end = .regex("\\)")
            mode.excludeBegin = true
            mode.excludeEnd = true
            mode.subLanguage = .single("sql")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("&(js|jscript|javascript)<")
            mode.end = .regex(">")
            mode.excludeBegin = true
            mode.excludeEnd = true
            mode.subLanguage = .single("javascript")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("&html<\\s*<")
            mode.end = .regex(">\\s*>")
            mode.subLanguage = .single("xml")
            return mode
        }()),
    ]

    return lang
}

/// Register cos language
public extension HighlightJS {
    func registerCos() {
        registerLanguage("cos", definition: cosLanguage)
    }
}
