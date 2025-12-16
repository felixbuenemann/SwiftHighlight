// Auto-generated from highlight.js
// Language: asciidoc

import Foundation

/// asciidoc language definition
public func asciidocLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "AsciiDoc"

    lang.aliases = ["adoc"]
    lang.contains = [
        .mode(CommonModes.COMMENT("^/{4,}\\n", "\\n/{4,}$")),
        .mode(CommonModes.COMMENT("^//", "$")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\.\\w.*$")
            mode.scope = .single("title")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[=\\*]{4,}\\n")
            mode.end = .regex("\\n^[=\\*]{4,}$")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("section")
            mode.relevance = 10
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("^(={1,6})[ \t].+?([ \t]\\1)?$")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("^[^\\[\\]\\n]+?\\n[=\\-~\\^\\+]{2,}$")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^:.+?:")
            mode.end = .regex("\\s")
            mode.scope = .single("meta")
            mode.relevance = 10
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\[.+?\\]$")
            mode.scope = .single("meta")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^_{4,}\\n")
            mode.end = .regex("\\n_{4,}$")
            mode.scope = .single("quote")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[\\-\\.]{4,}\\n")
            mode.end = .regex("\\n[\\-\\.]{4,}$")
            mode.scope = .single("code")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\+{4,}\\n")
            mode.end = .regex("\\n\\+{4,}$")
            mode.relevance = 10
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("<")
                    mode.end = .regex(">")
                    mode.relevance = 0
                    mode.subLanguage = .single("xml")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^(\\*+|-+|\\.+|[^\\n]+?::)\\s+")
            mode.scope = .single("bullet")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^(NOTE|TIP|IMPORTANT|WARNING|CAUTION):\\s+")
            mode.scope = .single("symbol")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\[*_`]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\\\\\\\*{2}[^\\n]*?\\*{2}")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\\\\\_{2}[^\\n]*_{2}")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\\\\\`{2}[^\\n]*`{2}")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[:;}][*_`](?![*_`])")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\*{2}([^\\n]+?)\\*{2}")
            mode.scope = .single("strong")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/\\*\\*//((\\*(?!\\*)|\\\\[^\\n]|[^*\\n\\\\])+\\n)+//(\\*(?!\\*)|\\\\[^\\n]|[^*\\n\\\\])*//\\*\\*/")
            mode.scope = .single("strong")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\B\\*(\\S|\\S[^\\n]*?\\S)\\*(?!\\w)")
            mode.scope = .single("strong")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\*[^\\s]([^\\n]+\\n)+([^\\n]+)\\*")
            mode.scope = .single("strong")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("_{2}([^\\n]+?)_{2}")
            mode.scope = .single("emphasis")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/__//((_(?!_)|\\\\[^\\n]|[^_\\n\\\\])+\\n)+//(_(?!_)|\\\\[^\\n]|[^_\\n\\\\])*//__/")
            mode.scope = .single("emphasis")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b_(\\S|\\S[^\\n]*?\\S)_(?!\\w)")
            mode.scope = .single("emphasis")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("_[^\\s]([^\\n]+\\n)+([^\\n]+)_")
            mode.scope = .single("emphasis")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\B'(?!['\\s])")
            mode.end = .regex("(\\n{2}|')")
            mode.scope = .single("emphasis")
            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\\\'\\w")
                    mode.relevance = 0
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("``.+?''")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("`.+?'")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("`{2}")
            mode.end = .regex("(\\n{2}|`{2})")
            mode.scope = .single("code")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(`.+?`|\\+.+?\\+)")
            mode.scope = .single("code")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[ \\t]")
            mode.end = .regex("$")
            mode.scope = .single("code")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^'{3,}[ \\t]*$")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(link:)?(http|https|ftp|file|irc|image:?):\\S+?\\[[^[]*?\\]")
            mode.relevance = 10
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("(link|image:?):")
                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\w")
                    mode.end = .regex("[^\\[]+")
                    mode.scope = .single("link")
                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\[")
                    mode.end = .regex("\\]")
                    mode.scope = .single("string")
                    mode.relevance = 0
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    return mode
                }()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register asciidoc language
public extension HighlightJS {
    func registerAsciidoc() {
        registerLanguage("asciidoc", definition: asciidocLanguage)
    }
}
