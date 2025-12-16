// Auto-generated from highlight.js
// Language: lua

import Foundation

/// lua language definition
public func luaLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Lua"

    lang.aliases = ["pluto"]
    lang.keywords = .grouped([
        "literal": "true false nil" as Any,
        "keyword": "and break do else elseif end for goto if in local not or repeat return then until while" as Any,
        "built_in": "_G _ENV _VERSION __index __newindex __mode __call __metatable __tostring __len __gc __add __sub __mul __div __mod __pow __concat __unm __eq __lt __le assert collectgarbage dofile error getfenv getmetatable ipairs load loadfile loadstring module next pairs pcall print rawequal rawget rawset require select setfenv setmetatable tonumber tostring type unpack xpcall arg self coroutine resume yield status wrap create running debug getupvalue debug sethook getmetatable gethook setmetatable setlocal traceback setfenv getinfo setupvalue getlocal getregistry getfenv io lines write close flush open output type read stderr stdin input stdout popen tmpfile math log max acos huge ldexp pi cos tanh pow deg tan cosh sinh random randomseed frexp ceil floor rad abs sqrt modf asin min mod fmod log10 atan2 exp sin atan os exit setlocale date getenv difftime remove time clock tmpname rename execute package preload loadlib loaded loaders cpath config path seeall string sub upper len gfind rep find match char dump gmatch reverse byte format gsub lower table setn insert getn foreachi maxn foreach concat sort remove" as Any,
    ])
    lang.contains = [
        .mode(CommonModes.COMMENT("--(?!\\[=*\\[)", "$")),
        .mode(CommonModes.COMMENT("--\\[=*\\[", "\\]=*\\]")),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\)")
            mode.scope = .single("function")
            mode.beginKeywords = "function"
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.scope = .single("params")
                    mode.endsWithParent = true
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[=*\\[")
            mode.end = .regex("\\]=*\\]")
            mode.scope = .single("string")
            mode.relevance = 5
            mode.contains = [
                /* circular ref: __ref_2 */ .mode(Mode()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register lua language
public extension HighlightJS {
    func registerLua() {
        registerLanguage("lua", definition: luaLanguage)
    }
}
