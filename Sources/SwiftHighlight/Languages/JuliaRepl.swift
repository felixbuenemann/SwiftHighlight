// Auto-generated from highlight.js
// Language: julia-repl

import Foundation

/// julia-repl language definition
public func julia_replLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Julia REPL"

    lang.aliases = ["jldoctest"]
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^julia>")
            mode.scope = .single("meta.prompt")
            mode.relevance = 10
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("^(?![ ]{6})")
                    return mode
                }()
            }()
            return mode
        }()),
    ]

    return lang
}

/// Register julia-repl language
public extension HighlightJS {
    func registerJuliaRepl() {
        registerLanguage("julia-repl", definition: julia_replLanguage)
    }
}
