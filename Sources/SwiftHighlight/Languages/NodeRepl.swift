// Auto-generated from highlight.js
// Language: node-repl

import Foundation

/// node-repl language definition
public func node_replLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Node REPL"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.scope = .single("meta.prompt")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("^>(?=[ ]|$)")
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

/// Register node-repl language
public extension HighlightJS {
    func registerNodeRepl() {
        registerLanguage("node-repl", definition: node_replLanguage)
    }
}
