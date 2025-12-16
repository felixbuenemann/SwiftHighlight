// Auto-generated from highlight.js
// Language: ocaml

import Foundation

/// ocaml language definition
public func ocamlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "OCaml"

    lang.aliases = ["ml"]
    lang.keywords = .grouped([
        "keyword": "and as assert asr begin class constraint do done downto else end exception external for fun function functor if in include inherit! inherit initializer land lazy let lor lsl lsr lxor match method!|10 method mod module mutable new object of open! open or private rec sig struct then to try type val! val virtual when while with parser value" as Any,
        "built_in": "array bool bytes char exn|5 float int int32 int64 list lazy_t|5 nativeint|5 string unit in_channel out_channel ref" as Any,
        "literal": "true false" as Any,
    ])
    lang.illegal = .regex("\\/\\/|>>")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[(\\|\\|)?\\]|\\(\\)")
            mode.scope = .single("literal")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.COMMENT("\\(\\*", "\\*\\)")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'[A-Za-z_](?!')[\\w']*")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("`[A-Z][\\w']*")
            mode.scope = .single("type")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b[A-Z][\\w']*")
            mode.scope = .single("type")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-z_]\\w*'[\\w']*")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(0[xX][a-fA-F0-9_]+[Lln]?|0[oO][0-7_]+[Lln]?|0[bB][01_]+[Lln]?|[0-9][0-9_]*([Lln]|(\\.[0-9_]*)?([eE][-+]?[0-9_]+)?)?)")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("->")
            return mode
        }()),
    ]

    return lang
}

/// Register ocaml language
public extension HighlightJS {
    func registerOcaml() {
        registerLanguage("ocaml", definition: ocamlLanguage)
    }
}
