// Auto-generated from highlight.js
// Language: javascript

import Foundation

/// javascript language definition
public func javascriptLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "JavaScript"

    lang.aliases = ["js", "jsx", "mjs", "cjs"]
    lang.keywords = .grouped([
        "keyword": "as in of if for while finally var new function do return void else break catch instanceof with throw case default try switch continue typeof delete let yield const class debugger async await static import from export extends using" as Any,
        "literal": "true false null undefined NaN Infinity" as Any,
        "built_in": "setInterval setTimeout clearInterval clearTimeout require exports eval isFinite isNaN parseFloat parseInt decodeURI decodeURIComponent encodeURI encodeURIComponent escape unescape Object Function Boolean Symbol Math Date Number BigInt String RegExp Array Float32Array Float64Array Int8Array Uint8Array Uint8ClampedArray Int16Array Int32Array Uint16Array Uint32Array BigInt64Array BigUint64Array Set Map WeakSet WeakMap ArrayBuffer SharedArrayBuffer Atomics DataView JSON Promise Generator GeneratorFunction AsyncFunction Reflect Proxy Intl WebAssembly Error EvalError InternalError RangeError ReferenceError SyntaxError TypeError URIError" as Any,
        "variable.language": ["arguments", "this", "super", "console", "window", "document", "localStorage", "sessionStorage", "module", "global"] as Any,
    ])
    lang.illegal = .regex("#(?![$_A-Za-z])")
    lang.contains = [
        .mode(CommonModes.SHEBANG(binary: "node")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*['\"]use (strict|asm)['\"]")
            mode.scope = .single("meta")
            mode.relevance = 10
            return mode
        }()),
        /* circular ref: __ref_1 */ .mode(Mode()),
        /* circular ref: __ref_2 */ .mode(Mode()),
        /* circular ref: __ref_3 */ .mode(Mode()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_12 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$\\d+")
            return mode
        }()),
        /* circular ref: __ref_10 */ .mode(Mode()),
        /* circular ref: __ref_13 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[A-Za-z$_][0-9A-Za-z$_]*(?=:)")
            mode.scope = .single("attr")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("const|var|let"), .regex("\\s+"), .regex("[A-Za-z$_][0-9A-Za-z$_]*"), .regex("\\s*"), .regex("=\\s*"), .regex("(async\\s*)?"), .regex("(?=(\\([^()]*(\\([^()]*(\\([^()]*\\)[^()]*)*\\)[^()]*)*\\)|[a-zA-Z_]\\w*)\\s*=>)")])
            mode.scope = .single("[object Object]")
            mode.keywords = .simple("async")

            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("(\\s*)\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_0" as Any,
                    ])

                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    mode.contains = [
                        /* circular ref: __ref_12 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                        /* circular ref: __ref_7 */ .mode(Mode()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                        /* circular ref: __ref_9 */ .mode(Mode()),
                        /* circular ref: __ref_10 */ .mode(Mode()),
                        /* circular ref: __ref_11 */ .mode(Mode()),
                        /* circular ref: __ref_14 */ .mode(Mode()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|-|-=|/=|/|:|;|<<|<<=|<=|<|===|==|=|>>>=|>>=|>=|>>>|>>|>|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~|\\b(case|return|throw)\\b)\\s*")
            mode.keywords = .simple("return throw case")

            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_12 */ .mode(Mode()),
                .mode(CommonModes.REGEXP_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("(\\([^()]*(\\([^()]*(\\([^()]*\\)[^()]*)*\\)[^()]*)*\\)|[a-zA-Z_]\\w*)\\s*=>")
                    mode.end = .regex("\\s*=>")
                    mode.scope = .single("function")
                    mode.returnBegin = true
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("params")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("[a-zA-Z_]\\w*")
                                    mode.relevance = 0
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\(\\s*\\)")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("(\\s*)\\(")
                                    mode.end = .regex("\\)")
                                    mode.keywords = .grouped([
                                        "__circularRef": "__ref_0" as Any,
                                    ])

                                    mode.contains = [
                                        /* circular ref: __ref_12 */ .mode(Mode()),
                                        /* circular ref: __ref_1 */ .mode(Mode()),
                                        /* circular ref: __ref_2 */ .mode(Mode()),
                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                        /* circular ref: __ref_6 */ .mode(Mode()),
                                        /* circular ref: __ref_7 */ .mode(Mode()),
                                        /* circular ref: __ref_8 */ .mode(Mode()),
                                        /* circular ref: __ref_9 */ .mode(Mode()),
                                        /* circular ref: __ref_10 */ .mode(Mode()),
                                        /* circular ref: __ref_11 */ .mode(Mode()),
                                        /* circular ref: __ref_14 */ .mode(Mode()),
                                    ]
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex(",")
                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\s+")
                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.subLanguage = .single("xml")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("<[A-Za-z0-9\\\\._:-]+")
                            mode.end = .regex("\\/[A-Za-z0-9\\\\._:-]+>|\\/>")
                            mode.skip = true
                            mode.contains = [
                                .selfReference,
                            ]
                            return mode
                        }()),
                    ]
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("<>")
                            mode.end = .regex("</>")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("<[A-Za-z0-9\\\\._:-]+\\s*\\/>")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("<[A-Za-z0-9\\\\._:-]+")
                            mode.end = .regex("\\/[A-Za-z0-9\\\\._:-]+>|\\/>")
                            return mode
                        }(),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("[object Object]")
            mode.illegal = .regex("%")
            mode.contains = [
                /* circular ref: __ref_15 */ .mode(Mode()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("function"), .regex("\\s+"), .regex("[A-Za-z$_][0-9A-Za-z$_]*"), .regex("(?=\\s*\\()")])
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("function"), .regex("\\s*(?=\\()")])
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.beginKeywords = "while if switch catch for"
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(?!function)[a-zA-Z_]\\w*\\([^()]*(\\([^()]*(\\([^()]*\\)[^()]*)*\\)[^()]*)*\\)\\s*\\{")
            mode.returnBegin = true
            mode.contains = [
                /* circular ref: __ref_15 */ .mode(Mode()),
                .mode(CommonModes.TITLE_MODE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\.\\.\\.")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/\\./(?=[A-Za-z$_][0-9A-Za-z$_]*/(?![0-9A-Za-z$_(])/)")
            mode.end = .regex("[A-Za-z$_][0-9A-Za-z$_]*")
            mode.scope = .single("property")
            mode.keywords = .simple("prototype")

            mode.relevance = 0
            mode.excludeBegin = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$[A-Za-z$_][0-9A-Za-z$_]*")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("\\bconstructor(?=\\s*\\()")])
            mode.scope = .single("[object Object]")
            mode.contains = [
                /* circular ref: __ref_15 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/\\b/(?!setInterval\\s*\\(|setTimeout\\s*\\(|clearInterval\\s*\\(|clearTimeout\\s*\\(|require\\s*\\(|exports\\s*\\(|eval\\s*\\(|isFinite\\s*\\(|isNaN\\s*\\(|parseFloat\\s*\\(|parseInt\\s*\\(|decodeURI\\s*\\(|decodeURIComponent\\s*\\(|encodeURI\\s*\\(|encodeURIComponent\\s*\\(|escape\\s*\\(|unescape\\s*\\(|super\\s*\\(|import\\s*\\(|await\\s*\\()[A-Za-z$_][0-9A-Za-z$_]*(?=\\s*\\()")
            mode.scope = .single("title.function")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b[A-Z][A-Z_0-9]+\\b")
            mode.scope = .single("variable.constant")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("class"), .regex("\\s+"), .regex("[A-Za-z$_][0-9A-Za-z$_]*"), .regex("\\s+"), .regex("extends"), .regex("\\s+"), .regex("[A-Za-z$_][0-9A-Za-z$_]*(/\\./[A-Za-z$_][0-9A-Za-z$_]*)*")])
                    mode.scope = .multi([1: "keyword", 3: "title.class", 5: "keyword", 7: "title.class.inherited"])
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("class"), .regex("\\s+"), .regex("[A-Za-z$_][0-9A-Za-z$_]*")])
                    mode.scope = .multi([1: "keyword", 3: "title.class"])
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("get|set"), .regex("\\s+"), .regex("[A-Za-z$_][0-9A-Za-z$_]*"), .regex("(?=\\()")])
            mode.scope = .single("[object Object]")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(\\)")
                    return mode
                }()),
                /* circular ref: __ref_15 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$[(.]")
            return mode
        }()),
    ]

    return lang
}

/// Register javascript language
public extension HighlightJS {
    func registerJavascript() {
        registerLanguage("javascript", definition: javascriptLanguage)
    }
}
