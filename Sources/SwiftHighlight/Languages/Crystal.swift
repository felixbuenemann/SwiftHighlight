// Auto-generated from highlight.js
// Language: crystal

import Foundation

/// crystal language definition
public func crystalLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Crystal"

    lang.aliases = ["cr"]
    lang.keywords = .grouped([
        "keyword": "abstract alias annotation as as? asm begin break case class def do else elsif end ensure enum extend for fun if include instance_sizeof is_a? lib macro module next nil? of out pointerof private protected rescue responds_to? return require select self sizeof struct super then type typeof union uninitialized unless until verbatim when while with yield __DIR__ __END_LINE__ __FILE__ __LINE__" as Any,
        "literal": "false nil true" as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.scope = .single("template-variable")
            mode.keywords = .grouped([
                "__circularRef": "__ref_0" as Any,
            ])

            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.scope = .single("string")
                    mode.relevance = 0
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("#\\{")
                            mode.end = .regex("\\}")
                            mode.scope = .single("subst")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_0" as Any,
                            ])

                            mode.contains = [
                                /* circular ref: __ref_1 */ .mode(Mode()),
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                .mode({
                                    let mode = Mode()
                                    mode.scope = .single("string")
                                    mode.relevance = 0
                                    mode.variants = [
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("%q\\(")
                                            mode.end = .regex("\\)")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\(")
                                                    mode.end = .regex("\\)")
                                                    mode.contains = [
                                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                                    ]
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("%q\\[")
                                            mode.end = .regex("\\]")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\[")
                                                    mode.end = .regex("\\]")
                                                    mode.contains = [
                                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                                    ]
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("%q\\{")
                                            mode.end = .regex("\\}")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\{")
                                                    mode.end = .regex("\\}")
                                                    mode.contains = [
                                                        /* circular ref: __ref_5 */ .mode(Mode()),
                                                    ]
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("%q<")
                                            mode.end = .regex(">")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("<")
                                                    mode.end = .regex(">")
                                                    mode.contains = [
                                                        /* circular ref: __ref_6 */ .mode(Mode()),
                                                    ]
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("%q\\|")
                                            mode.end = .regex("\\|")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("<<-'\\w+'$")
                                            mode.end = .regex("^\\s*\\w+$")
                                            return mode
                                        }(),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.scope = .single("regexp")
                                    mode.relevance = 0
                                    mode.contains = [
                                        /* circular ref: __ref_7 */ .mode(Mode()),
                                        /* circular ref: __ref_8 */ .mode(Mode()),
                                    ]
                                    mode.variants = [
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("%r\\(")
                                            mode.end = .regex("\\)")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\(")
                                                    mode.end = .regex("\\)")
                                                    mode.contains = [
                                                        /* circular ref: __ref_9 */ .mode(Mode()),
                                                    ]
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("%r\\[")
                                            mode.end = .regex("\\]")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\[")
                                                    mode.end = .regex("\\]")
                                                    mode.contains = [
                                                        /* circular ref: __ref_10 */ .mode(Mode()),
                                                    ]
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("%r\\{")
                                            mode.end = .regex("\\}")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\{")
                                                    mode.end = .regex("\\}")
                                                    mode.contains = [
                                                        /* circular ref: __ref_11 */ .mode(Mode()),
                                                    ]
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("%r<")
                                            mode.end = .regex(">")
                                            mode.contains = [
                                                .mode({
                                                    let mode = Mode()
                                                    mode.begin = .regex("<")
                                                    mode.end = .regex(">")
                                                    mode.contains = [
                                                        /* circular ref: __ref_12 */ .mode(Mode()),
                                                    ]
                                                    return mode
                                                }()),
                                            ]
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("%r\\|")
                                            mode.end = .regex("\\|")
                                            return mode
                                        }(),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("(?!%\\})(!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|-|-=|/=|/|:|;|<<|<<=|<=|<|===|==|=|>>>=|>>=|>=|>>>|>>|>|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~|\\n|\\b(case|if|select|unless|until|when|while)\\b)\\s*")
                                    mode.keywords = .simple("case if select unless until when while")

                                    mode.relevance = 0
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.scope = .single("regexp")
                                            mode.contains = [
                                                /* circular ref: __ref_7 */ .mode(Mode()),
                                                /* circular ref: __ref_8 */ .mode(Mode()),
                                            ]
                                            mode.variants = [
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("//[a-z]*")
                                                    mode.relevance = 0
                                                    return mode
                                                }(),
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("/(?!\\/)")
                                                    mode.end = .regex("/[a-z]*")
                                                    return mode
                                                }(),
                                            ]
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("@\\[")
                                    mode.end = .regex("\\]")
                                    mode.scope = .single("meta")
                                    mode.contains = [
                                        .mode(CommonModes.QUOTE_STRING_MODE()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("(\\$\\W)|((\\$|@@?)(\\w+))(?=[^@$?])(?![A-Za-z])(?![@$?'])")
                                    mode.scope = .single("variable")
                                    return mode
                                }()),
                                .mode(CommonModes.HASH_COMMENT_MODE()),
                                .mode({
                                    let mode = Mode()
                                    mode.end = .regex("$|;")
                                    mode.scope = .single("class")
                                    mode.beginKeywords = "class module struct"
                                    mode.illegal = .regex("=")
                                    mode.contains = [
                                        /* circular ref: __ref_13 */ .mode(Mode()),
                                        .mode(CommonModes.TITLE_MODE()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("<")
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.end = .regex("$|;")
                                    mode.scope = .single("class")
                                    mode.beginKeywords = "lib enum union"
                                    mode.illegal = .regex("=")
                                    mode.contains = [
                                        /* circular ref: __ref_13 */ .mode(Mode()),
                                        .mode(CommonModes.TITLE_MODE()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.end = .regex("$|;")
                                    mode.beginKeywords = "annotation"
                                    mode.illegal = .regex("=")
                                    mode.relevance = 2
                                    mode.contains = [
                                        /* circular ref: __ref_13 */ .mode(Mode()),
                                        .mode(CommonModes.TITLE_MODE()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.end = .regex("\\B\\b")
                                    mode.scope = .single("function")
                                    mode.beginKeywords = "def"
                                    mode.contains = [
                                        .mode(CommonModes.TITLE_MODE()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.end = .regex("\\B\\b")
                                    mode.scope = .single("function")
                                    mode.beginKeywords = "fun macro"
                                    mode.relevance = 2
                                    mode.contains = [
                                        .mode(CommonModes.TITLE_MODE()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("[a-zA-Z_]\\w*(!|\\?)?:")
                                    mode.scope = .single("symbol")
                                    mode.relevance = 0
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex(":")
                                    mode.scope = .single("symbol")
                                    mode.relevance = 0
                                    mode.contains = [
                                        /* circular ref: __ref_2 */ .mode(Mode()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("[a-zA-Z_]\\w*[!?=]?|[-+~]@|<<|>>|[=!]~|===?|<=>|[<>]=?|\\*\\*|[-/+%^&*~|]|//|//=|&[-+*]=?|&\\*\\*|\\[\\][=?]?")
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.scope = .single("number")
                                    mode.relevance = 0
                                    mode.variants = [
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\b0b([01_]+)(_?[ui](8|16|32|64|128))?")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\b0o([0-7_]+)(_?[ui](8|16|32|64|128))?")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\b0x([A-Fa-f0-9_]+)(_?[ui](8|16|32|64|128))?")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\b([1-9][0-9_]*[0-9]|[0-9])(\\.[0-9][0-9_]*)?([eE]_?[-+]?[0-9_]*)?(_?f(32|64))?(?!_)")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\b([1-9][0-9_]*|0)(_?[ui](8|16|32|64|128))?")
                                            return mode
                                        }(),
                                    ]
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                    ]
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("'")
                            mode.end = .regex("'")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\"")
                            mode.end = .regex("\"")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("`")
                            mode.end = .regex("`")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("%[Qwi]?\\(")
                            mode.end = .regex("\\)")
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\(")
                                    mode.end = .regex("\\)")
                                    mode.contains = [
                                        /* circular ref: __ref_14 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                            ]
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("%[Qwi]?\\[")
                            mode.end = .regex("\\]")
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\[")
                                    mode.end = .regex("\\]")
                                    mode.contains = [
                                        /* circular ref: __ref_15 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                            ]
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("%[Qwi]?\\{")
                            mode.end = .regex("\\}")
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\{")
                                    mode.end = .regex("\\}")
                                    mode.contains = [
                                        /* circular ref: __ref_16 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                            ]
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("%[Qwi]?<")
                            mode.end = .regex(">")
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("<")
                                    mode.end = .regex(">")
                                    mode.contains = [
                                        /* circular ref: __ref_17 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                            ]
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("%[Qwi]?\\|")
                            mode.end = .regex("\\|")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("<<-\\w+$")
                            mode.end = .regex("^\\s*\\w+$")
                            return mode
                        }(),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_18 */ .mode(Mode()),
                /* circular ref: __ref_19 */ .mode(Mode()),
                /* circular ref: __ref_20 */ .mode(Mode()),
                /* circular ref: __ref_21 */ .mode(Mode()),
                /* circular ref: __ref_22 */ .mode(Mode()),
                /* circular ref: __ref_13 */ .mode(Mode()),
                /* circular ref: __ref_23 */ .mode(Mode()),
                /* circular ref: __ref_24 */ .mode(Mode()),
                /* circular ref: __ref_25 */ .mode(Mode()),
                /* circular ref: __ref_26 */ .mode(Mode()),
                /* circular ref: __ref_27 */ .mode(Mode()),
                /* circular ref: __ref_28 */ .mode(Mode()),
                /* circular ref: __ref_29 */ .mode(Mode()),
                /* circular ref: __ref_30 */ .mode(Mode()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\{\\{")
                    mode.end = .regex("\\}\\}")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\{%")
                    mode.end = .regex("%\\}")
                    return mode
                }(),
            ]
            return mode
        }()),
        /* circular ref: __ref_2 */ .mode(Mode()),
        /* circular ref: __ref_18 */ .mode(Mode()),
        /* circular ref: __ref_19 */ .mode(Mode()),
        /* circular ref: __ref_20 */ .mode(Mode()),
        /* circular ref: __ref_21 */ .mode(Mode()),
        /* circular ref: __ref_22 */ .mode(Mode()),
        /* circular ref: __ref_13 */ .mode(Mode()),
        /* circular ref: __ref_23 */ .mode(Mode()),
        /* circular ref: __ref_24 */ .mode(Mode()),
        /* circular ref: __ref_25 */ .mode(Mode()),
        /* circular ref: __ref_26 */ .mode(Mode()),
        /* circular ref: __ref_27 */ .mode(Mode()),
        /* circular ref: __ref_28 */ .mode(Mode()),
        /* circular ref: __ref_29 */ .mode(Mode()),
        /* circular ref: __ref_30 */ .mode(Mode()),
    ]

    return lang
}

/// Register crystal language
public extension HighlightJS {
    func registerCrystal() {
        registerLanguage("crystal", definition: crystalLanguage)
    }
}
