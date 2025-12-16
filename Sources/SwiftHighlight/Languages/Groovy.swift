// Auto-generated from highlight.js
// Language: groovy

import Foundation

/// groovy language definition
public func groovyLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Groovy"

    lang.keywords = .grouped([
        "variable.language": "this super" as Any,
        "literal": "true false null" as Any,
        "type": ["byte", "short", "char", "int", "long", "boolean", "float", "double", "void"] as Any,
        "keyword": ["def", "as", "in", "assert", "trait", "abstract", "static", "volatile", "transient", "public", "private", "protected", "synchronized", "final", "class", "interface", "enum", "if", "else", "for", "while", "switch", "case", "break", "default", "continue", "throw", "throws", "try", "catch", "finally", "implements", "extends", "new", "import", "package", "return", "instanceof", "var"] as Any,
    ])
    lang.illegal = .regex("#|<\\/")
    lang.contains = [
        .mode(CommonModes.SHEBANG(binary: "groovy")),
        .mode({
            let mode = Mode()
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("//")
                    mode.end = .regex("$")
                    mode.scope = .single("comment")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("/\\*")
                    mode.end = .regex("\\*/")
                    mode.scope = .single("comment")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("/\\*\\*")
                    mode.end = .regex("\\*/")
                    mode.scope = .single("comment")
                    mode.relevance = 0
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\w+@")
                            mode.relevance = 0
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("@[A-Za-z]+")
                            mode.scope = .single("doctag")
                            return mode
                        }()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\"\"\"")
                    mode.end = .regex("\"\"\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'''")
                    mode.end = .regex("'''")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\$/")
                    mode.end = .regex("/\\$")
                    mode.relevance = 10
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("~?\\/[^\\/\\n]+\\/")
            mode.scope = .single("regexp")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b(0b[01]+)")
                    mode.scope = .single("number")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)")
                    mode.scope = .single("number")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("(class|interface|trait|enum|record|extends|implements)"), .regex("\\s+"), .regex("[a-zA-Z_]\\w*")])
            mode.scope = .multi([1: "keyword", 3: "title.class"])
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@[A-Za-z]+")
            mode.scope = .single("meta")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[A-Za-z0-9_$]+[ \t]*:")
            mode.scope = .single("attr")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\?")
            mode.end = .regex(":")
            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                .selfReference,
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[ \t]*(?=[A-Za-z0-9_$]+:)")
            mode.end = .regex("[A-Za-z0-9_$]+:")
            mode.scope = .single("symbol")
            mode.relevance = 0
            mode.excludeBegin = true
            return mode
        }()),
    ]

    return lang
}

/// Register groovy language
public extension HighlightJS {
    func registerGroovy() {
        registerLanguage("groovy", definition: groovyLanguage)
    }
}
