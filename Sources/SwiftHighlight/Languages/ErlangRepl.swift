// Auto-generated from highlight.js
// Language: erlang-repl

import Foundation

/// erlang-repl language definition
public func erlang_replLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Erlang REPL"

    lang.keywords = .grouped([
        "built_in": "spawn spawn_link self" as Any,
        "keyword": "after and andalso|10 band begin bnot bor bsl bsr bxor case catch cond div end fun if let not of or orelse|10 query receive rem try when xor" as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[0-9]+> ")
            mode.scope = .single("meta.prompt")
            mode.relevance = 10
            return mode
        }()),
        .mode(CommonModes.COMMENT("%", "$")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(\\d+(_\\d+)*#[a-fA-F0-9]+(_[a-fA-F0-9]+)*|\\d+(_\\d+)*(\\.\\d+(_\\d+)*)?([eE][-+]?\\d+)?)")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/\\?(::)?//([A-Z]\\w*)//((::)[A-Z]\\w*)*/")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("->")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("ok")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("!")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(\\b[a-z'][a-zA-Z0-9_']*:[a-z'][a-zA-Z0-9_']*)|(\\b[a-z'][a-zA-Z0-9_']*)")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[A-Z][a-zA-Z0-9_']*")
            mode.relevance = 0
            return mode
        }()),
    ]

    return lang
}

/// Register erlang-repl language
public extension HighlightJS {
    func registerErlangRepl() {
        registerLanguage("erlang-repl", definition: erlang_replLanguage)
    }
}
