// Auto-generated from highlight.js
// Language: xml

import Foundation

/// xml language definition
public func xmlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "HTML, XML"

    lang.aliases = ["html", "xhtml", "rss", "atom", "xjb", "xsd", "xsl", "plist", "wsf", "svg"]
    lang.caseInsensitive = true
    lang.unicodeRegex = true
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("<![a-z]")
            mode.end = .regex(">")
            mode.scope = .single("meta")
            mode.relevance = 10
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\s")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("#?[a-z_][a-z1-9_-]+")
                            mode.scope = .single("keyword")
                            mode.illegal = .regex("\\n")
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                .mode(CommonModes.QUOTE_STRING_MODE()),
                .mode(CommonModes.APOS_STRING_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\[")
                    mode.end = .regex("\\]")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("<![a-z]")
                            mode.end = .regex(">")
                            mode.scope = .single("meta")
                            mode.contains = [
                                /* circular ref: __ref_1 */ .mode(Mode()),
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                /* circular ref: __ref_3 */ .mode(Mode()),
                                /* circular ref: __ref_4 */ .mode(Mode()),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode(CommonModes.COMMENT("<!--", "-->")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("<!\\[CDATA\\[")
            mode.end = .regex("\\]\\]>")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("&[a-z]+;|&#[0-9]+;|&#x[a-f0-9]+;")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\?>")
            mode.scope = .single("meta")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("<\\?xml")
                    mode.relevance = 10
                    mode.contains = [
                        /* circular ref: __ref_3 */ .mode(Mode()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("<\\?[a-z][a-z0-9]+")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("<style(?=\\s|>)")
            mode.end = .regex(">")
            mode.scope = .single("tag")
            mode.keywords = .grouped([
                "name": "style" as Any,
            ])

            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.illegal = .regex("<")
                    mode.relevance = 0
                    mode.endsWithParent = true
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regexWithFlags(pattern: "[\\p{L}0-9._:-]+", flags: "u")
                            mode.scope = .single("attr")
                            mode.relevance = 0
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("=\\s*")
                            mode.relevance = 0
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.scope = .single("string")
                                    mode.endsParent = true
                                    mode.variants = [
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\"")
                                            mode.end = .regex("\"")
                                            mode.contains = [
                                                /* circular ref: __ref_5 */ .mode(Mode()),
                                            ]
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("'")
                                            mode.end = .regex("'")
                                            mode.contains = [
                                                /* circular ref: __ref_5 */ .mode(Mode()),
                                            ]
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("[^\\s\"'=<>`]+")
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
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("<\\/style>")
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("<script(?=\\s|>)")
            mode.end = .regex(">")
            mode.scope = .single("tag")
            mode.keywords = .grouped([
                "name": "script" as Any,
            ])

            mode.contains = [
                /* circular ref: __ref_6 */ .mode(Mode()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("<\\/script>")
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("<>|<\\/>")
            mode.scope = .single("tag")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/</(?=/[\\p{L}_]/u(?:[\\p{L}0-9_.-]*:)?/[\\p{L}0-9_.-]*/u(?:/\\/>/|/>/|/\\s/))")
            mode.end = .regex("\\/?>")
            mode.scope = .single("tag")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("/[\\p{L}_]/u(?:[\\p{L}0-9_.-]*:)?/[\\p{L}0-9_.-]*/u")
                    mode.scope = .single("name")
                    mode.relevance = 0
                    mode.starts = {
                        {
                            let mode = Mode()
                            return mode
                        }()
                    }()
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/<\\//(?=/[\\p{L}_]/u(?:[\\p{L}0-9_.-]*:)?/[\\p{L}0-9_.-]*/u/>/)")
            mode.scope = .single("tag")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("/[\\p{L}_]/u(?:[\\p{L}0-9_.-]*:)?/[\\p{L}0-9_.-]*/u")
                    mode.scope = .single("name")
                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex(">")
                    mode.relevance = 0
                    mode.endsParent = true
                    return mode
                }()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register xml language
public extension HighlightJS {
    func registerXml() {
        registerLanguage("xml", definition: xmlLanguage)
    }
}
