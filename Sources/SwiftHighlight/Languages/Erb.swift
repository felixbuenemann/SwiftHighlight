// Auto-generated from highlight.js
// Language: erb

import Foundation

/// erb language definition
public func erbLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "ERB"

    lang.contains = [
        .mode(CommonModes.COMMENT("<%#", "%>")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("<%[%=-]?")
            mode.end = .regex("[%-]?%>")
            mode.excludeBegin = true
            mode.excludeEnd = true
            mode.subLanguage = .single("ruby")
            return mode
        }()),
    ]

    return lang
}

/// Register erb language
public extension HighlightJS {
    func registerErb() {
        registerLanguage("erb", definition: erbLanguage)
    }
}
