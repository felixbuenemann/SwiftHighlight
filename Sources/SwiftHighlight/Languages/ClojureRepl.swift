// Auto-generated from highlight.js
// Language: clojure-repl

import Foundation

/// clojure-repl language definition
public func clojure_replLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Clojure REPL"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^([\\w.-]+|\\s*#_)?=>")
            mode.scope = .single("meta.prompt")
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("$")
                    return mode
                }()
            }()
            return mode
        }()),
    ]

    return lang
}

/// Register clojure-repl language
public extension HighlightJS {
    func registerClojureRepl() {
        registerLanguage("clojure-repl", definition: clojure_replLanguage)
    }
}
