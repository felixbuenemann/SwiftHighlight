// Auto-generated from highlight.js
// Language: parser3

import Foundation

/// parser3 language definition
public func parser3Language(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Parser3"

    lang.contains = [
        .mode(CommonModes.COMMENT("^#", "$")),
        .mode(CommonModes.COMMENT("\\^rem\\{", "\\}")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^@(?:BASE|USE|CLASS|OPTIONS)$")
            mode.scope = .single("meta")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@[\\w\\-]+\\[[\\w^;\\-]*\\](?:\\[[\\w^;\\-]*\\])?(?:.*)$")
            mode.scope = .single("title")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$\\{?[\\w\\-.:]+\\}?")
            mode.scope = .single("variable")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\^[\\w\\-.:]+")
            mode.scope = .single("keyword")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\^#[0-9a-fA-F]+")
            mode.scope = .single("number")
            return mode
        }()),
        .mode(CommonModes.C_NUMBER_MODE()),
    ]

    return lang
}

/// Register parser3 language
public extension HighlightJS {
    func registerParser3() {
        registerLanguage("parser3", definition: parser3Language)
    }
}
