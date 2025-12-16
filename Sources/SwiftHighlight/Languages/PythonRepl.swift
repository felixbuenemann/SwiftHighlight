// Auto-generated from highlight.js
// Language: python-repl

import Foundation

/// python-repl language definition
public func python_replLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "python-repl"

    lang.aliases = ["pycon"]
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.scope = .single("meta.prompt")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("^>>>(?=[ ]|$)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("^\\.\\.\\.(?=[ ]|$)")
                    return mode
                }(),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex(" |$")
                    return mode
                }()
            }()
            return mode
        }()),
    ]

    return lang
}

/// Register python-repl language
public extension HighlightJS {
    func registerPythonRepl() {
        registerLanguage("python-repl", definition: python_replLanguage)
    }
}
