// Auto-generated from highlight.js
// Language: scala

import Foundation

/// scala language definition
public func scalaLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Scala"

    lang.keywords = .grouped([
        "literal": "true false null" as Any,
        "keyword": "type yield lazy override def with val var sealed abstract private trait object if then forSome for while do throw finally protected extends import final return else break new catch super class case package default try this match continue throws implicit export enum given transparent" as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("//>"), .regex("\\s+"), .regex("using"), .regex("\\s+"), .regex("\\S+")])
            mode.end = .regex("$")
            mode.beginScope = .multi([1: "comment", 3: "keyword", 5: "type"])
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\S+")
                    mode.scope = .single("string")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
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
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("[a-z]+\"")
                    mode.end = .regex("\"")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("subst")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\$[A-Za-z0-9_]+")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\$\\{")
                                    mode.end = .regex("\\}")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("[a-z]+\"\"\"")
                    mode.end = .regex("\"\"\"")
                    mode.scope = .single("string")
                    mode.relevance = 10
                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b[A-Z][A-Za-z0-9_]*")
            mode.scope = .single("type")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("(?=[:={\\[(\\n;])")
            mode.scope = .single("function")
            mode.beginKeywords = "def"
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[^0-9\\n\\t \"'(),.`{}\\[\\]:;][^\\n\\t \"'(),.`{}\\[\\]:;]+|[^0-9\\n\\t \"'(),.`{}\\[\\]:;=]")
                    mode.scope = .single("title")
                    mode.relevance = 0
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[:={\\[\\n;]")
            mode.scope = .single("class")
            mode.beginKeywords = "class object trait type"
            mode.excludeEnd = true
            mode.contains = [
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.beginKeywords = "extends with"
                    mode.relevance = 10
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\[")
                    mode.end = .regex("\\]")
                    mode.relevance = 0
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    mode.contains = [
                        /* circular ref: __ref_4 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.relevance = 0
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    mode.contains = [
                        /* circular ref: __ref_4 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_5 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("^\\s*"), .regex("extension"), .regex("\\s+(?=[[(])")])
            mode.beginScope = .multi([2: "keyword"])
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("^\\s*"), .regex("end"), .regex("\\s+"), .regex("(extension\\b)?")])
            mode.beginScope = .multi([2: "keyword", 4: "keyword"])
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\.inline\\b")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\binline(?=\\s)")
            mode.keywords = .simple("inline")

            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("\\(\\s*"), .regex("using"), .regex("\\s+(?!\\))")])
            mode.beginScope = .multi([2: "keyword"])
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@[A-Za-z]+")
            mode.scope = .single("meta")
            return mode
        }()),
    ]

    return lang
}

/// Register scala language
public extension HighlightJS {
    func registerScala() {
        registerLanguage("scala", definition: scalaLanguage)
    }
}
