// Auto-generated from highlight.js
// Language: dust

import Foundation

/// dust language definition
public func dustLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Dust"

    lang.aliases = ["dst"]
    lang.caseInsensitive = true
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{[#\\/]")
            mode.end = .regex("\\}")
            mode.scope = .single("template-tag")
            mode.illegal = .regex(";")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-zA-Z\\.-]+")
                    mode.scope = .single("name")
                    mode.starts = {
                        {
                            let mode = Mode()
                            mode.relevance = 0
                            mode.contains = [
                                .mode(CommonModes.QUOTE_STRING_MODE()),
                            ]
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
            mode.begin = .regex("\\{")
            mode.end = .regex("\\}")
            mode.scope = .single("template-variable")
            mode.keywords = .simple("if eq ne lt lte gt gte select default math sep")

            mode.illegal = .regex(";")
            return mode
        }()),
    ]

    return lang
}

/// Register dust language
public extension HighlightJS {
    func registerDust() {
        registerLanguage("dust", definition: dustLanguage)
    }
}
