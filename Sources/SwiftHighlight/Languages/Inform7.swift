// Auto-generated from highlight.js
// Language: inform7

import Foundation

/// inform7 language definition
public func inform7Language(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Inform 7"

    lang.aliases = ["i7"]
    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": "thing room person man woman animal container supporter backdrop door scenery open closed locked inside gender is are say understand kind of rule" as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\[")
                    mode.end = .regex("\\]")
                    mode.scope = .single("subst")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^(Volume|Book|Part|Chapter|Section|Table)\\b")
            mode.end = .regex("$")
            mode.scope = .single("section")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^(Check|Carry out|Report|Instead of|To|Rule|When|Before|After)\\b")
            mode.end = .regex(":")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(This")
                    mode.end = .regex("\\)")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[")
            mode.end = .regex("\\]")
            mode.scope = .single("comment")
            mode.contains = [
                .selfReference,
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register inform7 language
public extension HighlightJS {
    func registerInform7() {
        registerLanguage("inform7", definition: inform7Language)
    }
}
