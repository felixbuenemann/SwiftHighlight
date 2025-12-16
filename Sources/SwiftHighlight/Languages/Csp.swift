// Auto-generated from highlight.js
// Language: csp

import Foundation

/// csp language definition
public func cspLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "CSP"

    lang.keywords = .grouped([
        "keyword": ["base-uri", "child-src", "connect-src", "default-src", "fenced-frame-src", "font-src", "form-action", "frame-ancestors", "frame-src", "img-src", "manifest-src", "media-src", "object-src", "plugin-types", "report-to", "report-uri", "require-trusted-types-for", "sandbox", "script-src", "script-src-attr", "script-src-elem", "style-src", "style-src-attr", "style-src-elem", "trusted-types", "unsafe-hashes", "worker-src"] as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^Content")
            mode.end = .regex(":")
            mode.scope = .single("attribute")
            mode.excludeEnd = true
            return mode
        }()),
    ]

    return lang
}

/// Register csp language
public extension HighlightJS {
    func registerCsp() {
        registerLanguage("csp", definition: cspLanguage)
    }
}
