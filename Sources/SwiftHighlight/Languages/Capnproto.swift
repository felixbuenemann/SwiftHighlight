// Auto-generated from highlight.js
// Language: capnproto

import Foundation

/// capnproto language definition
public func capnprotoLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Cap’n Proto"

    lang.aliases = ["capnp"]
    lang.keywords = .grouped([
        "keyword": ["struct", "enum", "interface", "union", "group", "import", "using", "const", "annotation", "extends", "in", "of", "on", "as", "with", "from", "fixed"] as Any,
        "type": ["Void", "Bool", "Int8", "Int16", "Int32", "Int64", "UInt8", "UInt16", "UInt32", "UInt64", "Float32", "Float64", "Text", "Data", "AnyPointer", "AnyStruct", "Capability", "List"] as Any,
        "literal": ["true", "false"] as Any,
    ])
    lang.contains = [
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.NUMBER_MODE()),
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@0x[\\w\\d]{16};")
            mode.scope = .single("meta")
            mode.illegal = .regex("\\n")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@\\d+\\b")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .multi([1: "keyword", 3: "title.class"])
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("(struct|enum|interface)"), .regex("\\s+"), .regex("[a-zA-Z]\\w*")])
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("extends"), .regex("\\s*\\("), .regex("[a-zA-Z]\\w*"), .regex("\\s*\\)")])
                    return mode
                }(),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register capnproto language
public extension HighlightJS {
    func registerCapnproto() {
        registerLanguage("capnproto", definition: capnprotoLanguage)
    }
}
