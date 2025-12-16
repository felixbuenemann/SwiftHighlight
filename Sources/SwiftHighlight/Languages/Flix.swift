// Auto-generated from highlight.js
// Language: flix

import Foundation

/// flix language definition
public func flixLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Flix"

    lang.keywords = .grouped([
        "keyword": ["case", "class", "def", "else", "enum", "if", "impl", "import", "in", "lat", "rel", "index", "let", "match", "namespace", "switch", "type", "yield", "with"] as Any,
        "literal": ["true", "false"] as Any,
    ])
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'(.|\\\\[xXuU][a-zA-Z0-9]+)'")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[:={\\[(\\n;]")
            mode.scope = .single("function")
            mode.beginKeywords = "def"
            mode.excludeEnd = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[^0-9\\n\\t \"'(),.`{}\\[\\]:;][^\\n\\t \"'(),.`{}\\[\\]:;]+|[^0-9\\n\\t \"'(),.`{}\\[\\]:;=]")
                    mode.scope = .single("title")
                    mode.relevance = 0
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode(CommonModes.C_NUMBER_MODE()),
    ]

    return lang
}

/// Register flix language
public extension HighlightJS {
    func registerFlix() {
        registerLanguage("flix", definition: flixLanguage)
    }
}
