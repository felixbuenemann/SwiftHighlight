// Auto-generated from highlight.js
// Language: graphql

import Foundation

/// graphql language definition
public func graphqlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "GraphQL"

    lang.aliases = ["gql"]
    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": ["query", "mutation", "subscription", "type", "input", "schema", "directive", "interface", "union", "scalar", "fragment", "enum", "on"] as Any,
        "literal": ["true", "false", "null"] as Any,
    ])
    lang.illegal = .array([.regex("[;<']"), .regex("BEGIN")])
    lang.contains = [
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[.]{3}")
            mode.scope = .single("punctuation")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[\\!\\(\\)\\:\\=\\[\\]\\{\\|\\}]{1}")
            mode.scope = .single("punctuation")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$")
            mode.end = .regex("\\W")
            mode.scope = .single("variable")
            mode.relevance = 0
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@\\w+")
            mode.scope = .single("meta")
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/[_A-Za-z][_0-9A-Za-z]*/(?=\\s*:)")
            mode.scope = .single("symbol")
            mode.relevance = 0
            return mode
        }()),
    ]

    return lang
}

/// Register graphql language
public extension HighlightJS {
    func registerGraphql() {
        registerLanguage("graphql", definition: graphqlLanguage)
    }
}
