// Auto-generated from highlight.js
// Language: smali

import Foundation

/// smali language definition
public func smaliLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Smali"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.COMMENT("#", "$")),
        .mode({
            let mode = Mode()
            mode.scope = .single("keyword")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\s*\\.end\\s[a-zA-Z0-9]*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("^[ ]*\\.[a-zA-Z]*")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\s:[a-zA-Z_0-9]*")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\s(transient|constructor|abstract|final|synthetic|public|private|protected|static|bridge|system)")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("built_in")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\s(add|and|cmp|cmpg|cmpl|const|div|double|float|goto|if|int|long|move|mul|neg|new|nop|not|or|rem|return|shl|shr|sput|sub|throw|ushr|xor)\\s")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\s(add|and|cmp|cmpg|cmpl|const|div|double|float|goto|if|int|long|move|mul|neg|new|nop|not|or|rem|return|shl|shr|sput|sub|throw|ushr|xor)((-|/)[a-zA-Z0-9]+)+\\s")
                    mode.relevance = 10
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\s(aget|aput|array|check|execute|fill|filled|goto/16|goto/32|iget|instance|invoke|iput|monitor|packed|sget|sparse)((-|/)[a-zA-Z0-9]+)*\\s")
                    mode.relevance = 10
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("L[^(;:\n]*;")
            mode.scope = .single("class")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[vp][0-9]+")
            return mode
        }()),
    ]

    return lang
}

/// Register smali language
public extension HighlightJS {
    func registerSmali() {
        registerLanguage("smali", definition: smaliLanguage)
    }
}
