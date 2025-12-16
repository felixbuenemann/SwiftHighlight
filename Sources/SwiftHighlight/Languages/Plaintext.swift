// Auto-generated from highlight.js
// Language: plaintext

import Foundation

/// plaintext language definition
public func plaintextLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Plain text"

    lang.aliases = ["text", "txt"]

    return lang
}

/// Register plaintext language
public extension HighlightJS {
    func registerPlaintext() {
        registerLanguage("plaintext", definition: plaintextLanguage)
    }
}
