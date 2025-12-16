// Auto-generated from highlight.js
// Language: haskell

import Foundation

/// haskell language definition
public func haskellLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Haskell"

    lang.aliases = ["hs"]
    lang.unicodeRegex = true
    lang.keywords = .simple("let in if then else case of where do module import hiding qualified type data newtype deriving class instance as default infix infixl infixr foreign export ccall stdcall cplusplus jvm dotnet safe unsafe family forall mdo proc rec")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.end = .regex("where")
            mode.keywords = .simple("module where")

            mode.beginKeywords = "module"
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
                            mode.begin = .regex("\\{-#")
                            mode.end = .regex("#-\\}")
                            mode.scope = .single("meta")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("^#")
                            mode.end = .regex("$")
                            mode.scope = .single("meta")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\b[A-Z][\\w]*(\\((\\.\\.|,|\\w+)\\))?")
                            mode.scope = .single("type")
                            return mode
                        }()),
                        .mode(CommonModes.TITLE_MODE()),
                        .mode({
                            let mode = Mode()
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("--+")
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
            mode.begin = .regex("\\bimport\\b")
            mode.end = .regex("$")
            mode.keywords = .simple("import qualified as hiding")

            mode.illegal = .regex("\\W\\.|;")
            mode.contains = [
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^(\\s*)?(class|instance)\\b")
            mode.end = .regex("where")
            mode.scope = .single("class")
            mode.keywords = .simple("class family instance where")

            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\b[A-Z][\\w']*")
                    mode.scope = .single("type")
                    mode.relevance = 0
                    return mode
                }()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(data|(new)?type)\\b")
            mode.end = .regex("$")
            mode.scope = .single("class")
            mode.keywords = .simple("data family type newtype deriving")

            mode.contains = [
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\{")
                    mode.end = .regex("\\}")
                    mode.contains = [
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_4 */ .mode(Mode()),
                        /* circular ref: __ref_5 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
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
            mode.beginKeywords = "default"
            mode.contains = [
                /* circular ref: __ref_3 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
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
            mode.begin = .regex("\\bforeign\\b")
            mode.end = .regex("$")
            mode.keywords = .simple("foreign import export ccall stdcall cplusplus jvm dotnet safe unsafe")

            mode.contains = [
                /* circular ref: __ref_3 */ .mode(Mode()),
                .mode(CommonModes.QUOTE_STRING_MODE()),
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#!\\/usr\\/bin\\/env runhaskell")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            return mode
        }()),
        /* circular ref: __ref_2 */ .mode(Mode()),
        /* circular ref: __ref_4 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'(?=\\\\?.')")
            mode.end = .regex("'")
            mode.scope = .single("string")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\\\.")
                    mode.scope = .single("char.escape")
                    return mode
                }()),
            ]
            return mode
        }()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.scope = .single("number")
            mode.relevance = 0
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b(([0-9]_*)+)(\\.(([0-9]_*)+))?([eE][+-]?(([0-9]_*)+))?\\b")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b0[xX]_*(([0-9a-fA-F]_*)+)(\\.(([0-9a-fA-F]_*)+))?([pP][+-]?(([0-9]_*)+))?\\b")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b0[oO](([0-7]_*)+)\\b")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b0[bB](([01]_*)+)\\b")
                    return mode
                }(),
            ]
            return mode
        }()),
        /* circular ref: __ref_3 */ .mode(Mode()),
        .mode(CommonModes.TITLE_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(?!-)([!#$%&*+.\\/<=>?@\\\\^~-]|(?!([(),;\\[\\]`|{}]|[_:\"']))(\\p{S}|\\p{P}))--+|--+(?!-)([!#$%&*+.\\/<=>?@\\\\^~-]|(?!([(),;\\[\\]`|{}]|[_:\"']))(\\p{S}|\\p{P}))")
            return mode
        }()),
        /* circular ref: __ref_0 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("->|<-")
            return mode
        }()),
    ]

    return lang
}

/// Register haskell language
public extension HighlightJS {
    func registerHaskell() {
        registerLanguage("haskell", definition: haskellLanguage)
    }
}
