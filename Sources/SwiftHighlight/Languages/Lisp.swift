// Auto-generated from highlight.js
// Language: lisp

import Foundation

/// lisp language definition
public func lispLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Lisp"

    lang.illegal = .regex("\\S")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.scope = .single("number")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("(-|\\+)?\\d+(\\.\\d+|\\/\\d+)?((d|e|f|l|s|D|E|F|L|S)(\\+|-)?\\d+)?")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#(b|B)[0-1]+(/[0-1]+)?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#(o|O)[0-7]+(/[0-7]+)?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#(x|X)[0-9a-fA-F]+(/[0-9a-fA-F]+)?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#(c|C)\\((-|\\+)?\\d+(\\.\\d+|\\/\\d+)?((d|e|f|l|s|D|E|F|L|S)(\\+|-)?\\d+)? +(-|\\+)?\\d+(\\.\\d+|\\/\\d+)?((d|e|f|l|s|D|E|F|L|S)(\\+|-)?\\d+)?")
                    mode.end = .regex("\\)")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode(CommonModes.SHEBANG()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(t{1}|nil)\\b")
            mode.scope = .single("literal")
            return mode
        }()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.COMMENT(";", "$")),
        .mode({
            let mode = Mode()
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\*")
                    mode.end = .regex("\\*")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[:&][a-zA-Z_\\-+\\*\\/<=>&#][a-zA-Z0-9_\\-+*\\/<=>&#!]*")
                    mode.scope = .single("symbol")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.contains = [
                        .selfReference,
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[a-zA-Z_\\-+\\*\\/<=>&#][a-zA-Z0-9_\\-+*\\/<=>&#!]*")
                            mode.relevance = 0
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_3 */ .mode(Mode()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("['`]\\(")
                    mode.end = .regex("\\)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\(quote ")
                    mode.end = .regex("\\)")
                    mode.keywords = .grouped([
                        "name": "quote" as Any,
                    ])

                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'\\|[^]*?\\|")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("'[a-zA-Z_\\-+\\*\\/<=>&#][a-zA-Z0-9_\\-+*\\/<=>&#!]*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#'[a-zA-Z_\\-+\\*\\/<=>&#][a-zA-Z0-9_\\-+*\\/<=>&#!]*(::[a-zA-Z_\\-+\\*\\/<=>&#][a-zA-Z0-9_\\-+*\\/<=>&#!]*)*")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\(\\s*")
            mode.end = .regex("\\)")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.scope = .single("name")
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("[a-zA-Z_\\-+\\*\\/<=>&#][a-zA-Z0-9_\\-+*\\/<=>&#!]*")
                            mode.relevance = 0
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\|[^]*?\\|")
                            return mode
                        }(),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.relevance = 0
                    mode.endsWithParent = true
                    mode.contains = [
                        /* circular ref: __ref_4 */ .mode(Mode()),
                        /* circular ref: __ref_5 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_7 */ .mode(Mode()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                        /* circular ref: __ref_9 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\|[^]*?\\|")
                            return mode
                        }()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        /* circular ref: __ref_3 */ .mode(Mode()),
    ]

    return lang
}

/// Register lisp language
public extension HighlightJS {
    func registerLisp() {
        registerLanguage("lisp", definition: lispLanguage)
    }
}
