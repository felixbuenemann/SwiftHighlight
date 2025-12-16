// Auto-generated from highlight.js
// Language: vbscript-html

import Foundation

/// vbscript-html language definition
public func vbscript_htmlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "VBScript in HTML"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("<%")
            mode.end = .regex("%>")
            mode.subLanguage = .single("vbscript")
            return mode
        }()),
    ]

    return lang
}

/// Register vbscript-html language
public extension HighlightJS {
    func registerVbscriptHtml() {
        registerLanguage("vbscript-html", definition: vbscript_htmlLanguage)
    }
}
