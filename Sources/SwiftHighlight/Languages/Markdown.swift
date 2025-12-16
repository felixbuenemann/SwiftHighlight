// Auto-generated from highlight.js
// Language: markdown

import Foundation

/// markdown language definition
public func markdownLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Markdown"

    lang.aliases = ["md", "mkdown", "mkd"]
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.scope = .single("section")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("^#{1,6}")
                    mode.end = .regex("$")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("<\\/?[A-Za-z_]")
                            mode.end = .regex(">")
                            mode.relevance = 0
                            mode.subLanguage = .single("xml")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.returnBegin = true
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\[(?=\\])")
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\[")
                                    mode.end = .regex("\\]")
                                    mode.scope = .single("string")
                                    mode.relevance = 0
                                    mode.excludeBegin = true
                                    mode.returnEnd = true
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\]\\(")
                                    mode.end = .regex("\\)")
                                    mode.scope = .single("link")
                                    mode.relevance = 0
                                    mode.excludeBegin = true
                                    mode.excludeEnd = true
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\]\\[")
                                    mode.end = .regex("\\]")
                                    mode.scope = .single("symbol")
                                    mode.relevance = 0
                                    mode.excludeBegin = true
                                    mode.excludeEnd = true
                                    return mode
                                }()),
                            ]
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\[.+?\\]\\[.*?\\]")
                                    mode.relevance = 0
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\[.+?\\]\\(((data|javascript|mailto):|(?:http|ftp)s?:\\/\\/).*?\\)")
                                    mode.relevance = 2
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("/\\[.+?\\]\\(//[A-Za-z][A-Za-z0-9+.-]*//:\\/\\/.*?\\)/")
                                    mode.relevance = 2
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\[.+?\\]\\([./?&#].*?\\)")
                                    mode.relevance = 1
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\[.*?\\]\\(.*?\\)")
                                    mode.relevance = 0
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("strong")
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.scope = .single("emphasis")
                                    mode.contains = [
                                        /* circular ref: __ref_0 */ .mode(Mode()),
                                        /* circular ref: __ref_1 */ .mode(Mode()),
                                    ]
                                    mode.variants = [
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\*(?![*\\s])")
                                            mode.end = .regex("\\*")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("_(?![_\\s])")
                                            mode.end = .regex("_")
                                            mode.relevance = 0
                                            return mode
                                        }(),
                                    ]
                                    return mode
                                }()),
                                /* circular ref: __ref_0 */ .mode(Mode()),
                                /* circular ref: __ref_1 */ .mode(Mode()),
                            ]
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("_{2}(?!\\s)")
                                    mode.end = .regex("_{2}")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\*{2}(?!\\s)")
                                    mode.end = .regex("\\*{2}")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("emphasis")
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.scope = .single("strong")
                                    mode.contains = [
                                        /* circular ref: __ref_0 */ .mode(Mode()),
                                        /* circular ref: __ref_1 */ .mode(Mode()),
                                    ]
                                    mode.variants = [
                                        {
                                            let mode = Mode()
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            return mode
                                        }(),
                                    ]
                                    return mode
                                }()),
                                /* circular ref: __ref_0 */ .mode(Mode()),
                                /* circular ref: __ref_1 */ .mode(Mode()),
                            ]
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(?=^.+?\\n[=-]{2,}$)")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("^[=-]*$")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("^")
                            mode.end = .regex("\\n")
                            mode.contains = [
                                /* circular ref: __ref_0 */ .mode(Mode()),
                                /* circular ref: __ref_1 */ .mode(Mode()),
                                /* circular ref: __ref_6 */ .mode(Mode()),
                                /* circular ref: __ref_7 */ .mode(Mode()),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        /* circular ref: __ref_0 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[ \t]*([*+-]|(\\d+\\.))(?=\\s+)")
            mode.end = .regex("\\s+")
            mode.scope = .single("bullet")
            mode.excludeEnd = true
            return mode
        }()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^>\\s+")
            mode.end = .regex("$")
            mode.scope = .single("quote")
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_6 */ .mode(Mode()),
                /* circular ref: __ref_7 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("code")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("(`{3,})[^`](.|\\n)*?\\1`*[ ]*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(~{3,})[^~](.|\\n)*?\\1~*[ ]*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("```")
                    mode.end = .regex("```+[ ]*$")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("~~~")
                    mode.end = .regex("~~~+[ ]*$")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("`.+?`")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(?=^( {4}|\\t))")
                    mode.relevance = 0
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("^( {4}|\\t)")
                            mode.end = .regex("(\\n)$")
                            return mode
                        }()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[-\\*]{3,}")
            mode.end = .regex("$")
            return mode
        }()),
        /* circular ref: __ref_1 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\[[^\\n]+\\]:")
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\[")
                    mode.end = .regex("\\]")
                    mode.scope = .single("symbol")
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex(":\\s*")
                    mode.end = .regex("$")
                    mode.scope = .single("link")
                    mode.excludeBegin = true
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("&([a-zA-Z0-9]+|#[0-9]{1,7}|#[Xx][0-9a-fA-F]{1,6});")
            mode.scope = .single("literal")
            return mode
        }()),
    ]

    return lang
}

/// Register markdown language
public extension HighlightJS {
    func registerMarkdown() {
        registerLanguage("markdown", definition: markdownLanguage)
    }
}
