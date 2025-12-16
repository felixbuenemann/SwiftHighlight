// Auto-generated from highlight.js
// Language: dsconfig

import Foundation

/// dsconfig language definition
public func dsconfigLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "dsconfig"

    lang.keywords = .simple("dsconfig")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^dsconfig")
            mode.end = .regex("\\s")
            mode.scope = .single("keyword")
            mode.relevance = 10
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(list|create|get|set|delete)-(\\w+)")
            mode.end = .regex("\\s")
            mode.scope = .single("built_in")
            mode.illegal = .regex("!@#$%^&*()")
            mode.relevance = 10
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("--(\\w+)")
            mode.end = .regex("\\s")
            mode.scope = .single("built_in")
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[\\w\\-?]+:\\w+")
            mode.end = .regex("\\W")
            mode.scope = .single("string")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\w+(\\-\\w+)*")
            mode.end = .regex("(?=\\W)")
            mode.scope = .single("string")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.HASH_COMMENT_MODE()),
    ]

    return lang
}

/// Register dsconfig language
public extension HighlightJS {
    func registerDsconfig() {
        registerLanguage("dsconfig", definition: dsconfigLanguage)
    }
}
