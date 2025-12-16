// Auto-generated from highlight.js
// Language: protobuf

import Foundation

/// protobuf language definition
public func protobufLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Protocol Buffers"

    lang.aliases = ["proto"]
    lang.keywords = .grouped([
        "keyword": ["package", "import", "option", "optional", "required", "repeated", "group", "oneof"] as Any,
        "type": ["double", "float", "int32", "int64", "uint32", "uint64", "sint32", "sint64", "fixed32", "fixed64", "sfixed32", "sfixed64", "bool", "string", "bytes"] as Any,
        "literal": ["true", "false"] as Any,
    ])
    lang.contains = [
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.NUMBER_MODE()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("(message|enum|service)\\s+"), .regex("[a-zA-Z]\\w*")])
            mode.scope = .multi([1: "keyword", 2: "title.class"])
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[{;]")
            mode.scope = .single("function")
            mode.keywords = .simple("rpc returns")

            mode.beginKeywords = "rpc"
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*[A-Z_]+(?=\\s*=[^\\n]+;$)")
            return mode
        }()),
    ]

    return lang
}

/// Register protobuf language
public extension HighlightJS {
    func registerProtobuf() {
        registerLanguage("protobuf", definition: protobufLanguage)
    }
}
