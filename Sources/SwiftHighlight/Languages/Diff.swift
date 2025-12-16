// Auto-generated from highlight.js
// Language: diff

import Foundation

/// diff language definition
public func diffLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Diff"

    lang.aliases = ["patch"]
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("(?:/^@@ +-\\d+,\\d+ +\\+\\d+,\\d+ +@@/|/^@@ +-\\d+ +\\+\\d+,\\d+ +@@/|/^@@ +-\\d+,\\d+ +\\+\\d+ +@@/|/^@@ +-\\d+ +\\+\\d+ +@@/|/^\\*\\*\\* +\\d+,\\d+ +\\*\\*\\*\\*$/|/^--- +\\d+,\\d+ +----$/)")
            mode.scope = .single("meta")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("comment")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("(?:/Index: /|/^index/|/={3,}/|/^-{3}/|/^\\*{3} /|/^\\+{3}/|/^diff --git/)")
                    mode.end = .regex("$")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("^\\*{15}$")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\+")
            mode.end = .regex("$")
            mode.scope = .single("addition")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^-")
            mode.end = .regex("$")
            mode.scope = .single("deletion")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^!")
            mode.end = .regex("$")
            mode.scope = .single("addition")
            return mode
        }()),
    ]

    return lang
}

/// Register diff language
public extension HighlightJS {
    func registerDiff() {
        registerLanguage("diff", definition: diffLanguage)
    }
}
