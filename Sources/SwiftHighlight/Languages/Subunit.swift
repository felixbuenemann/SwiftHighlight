// Auto-generated from highlight.js
// Language: subunit

import Foundation

/// subunit language definition
public func subunitLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "SubUnit"

    lang.caseInsensitive = true
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[\n(multipart)?")
            mode.end = .regex("\\]\n")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\d{4}-\\d{2}-\\d{2}(\\s+)\\d{2}:\\d{2}:\\d{2}.\\d+Z")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(\\+|-)\\d+")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("keyword")
            mode.relevance = 10
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("^(test|testing|success|successful|failure|error|skip|xfail|uxsuccess)(:?)\\s+(test)?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("^progress(:?)(\\s+)?(pop|push)?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("^tags:")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("^time:")
                    return mode
                }(),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register subunit language
public extension HighlightJS {
    func registerSubunit() {
        registerLanguage("subunit", definition: subunitLanguage)
    }
}
