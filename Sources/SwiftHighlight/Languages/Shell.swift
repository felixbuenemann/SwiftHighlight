// Auto-generated from highlight.js
// Language: shell

import Foundation

/// shell language definition
public func shellLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Shell Session"

    lang.aliases = ["console", "shellsession"]
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s{0,3}[/~\\w\\d[\\]()@-]*[>%$#][ ]?")
            mode.scope = .single("meta.prompt")
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("[^\\\\](?=\\s*$)")
                    return mode
                }()
            }()
            return mode
        }()),
    ]

    return lang
}

/// Register shell language
public extension HighlightJS {
    func registerShell() {
        registerLanguage("shell", definition: shellLanguage)
    }
}
