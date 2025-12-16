// Auto-generated from highlight.js
// Language: sml

import Foundation

/// sml language definition
public func smlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "SML (Standard ML)"

    lang.aliases = ["ml"]
    lang.keywords = .grouped([
        "keyword": "abstype and andalso as case datatype do else end eqtype exception fn fun functor handle if in include infix infixr let local nonfix of op open orelse raise rec sharing sig signature struct structure then type val with withtype where while" as Any,
        "built_in": "array bool char exn int list option order real ref string substring vector unit word" as Any,
        "literal": "true false NONE SOME LESS EQUAL GREATER nil" as Any,
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
            mode.begin = .regex("[-=]>")
            return mode
        }()),
    ]

    return lang
}

/// Register sml language
public extension HighlightJS {
    func registerSml() {
        registerLanguage("sml", definition: smlLanguage)
    }
}
