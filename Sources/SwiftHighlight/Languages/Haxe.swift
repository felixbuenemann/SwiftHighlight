// Auto-generated from highlight.js
// Language: haxe

import Foundation

/// haxe language definition
public func haxeLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Haxe"

    lang.aliases = ["hx"]
    lang.keywords = .grouped([
        "keyword": "abstract break case cast catch continue default do dynamic else enum extern final for function here if import in inline is macro never new override package private get set public return static super switch this throw trace try typedef untyped using var while Int Float String Bool Dynamic Void Array " as Any,
        "built_in": "trace this" as Any,
        "literal": "true false null _" as Any,
    ])
    lang.illegal = .regex("<\\/")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\$\\{")
                    mode.end = .regex("\\}")
                    mode.scope = .single("subst")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\$")
                    mode.end = .regex("\\W\\}")
                    mode.scope = .single("subst")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(-?)(\\b0[xX][a-fA-F0-9_]+|(\\b\\d+(\\.[\\d_]*)?|\\.[\\d_]+)(([eE][-+]?\\d+)|i32|u32|i64|f64)?)")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$[a-zA-Z_$][a-zA-Z0-9_$]*")
            mode.scope = .single("variable")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@:?")
            mode.end = .regex("\\(|$")
            mode.scope = .single("meta")
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            mode.keywords = .grouped([
                "keyword": "if else elseif end error" as Any,
            ])

            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(":[ \\t]*")
            mode.end = .regex("[^A-Za-z0-9_ \\t\\->]")
            mode.scope = .single("type")
            mode.relevance = 0
            mode.excludeBegin = true
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(":[ \\t]*")
            mode.end = .regex("\\W")
            mode.scope = .single("type")
            mode.excludeBegin = true
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\W")
            mode.scope = .single("type")
            mode.beginKeywords = "new"
            mode.excludeBegin = true
            mode.excludeEnd = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\{")
            mode.scope = .single("title.class")
            mode.beginKeywords = "enum"
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\babstract\\b(?=\\s*[a-zA-Z]\\w*\\s*\\()")
            mode.end = .regex("[\\{$]")
            mode.scope = .single("title.class")
            mode.keywords = .grouped([
                "keyword": "abstract from to" as Any,
            ])

            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("type")
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("from +")
                    mode.end = .regex("\\W")
                    mode.scope = .single("type")
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("to +")
                    mode.end = .regex("\\W")
                    mode.scope = .single("type")
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    return mode
                }()),
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(class|interface) +")
            mode.end = .regex("[\\{$]")
            mode.scope = .single("title.class")
            mode.keywords = .simple("class interface")

            mode.excludeEnd = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\b(extends|implements) +")
                    mode.scope = .single("keyword")
                    mode.keywords = .simple("extends implements")

                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[a-zA-Z]\\w*")
                            mode.scope = .single("type")
                            mode.relevance = 0
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\(")
            mode.scope = .single("title.function")
            mode.beginKeywords = "function"
            mode.illegal = .regex("\\S")
            mode.excludeEnd = true
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register haxe language
public extension HighlightJS {
    func registerHaxe() {
        registerLanguage("haxe", definition: haxeLanguage)
    }
}
