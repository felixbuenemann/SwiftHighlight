// Auto-generated from highlight.js
// Language: ldif

import Foundation

/// ldif language definition
public func ldifLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "LDIF"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^dn(?=:)")
            mode.scope = .single("attribute")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\w+(?=:)")
            mode.scope = .single("attribute")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^-")
            mode.scope = .single("literal")
            return mode
        }()),
        .mode(CommonModes.HASH_COMMENT_MODE()),
    ]

    return lang
}

/// Register ldif language
public extension HighlightJS {
    func registerLdif() {
        registerLanguage("ldif", definition: ldifLanguage)
    }
}
