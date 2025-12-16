// Auto-generated from highlight.js
// Language: taggerscript

import Foundation

/// taggerscript language definition
public func taggerscriptLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Tagger Script"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$noop\\(")
            mode.end = .regex("\\)")
            mode.scope = .single("comment")
            mode.relevance = 10
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\\\[()]")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\\\[()]")
                            return mode
                        }()),
                        .selfReference,
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$[_a-zA-Z0-9]+(?=\\()")
            mode.scope = .single("keyword")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("%[_a-zA-Z0-9:]+%")
            mode.scope = .single("variable")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\[\\\\nt$%,()]")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\u[a-fA-F0-9]{4}")
            mode.scope = .single("symbol")
            return mode
        }()),
    ]

    return lang
}

/// Register taggerscript language
public extension HighlightJS {
    func registerTaggerscript() {
        registerLanguage("taggerscript", definition: taggerscriptLanguage)
    }
}
