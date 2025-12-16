// Auto-generated from highlight.js
// Language: mojolicious

import Foundation

/// mojolicious language definition
public func mojoliciousLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Mojolicious"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^__(END|DATA)__$")
            mode.scope = .single("meta")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*%{1,2}={0,2}")
            mode.end = .regex("$")
            mode.subLanguage = .single("perl")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("<%{1,2}={0,2}")
            mode.end = .regex("={0,1}%>")
            mode.excludeBegin = true
            mode.excludeEnd = true
            mode.subLanguage = .single("perl")
            return mode
        }()),
    ]

    return lang
}

/// Register mojolicious language
public extension HighlightJS {
    func registerMojolicious() {
        registerLanguage("mojolicious", definition: mojoliciousLanguage)
    }
}
