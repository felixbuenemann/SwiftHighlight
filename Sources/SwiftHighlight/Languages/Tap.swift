// Auto-generated from highlight.js
// Language: tap

import Foundation

/// tap language definition
public func tapLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Test Anything Protocol"

    lang.caseInsensitive = true
    lang.contains = [
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("meta")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("^TAP version (\\d+)$")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("^1\\.\\.(\\d+)$")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("---$")
            mode.end = .regex("\\.\\.\\.$")
            mode.relevance = 0
            mode.subLanguage = .single("yaml")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(" (\\d+) ")
            mode.scope = .single("number")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("symbol")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("^ok")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("^not ok")
                    return mode
                }(),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register tap language
public extension HighlightJS {
    func registerTap() {
        registerLanguage("tap", definition: tapLanguage)
    }
}
