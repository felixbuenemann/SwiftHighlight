// Auto-generated from highlight.js
// Language: pony

import Foundation

/// pony language definition
public func ponyLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Pony"

    lang.keywords = .grouped([
        "keyword": "actor addressof and as be break class compile_error compile_intrinsic consume continue delegate digestof do else elseif embed end error for fun if ifdef in interface is isnt lambda let match new not object or primitive recover repeat return struct then trait try type until use var where while with xor" as Any,
        "meta": "iso val tag trn box ref" as Any,
        "literal": "this false true" as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b_?[A-Z][\\w]*")
            mode.scope = .single("type")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"\"\"")
            mode.end = .regex("\"\"\"")
            mode.scope = .single("string")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z]\\w*'")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(-?)(\\b0[xX][a-fA-F0-9]+|\\b0[bB][01]+|(\\b\\d+(_\\d+)?(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
    ]

    return lang
}

/// Register pony language
public extension HighlightJS {
    func registerPony() {
        registerLanguage("pony", definition: ponyLanguage)
    }
}
