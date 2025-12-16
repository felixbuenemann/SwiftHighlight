// Auto-generated from highlight.js
// Language: smalltalk

import Foundation

/// smalltalk language definition
public func smalltalkLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Smalltalk"

    lang.aliases = ["st"]
    lang.keywords = .array(["[object Object]", "super", "nil", "true", "false", "thisContext"])
    lang.contains = [
        .mode(CommonModes.COMMENT("\"", "\"")),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b[A-Z][A-Za-z0-9_]*")
            mode.scope = .single("type")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-z][a-zA-Z0-9_]*:")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#[a-zA-Z_]\\w*")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$.{1}")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\|[ ]*[a-z][a-zA-Z0-9_]*([ ]+[a-z][a-zA-Z0-9_]*)*[ ]*\\|")
            mode.end = .regex("\\|")
            mode.illegal = .regex("\\S")
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("(\\|[ ]*)?[a-z][a-zA-Z0-9_]*")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#\\(")
            mode.end = .regex("\\)")
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register smalltalk language
public extension HighlightJS {
    func registerSmalltalk() {
        registerLanguage("smalltalk", definition: smalltalkLanguage)
    }
}
