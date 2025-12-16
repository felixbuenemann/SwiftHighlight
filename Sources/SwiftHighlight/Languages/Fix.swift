// Auto-generated from highlight.js
// Language: fix

import Foundation

/// fix language definition
public func fixLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "FIX"

    lang.caseInsensitive = true
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("[^\\u2401\\u0001]+")
            mode.end = .regex("[\\u2401\\u0001]")
            mode.excludeEnd = true
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("([^\\u2401\\u0001=]+)")
                    mode.end = .regex("=([^\\u2401\\u0001=]+)")
                    mode.scope = .single("attr")
                    mode.returnEnd = true
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("=")
                    mode.end = .regex("([\\u2401\\u0001])")
                    mode.scope = .single("string")
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    return mode
                }()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register fix language
public extension HighlightJS {
    func registerFix() {
        registerLanguage("fix", definition: fixLanguage)
    }
}
