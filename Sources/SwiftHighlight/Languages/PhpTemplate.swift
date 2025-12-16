// Auto-generated from highlight.js
// Language: php-template

import Foundation

/// php-template language definition
public func php_templateLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "PHP template"

    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("<\\?(php|=)?")
            mode.end = .regex("\\?>")
            mode.subLanguage = .single("php")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("/\\*")
                    mode.end = .regex("\\*/")
                    mode.skip = true
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("b\"")
                    mode.end = .regex("\"")
                    mode.skip = true
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("b'")
                    mode.end = .regex("'")
                    mode.skip = true
                    return mode
                }()),
                .mode(CommonModes.APOS_STRING_MODE()),
                .mode(CommonModes.QUOTE_STRING_MODE()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register php-template language
public extension HighlightJS {
    func registerPhpTemplate() {
        registerLanguage("php-template", definition: php_templateLanguage)
    }
}
