// Auto-generated from highlight.js
// Language: properties

import Foundation

/// properties language definition
public func propertiesLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = ".properties"

    lang.caseInsensitive = true
    lang.illegal = .regex("\\S")
    lang.contains = [
        .mode(CommonModes.COMMENT("^\\s*[!#]", "$")),
        .mode({
            let mode = Mode()
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("([^\\\\:= \\t\\f\\n]|\\\\.)+")
                    mode.scope = .single("attr")
                    mode.endsParent = true
                    return mode
                }()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("([^\\\\:= \\t\\f\\n]|\\\\.)+[ \\t\\f]*[:=][ \\t\\f]*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("([^\\\\:= \\t\\f\\n]|\\\\.)+[ \\t\\f]+")
                    return mode
                }(),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("([ \\t\\f]*[:=][ \\t\\f]*|[ \\t\\f]+)")
                    mode.relevance = 0
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("([^\\\\:= \\t\\f\\n]|\\\\.)+[ \\t\\f]*$")
            mode.scope = .single("attr")
            return mode
        }()),
    ]

    return lang
}

/// Register properties language
public extension HighlightJS {
    func registerProperties() {
        registerLanguage("properties", definition: propertiesLanguage)
    }
}
