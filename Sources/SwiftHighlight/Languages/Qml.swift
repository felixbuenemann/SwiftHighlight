// Auto-generated from highlight.js
// Language: qml

import Foundation

/// qml language definition
public func qmlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "QML"

    lang.aliases = ["qt"]
    lang.keywords = .grouped([
        "keyword": "in of on if for while finally var new function do return void else break catch instanceof with throw case default try this switch continue typeof delete let yield const export super debugger as async await import" as Any,
        "literal": "true false null undefined NaN Infinity" as Any,
        "built_in": "eval isFinite isNaN parseFloat parseInt decodeURI decodeURIComponent encodeURI encodeURIComponent escape unescape Object Function Boolean Error EvalError InternalError RangeError ReferenceError StopIteration SyntaxError TypeError URIError Number Math Date String RegExp Array Float32Array Float64Array Int16Array Int32Array Int8Array Uint16Array Uint32Array Uint8Array Uint8ClampedArray ArrayBuffer DataView JSON Intl arguments require module console window document Symbol Set Map WeakSet WeakMap Proxy Reflect Behavior bool color coordinate date double enumeration font geocircle georectangle geoshape int list matrix4x4 parent point quaternion real rect size string url variant vector2d vector3d vector4d Promise" as Any,
    ])
    lang.illegal = .regex("#")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*['\"]use (strict|asm)['\"]")
            mode.scope = .single("meta")
            return mode
        }()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("`")
            mode.end = .regex("`")
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\$\\{")
                    mode.end = .regex("\\}")
                    mode.scope = .single("subst")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("number")
            mode.relevance = 0
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b(0[bB][01]+)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b(0[oO][0-7]+)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|-|-=|/=|/|:|;|<<|<<=|<=|<|===|==|=|>>>=|>>=|>=|>>>|>>|>|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~|\\b(case|return|throw)\\b)\\s*")
            mode.keywords = .simple("return throw case")

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                .mode(CommonModes.REGEXP_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("<")
                    mode.end = .regex(">\\s*[);\\]]")
                    mode.relevance = 0
                    mode.subLanguage = .single("xml")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\bsignal\\b")
            mode.scope = .single("keyword")
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("(\\(|:|=|;|,|//|/\\*|$)")
                    mode.scope = .single("string")
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\bproperty\\b")
            mode.scope = .single("keyword")
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("(:|=|;|,|//|/\\*|$)")
                    mode.scope = .single("string")
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\{")
            mode.scope = .single("function")
            mode.beginKeywords = "function"
            mode.illegal = .regex("\\[|%")
            mode.excludeEnd = true
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\.[a-zA-Z]\\w*")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\bid\\s*:")
            mode.scope = .single("attribute")
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("[a-zA-Z_][a-zA-Z0-9\\._]*")
                    mode.scope = .single("string")
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z_][a-zA-Z0-9\\._]*\\s*:")
            mode.relevance = 0
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-zA-Z_][a-zA-Z0-9\\._]*")
                    mode.end = .regex("\\s*:")
                    mode.scope = .single("attribute")
                    mode.relevance = 0
                    mode.excludeEnd = true
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z_][a-zA-Z0-9\\._]*/\\s*\\{/")
            mode.end = .regex("\\{")
            mode.relevance = 0
            mode.returnBegin = true
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register qml language
public extension HighlightJS {
    func registerQml() {
        registerLanguage("qml", definition: qmlLanguage)
    }
}
