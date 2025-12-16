// Auto-generated from highlight.js
// Language: cal

import Foundation

/// cal language definition
public func calLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "C/AL"

    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": ["div", "mod", "in", "and", "or", "not", "xor", "asserterror", "begin", "case", "do", "downto", "else", "end", "exit", "for", "local", "if", "of", "repeat", "then", "to", "until", "while", "with", "var"] as Any,
        "literal": "false true" as Any,
    ])
    lang.illegal = .regex("\\/\\*")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("[\\w]+(?=\\=)")
            mode.scope = .single("attribute")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("''")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(#\\d+)+")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b\\d+(\\.\\d+)?(DT|D|T)")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            return mode
        }()),
        .mode(CommonModes.NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("OBJECT"), .regex("\\s+"), .regex("(?:Table|Form|Report|Dataport|Codeunit|XMLport|MenuSuite|Page|Query)"), .regex("\\s+"), .regex("\\d+"), .regex("\\s+(?=[^\\s])"), .regex(".*"), .regex("$")])
            mode.scope = .multi([1: "keyword", 3: "type", 5: "number", 7: "title"])
            mode.relevance = 3
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("procedure"), .regex("\\s+"), .regex("[a-zA-Z_][\\w@]*"), .regex("\\s*")])
            mode.scope = .multi([1: "keyword", 3: "title.function"])
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.keywords = .array(["div", "mod", "in", "and", "or", "not", "xor", "asserterror", "begin", "case", "do", "downto", "else", "end", "exit", "for", "local", "if", "of", "repeat", "then", "to", "until", "while", "with", "var"])

                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                .mode(CommonModes.C_LINE_COMMENT_MODE()),
                .mode(CommonModes.COMMENT("\\{", "\\}")),
                .mode(CommonModes.COMMENT("\\(\\*", "\\*\\)")),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register cal language
public extension HighlightJS {
    func registerCal() {
        registerLanguage("cal", definition: calLanguage)
    }
}
