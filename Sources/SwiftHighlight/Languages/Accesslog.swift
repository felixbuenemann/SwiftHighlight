// Auto-generated from highlight.js
// Language: accesslog

import Foundation

/// accesslog language definition
public func accesslogLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Apache Access Log"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}(:\\d{1,5})?\\b")
            mode.scope = .single("number")
            mode.relevance = 5
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b\\d+\\b")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/\"/(?:GET|POST|HEAD|PUT|DELETE|CONNECT|OPTIONS|PATCH|TRACE)")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.keywords = .array(["GET", "POST", "HEAD", "PUT", "DELETE", "CONNECT", "OPTIONS", "PATCH", "TRACE"])

            mode.illegal = .regex("\\n")
            mode.relevance = 5
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("HTTP\\/[12]\\.\\d'")
                    mode.relevance = 5
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[\\d[^\\]\\n]{8,}\\]")
            mode.scope = .single("string")
            mode.illegal = .regex("\\n")
            mode.relevance = 1
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[")
            mode.end = .regex("\\]")
            mode.scope = .single("string")
            mode.illegal = .regex("\\n")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"Mozilla\\/\\d\\.\\d \\(")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.illegal = .regex("\\n")
            mode.relevance = 3
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.illegal = .regex("\\n")
            mode.relevance = 0
            return mode
        }()),
    ]

    return lang
}

/// Register accesslog language
public extension HighlightJS {
    func registerAccesslog() {
        registerLanguage("accesslog", definition: accesslogLanguage)
    }
}
