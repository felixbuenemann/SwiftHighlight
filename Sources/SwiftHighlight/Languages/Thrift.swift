// Auto-generated from highlight.js
// Language: thrift

import Foundation

/// thrift language definition
public func thriftLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Thrift"

    lang.keywords = .grouped([
        "keyword": ["namespace", "const", "typedef", "struct", "enum", "service", "exception", "void", "oneway", "set", "list", "map", "required", "optional"] as Any,
        "type": ["bool", "byte", "i16", "i32", "i64", "double", "string", "binary"] as Any,
        "literal": "true false" as Any,
    ])
    lang.contains = [
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.NUMBER_MODE()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\{")
            mode.scope = .single("class")
            mode.beginKeywords = "struct enum service exception"
            mode.illegal = .regex("\\n")
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(set|list|map)\\s*<")
            mode.end = .regex(">")
            mode.keywords = .grouped([
                "type": ["bool", "byte", "i16", "i32", "i64", "double", "string", "binary", "set", "list", "map"] as Any,
            ])

            mode.contains = [
                .selfReference,
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register thrift language
public extension HighlightJS {
    func registerThrift() {
        registerLanguage("thrift", definition: thriftLanguage)
    }
}
