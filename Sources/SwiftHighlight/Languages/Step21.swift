// Auto-generated from highlight.js
// Language: step21

import Foundation

/// step21 language definition
public func step21Language(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "STEP Part 21"

    lang.aliases = ["p21", "step", "stp"]
    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": ["HEADER", "ENDSEC", "DATA"] as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("ISO-10303-21;")
            mode.scope = .single("meta")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("END-ISO-10303-21;")
            mode.scope = .single("meta")
            mode.relevance = 10
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.COMMENT("/\\*\\*!", "\\*/")),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("symbol")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("#")
                    mode.end = .regex("\\d+")
                    return mode
                }(),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register step21 language
public extension HighlightJS {
    func registerStep21() {
        registerLanguage("step21", definition: step21Language)
    }
}
