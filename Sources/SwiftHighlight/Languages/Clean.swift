// Auto-generated from highlight.js
// Language: clean

import Foundation

/// clean language definition
public func cleanLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Clean"

    lang.aliases = ["icl", "dcl"]
    lang.keywords = .grouped([
        "keyword": ["if", "let", "in", "with", "where", "case", "of", "class", "instance", "otherwise", "implementation", "definition", "system", "module", "from", "import", "qualified", "as", "special", "code", "inline", "foreign", "export", "ccall", "stdcall", "generic", "derive", "infix", "infixl", "infixr"] as Any,
        "built_in": "Int Real Char Bool" as Any,
        "literal": "True False" as Any,
    ])
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("->|<-[|:]?|#!?|>>=|\\{\\||\\|\\}|:==|=:|<>")
            return mode
        }()),
    ]

    return lang
}

/// Register clean language
public extension HighlightJS {
    func registerClean() {
        registerLanguage("clean", definition: cleanLanguage)
    }
}
