// Auto-generated from highlight.js
// Language: elm

import Foundation

/// elm language definition
public func elmLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Elm"

    lang.keywords = .array(["let", "in", "if", "then", "else", "case", "of", "where", "module", "import", "exposing", "type", "alias", "as", "infix", "infixl", "infixr", "port", "effect", "command", "subscription"])
    lang.illegal = .regex(";")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.end = .regex("exposing")
            mode.keywords = .simple("port effect module where command subscription exposing")

            mode.beginKeywords = "port effect module"
            mode.illegal = .regex("\\W\\.|;")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.illegal = .regex("\"")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\b[A-Z][\\w]*(\\((\\.\\.|,|\\w+)\\))?")
                            mode.scope = .single("type")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("--")
                                    mode.end = .regex("$")
                                    mode.scope = .single("comment")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\{-")
                                    mode.end = .regex("-\\}")
                                    mode.scope = .single("comment")
                                    mode.contains = [
                                        .selfReference,
                                    ]
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("import")
            mode.end = .regex("$")
            mode.keywords = .simple("import as exposing")

            mode.illegal = .regex("\\W\\.|;")
            mode.contains = [
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("type")
            mode.end = .regex("$")
            mode.keywords = .simple("type alias")

            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\b[A-Z][\\w']*")
                    mode.scope = .single("type")
                    mode.relevance = 0
                    return mode
                }()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\{")
                    mode.end = .regex("\\}")
                    mode.contains = [
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_0 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("$")
            mode.beginKeywords = "infix infixl infixr"
            mode.contains = [
                .mode(CommonModes.C_NUMBER_MODE()),
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("port")
            mode.end = .regex("$")
            mode.keywords = .simple("port")

            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'\\\\?.")
            mode.end = .regex("'")
            mode.scope = .single("string")
            mode.illegal = .regex(".")
            return mode
        }()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        /* circular ref: __ref_3 */ .mode(Mode()),
        /* circular ref: __ref_4 */ .mode(Mode()),
        .mode(CommonModes.TITLE_MODE()),
        /* circular ref: __ref_0 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("->|<-")
            return mode
        }()),
    ]

    return lang
}

/// Register elm language
public extension HighlightJS {
    func registerElm() {
        registerLanguage("elm", definition: elmLanguage)
    }
}
