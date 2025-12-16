// Auto-generated from highlight.js
// Language: golo

import Foundation

/// golo language definition
public func goloLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Golo"

    lang.keywords = .grouped([
        "keyword": ["println", "readln", "print", "import", "module", "function", "local", "return", "let", "var", "while", "for", "foreach", "times", "in", "case", "when", "match", "with", "break", "continue", "augment", "augmentation", "each", "find", "filter", "reduce", "if", "then", "else", "otherwise", "try", "catch", "finally", "raise", "throw", "orIfNull", "DynamicObject|10", "DynamicVariable", "struct", "Observable", "map", "set", "vector", "list", "array"] as Any,
        "literal": ["true", "false", "null"] as Any,
    ])
    lang.contains = [
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@[A-Za-z]+")
            mode.scope = .single("meta")
            return mode
        }()),
    ]

    return lang
}

/// Register golo language
public extension HighlightJS {
    func registerGolo() {
        registerLanguage("golo", definition: goloLanguage)
    }
}
