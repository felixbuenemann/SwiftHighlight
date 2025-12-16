// Auto-generated from highlight.js
// Language: profile

import Foundation

/// profile language definition
public func profileLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Python profiler"

    lang.contains = [
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z_][\\da-zA-Z_]+\\.[\\da-zA-Z_]{1,3}")
            mode.end = .regex(":")
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(ncalls|tottime|cumtime)")
            mode.end = .regex("$")
            mode.keywords = .simple("ncalls tottime|10 cumtime|10 filename")

            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("function calls")
            mode.end = .regex("$")
            mode.relevance = 10
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\(")
            mode.end = .regex("\\)$")
            mode.scope = .single("string")
            mode.relevance = 0
            mode.excludeBegin = true
            mode.excludeEnd = true
            return mode
        }()),
    ]

    return lang
}

/// Register profile language
public extension HighlightJS {
    func registerProfile() {
        registerLanguage("profile", definition: profileLanguage)
    }
}
