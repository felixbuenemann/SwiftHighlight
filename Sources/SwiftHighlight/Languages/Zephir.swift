// Auto-generated from highlight.js
// Language: zephir

import Foundation

/// zephir language definition
public func zephirLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Zephir"

    lang.aliases = ["zep"]
    lang.keywords = .simple("namespace class interface use extends function return abstract final public protected private static deprecated throw try catch Exception echo empty isset instanceof unset let var new const self require if else elseif switch case default do while loop for continue break likely unlikely __LINE__ __FILE__ __DIR__ __FUNCTION__ __CLASS__ __TRAIT__ __METHOD__ __NAMESPACE__ array boolean float double integer object resource string char long unsigned bool int uint ulong uchar true false null undefined")
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.COMMENT("\\/\\*", "\\*\\/")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("<<<['\"]?\\w+['\"]?$")
            mode.end = .regex("^\\w+;")
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(::|->)+[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff]*")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[;{]")
            mode.scope = .single("function")
            mode.beginKeywords = "function fn"
            mode.illegal = .regex("\\$|\\[|%")
            mode.excludeEnd = true
            mode.contains = [
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.keywords = .simple("namespace class interface use extends function return abstract final public protected private static deprecated throw try catch Exception echo empty isset instanceof unset let var new const self require if else elseif switch case default do while loop for continue break likely unlikely __LINE__ __FILE__ __DIR__ __FUNCTION__ __CLASS__ __TRAIT__ __METHOD__ __NAMESPACE__ array boolean float double integer object resource string char long unsigned bool int uint ulong uchar true false null undefined")

                    mode.contains = [
                        .selfReference,
                        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("string")
                            mode.contains = [
                                /* circular ref: __ref_0 */ .mode(Mode()),
                            ]
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("'")
                                    mode.end = .regex("'")
                                    mode.scope = .single("string")
                                    mode.contains = [
                                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                                    ]
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\"")
                                    mode.end = .regex("\"")
                                    mode.scope = .single("string")
                                    mode.contains = [
                                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                                    ]
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\b(0b[01]+)")
                                    mode.scope = .single("number")
                                    mode.relevance = 0
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)")
                                    mode.scope = .single("number")
                                    mode.relevance = 0
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\{")
            mode.scope = .single("class")
            mode.beginKeywords = "class interface"
            mode.illegal = .regex("[:($\"]")
            mode.excludeEnd = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.beginKeywords = "extends implements"
                    return mode
                }()),
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex(";")
            mode.beginKeywords = "namespace"
            mode.illegal = .regex("[.']")
            mode.contains = [
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex(";")
            mode.beginKeywords = "use"
            mode.contains = [
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("=>")
            return mode
        }()),
        /* circular ref: __ref_2 */ .mode(Mode()),
        /* circular ref: __ref_3 */ .mode(Mode()),
    ]

    return lang
}

/// Register zephir language
public extension HighlightJS {
    func registerZephir() {
        registerLanguage("zephir", definition: zephirLanguage)
    }
}
