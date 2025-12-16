// Auto-generated from highlight.js
// Language: leaf

import Foundation

/// leaf language definition
public func leafLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Leaf"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("#+"), .regex("([A-Za-z_][A-Za-z_0-9]*)?"), .regex("(?=\\()")])
            mode.scope = .multi([1: "punctuation", 2: "keyword"])
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)(?=\\:?)")
                    mode.scope = .single("params")
                    mode.relevance = 7
                    mode.endsParent = true
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .array([.regex("([A-Za-z_][A-Za-z_0-9]*)?"), .regex("(?=\\()")])
                            mode.scope = .multi([1: "keyword"])
                            mode.contains = [
                                /* circular ref: __ref_0 */ .mode(Mode()),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\"")
                            mode.end = .regex("\"")
                            mode.scope = .single("string")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("true|false|in")
                            mode.scope = .single("keyword")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[A-Za-z_][A-Za-z_0-9]*")
                            mode.scope = .single("variable")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\+|\\-|\\*|\\/|\\%|\\=\\=|\\=|\\!|\\>|\\<|\\&\\&|\\|\\|")
                            mode.scope = .single("operator")
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\:")
                            mode.scope = .single("punctuation")
                            return mode
                        }()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("#+"), .regex("([A-Za-z_][A-Za-z_0-9]*)?"), .regex(":?")])
            mode.scope = .multi([1: "punctuation", 2: "keyword", 3: "punctuation"])
            return mode
        }()),
    ]

    return lang
}

/// Register leaf language
public extension HighlightJS {
    func registerLeaf() {
        registerLanguage("leaf", definition: leafLanguage)
    }
}
