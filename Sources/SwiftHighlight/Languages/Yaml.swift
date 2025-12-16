// Auto-generated from highlight.js
// Language: yaml

import Foundation

/// yaml language definition
public func yamlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "YAML"

    lang.aliases = ["yml"]
    lang.caseInsensitive = true
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.scope = .single("attr")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("[\\w*@][\\w*@ :()\\./-]*:(?=[ \\t]|$)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"[\\w*@][\\w*@ :()\\./-]*\":(?=[ \\t]|$)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'[\\w*@][\\w*@ :()\\./-]*':(?=[ \\t]|$)")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^---\\s*$")
            mode.scope = .single("meta")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[\\|>]([1-9]?[+-])?[ ]*\\n( +)[^ ][^\\n]*\\n(\\2[^\\n]+\\n?)*")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("<%[%=-]?")
            mode.end = .regex("[%-]?%>")
            mode.relevance = 0
            mode.excludeBegin = true
            mode.excludeEnd = true
            mode.subLanguage = .single("ruby")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("!\\w+![\\w#;/?:@&=+$,.~*'()[\\]]+")
            mode.scope = .single("type")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("!<[\\w#;/?:@&=+$,.~*'()[\\]]+>")
            mode.scope = .single("type")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("![\\w#;/?:@&=+$,.~*'()[\\]]+")
            mode.scope = .single("type")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("!![\\w#;/?:@&=+$,.~*'()[\\]]+")
            mode.scope = .single("type")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("&[a-zA-Z_]\\w*$")
            mode.scope = .single("meta")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\*[a-zA-Z_]\\w*$")
            mode.scope = .single("meta")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("-(?=[ ]|$)")
            mode.scope = .single("bullet")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.keywords = .grouped([
                "literal": "true false yes no null" as Any,
            ])

            mode.beginKeywords = "true false yes no null"
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b[0-9]{4}(-[0-9][0-9]){0,2}([Tt \\t][0-9][0-9]?(:[0-9][0-9]){2})?(\\.[0-9]*)?([ \\t])*(Z|[-+][0-9][0-9]?(:[0-9][0-9])?)?\\b")
            mode.scope = .single("number")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)\\b")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{")
            mode.end = .regex("\\}")
            mode.illegal = .regex("\\n")
            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.end = .regex(",")
                    mode.keywords = .simple("true false yes no null")

                    mode.relevance = 0
                    mode.endsWithParent = true
                    mode.excludeEnd = true
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        /* circular ref: __ref_4 */ .mode(Mode()),
                        /* circular ref: __ref_5 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                        /* circular ref: __ref_7 */ .mode(Mode()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                        /* circular ref: __ref_9 */ .mode(Mode()),
                        /* circular ref: __ref_10 */ .mode(Mode()),
                        /* circular ref: __ref_11 */ .mode(Mode()),
                        /* circular ref: __ref_12 */ .mode(Mode()),
                        /* circular ref: __ref_13 */ .mode(Mode()),
                        /* circular ref: __ref_14 */ .mode(Mode()),
                        /* circular ref: __ref_15 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\[")
                            mode.end = .regex("\\]")
                            mode.illegal = .regex("\\n")
                            mode.relevance = 0
                            mode.contains = [
                                /* circular ref: __ref_16 */ .mode(Mode()),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("'")
                            mode.end = .regex("'")
                            mode.scope = .single("string")
                            mode.relevance = 0
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("''")
                                    mode.scope = .single("char.escape")
                                    mode.relevance = 0
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("string")
                            mode.relevance = 0
                            mode.contains = [
                                .mode(CommonModes.BACKSLASH_ESCAPE()),
                                .mode({
                                    let mode = Mode()
                                    mode.scope = .single("template-variable")
                                    mode.variants = [
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\{\\{")
                                            mode.end = .regex("\\}\\}")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("%\\{")
                                            mode.end = .regex("\\}")
                                            return mode
                                        }(),
                                    ]
                                    return mode
                                }()),
                            ]
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("'")
                                    mode.end = .regex("'")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("''")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                    ]
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
                                    mode.begin = .regex("[^\\s,{}[\\]]+")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        /* circular ref: __ref_17 */ .mode(Mode()),
        /* circular ref: __ref_18 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_19 */ .mode(Mode()),
                /* circular ref: __ref_20 */ .mode(Mode()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\S+")
                    return mode
                }(),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register yaml language
public extension HighlightJS {
    func registerYaml() {
        registerLanguage("yaml", definition: yamlLanguage)
    }
}
