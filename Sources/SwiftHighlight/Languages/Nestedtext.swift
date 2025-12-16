// Auto-generated from highlight.js
// Language: nestedtext

import Foundation

/// nestedtext language definition
public func nestedtextLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Nested Text"

    lang.aliases = ["nt"]
    lang.contains = [
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("[object Object]")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("^\\s*"), .regex("-"), .regex("[ ]"), .regex(".*$")])
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("^\\s*"), .regex("-$")])
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("^\\s*"), .regex(">"), .regex("[ ]"), .regex(".*$")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("^\\s*(?=\\S)"), .regex("[^:]+"), .regex(":\\s*"), .regex("$")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("^\\s*(?=\\S)"), .regex("[^:]*[^: ]"), .regex("[ ]*:"), .regex("[ ]"), .regex(".*$")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
    ]

    return lang
}

/// Register nestedtext language
public extension HighlightJS {
    func registerNestedtext() {
        registerLanguage("nestedtext", definition: nestedtextLanguage)
    }
}
