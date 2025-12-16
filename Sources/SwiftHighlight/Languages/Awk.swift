// Auto-generated from highlight.js
// Language: awk

import Foundation

/// awk language definition
public func awkLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Awk"

    lang.keywords = .grouped([
        "keyword": "BEGIN END if else while do for in break continue delete next nextfile function func exit|10" as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.scope = .single("variable")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\$[\\w\\d#@][\\w\\d_]*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\$\\{(.*?)\\}")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("(u|b)?r?'''")
                    mode.end = .regex("'''")
                    mode.relevance = 10
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(u|b)?r?\"\"\"")
                    mode.end = .regex("\"\"\"")
                    mode.relevance = 10
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(u|r|ur)'")
                    mode.end = .regex("'")
                    mode.relevance = 10
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(u|r|ur)\"")
                    mode.end = .regex("\"")
                    mode.relevance = 10
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(b|br)'")
                    mode.end = .regex("'")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(b|br)\"")
                    mode.end = .regex("\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode(CommonModes.REGEXP_MODE()),
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode(CommonModes.NUMBER_MODE()),
    ]

    return lang
}

/// Register awk language
public extension HighlightJS {
    func registerAwk() {
        registerLanguage("awk", definition: awkLanguage)
    }
}
