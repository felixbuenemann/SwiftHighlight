// Auto-generated from highlight.js
// Language: ceylon

import Foundation

/// ceylon language definition
public func ceylonLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Ceylon"

    lang.keywords = .grouped([
        "keyword": ["assembly", "module", "package", "import", "alias", "class", "interface", "object", "given", "value", "assign", "void", "function", "new", "of", "extends", "satisfies", "abstracts", "in", "out", "return", "break", "continue", "throw", "assert", "dynamic", "if", "else", "switch", "case", "for", "while", "try", "catch", "finally", "then", "let", "this", "outer", "super", "is", "exists", "nonempty", "shared", "abstract", "formal", "default", "actual", "variable", "late", "native", "deprecated", "final", "sealed", "annotation", "suppressWarnings", "small"] as Any,
        "meta": ["doc", "by", "license", "see", "throws", "tagged"] as Any,
    ])
    lang.illegal = .regex("\\$[^01]|#[^0-9a-fA-F]")
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.COMMENT("/\\*", "\\*/")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@[a-z]\\w*(?::\"[^\"]*\")?")
            mode.scope = .single("meta")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"\"\"")
            mode.end = .regex("\"\"\"")
            mode.scope = .single("string")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("``")
                    mode.end = .regex("``")
                    mode.scope = .single("subst")
                    mode.keywords = .array(["assembly", "module", "package", "import", "alias", "class", "interface", "object", "given", "value", "assign", "void", "function", "new", "of", "extends", "satisfies", "abstracts", "in", "out", "return", "break", "continue", "throw", "assert", "dynamic", "if", "else", "switch", "case", "for", "while", "try", "catch", "finally", "then", "let", "this", "outer", "super", "is", "exists", "nonempty"])

                    mode.relevance = 10
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("'")
                            mode.end = .regex("'")
                            mode.scope = .single("string")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("#[0-9a-fA-F_]+|\\$[01_]+|[0-9_]+(?:\\.[0-9_](?:[eE][+-]?\\d+)?)?[kMGTPmunpf]?")
                            mode.scope = .single("number")
                            mode.relevance = 0
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        /* circular ref: __ref_2 */ .mode(Mode()),
        /* circular ref: __ref_3 */ .mode(Mode()),
    ]

    return lang
}

/// Register ceylon language
public extension HighlightJS {
    func registerCeylon() {
        registerLanguage("ceylon", definition: ceylonLanguage)
    }
}
