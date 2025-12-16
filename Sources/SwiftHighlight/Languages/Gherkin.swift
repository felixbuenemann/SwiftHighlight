// Auto-generated from highlight.js
// Language: gherkin

import Foundation

/// gherkin language definition
public func gherkinLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Gherkin"

    lang.aliases = ["feature"]
    lang.keywords = .simple("Feature Background Ability Business Need Scenario Scenarios Scenario Outline Scenario Template Examples Given And Then But When")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\*")
            mode.scope = .single("symbol")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@[^@\\s]+")
            mode.scope = .single("meta")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\|")
            mode.end = .regex("\\|\\w*$")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[^|]+")
                    mode.scope = .single("string")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("<")
            mode.end = .regex(">")
            mode.scope = .single("variable")
            return mode
        }()),
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"\"\"")
            mode.end = .regex("\"\"\"")
            mode.scope = .single("string")
            return mode
        }()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
    ]

    return lang
}

/// Register gherkin language
public extension HighlightJS {
    func registerGherkin() {
        registerLanguage("gherkin", definition: gherkinLanguage)
    }
}
