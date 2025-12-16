// Auto-generated from highlight.js
// Language: dockerfile

import Foundation

/// dockerfile language definition
public func dockerfileLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Dockerfile"

    lang.aliases = ["docker"]
    lang.caseInsensitive = true
    lang.keywords = .array(["from", "maintainer", "expose", "env", "arg", "user", "onbuild", "stopsignal"])
    lang.illegal = .regex("</")
    lang.contains = [
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.beginKeywords = "run cmd entrypoint volume add copy workdir label healthcheck shell"
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("[^\\\\]$")
                    return mode
                }()
            }()
            return mode
        }()),
    ]

    return lang
}

/// Register dockerfile language
public extension HighlightJS {
    func registerDockerfile() {
        registerLanguage("dockerfile", definition: dockerfileLanguage)
    }
}
