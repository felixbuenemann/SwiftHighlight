// Auto-generated from highlight.js
// Language: brainfuck

import Foundation

/// brainfuck language definition
public func brainfuckLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Brainfuck"

    lang.aliases = ["bf"]
    lang.contains = [
        .mode(CommonModes.COMMENT("[^\\[\\]\\.,\\+\\-<> \\r\\n]", "[\\[\\]\\.,\\+\\-<> \\r\\n]")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[\\[\\]]")
            mode.scope = .single("title")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[\\.,]")
            mode.scope = .single("string")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(?=\\+\\+|--)")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[+-]+")
                    mode.scope = .single("literal")
                    mode.relevance = 0
                    return mode
                }()),
            ]
            return mode
        }()),
        /* circular ref: __ref_0 */ .mode(Mode()),
    ]

    return lang
}

/// Register brainfuck language
public extension HighlightJS {
    func registerBrainfuck() {
        registerLanguage("brainfuck", definition: brainfuckLanguage)
    }
}
