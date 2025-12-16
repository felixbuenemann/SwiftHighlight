// Auto-generated from highlight.js
// Language: livescript

import Foundation

/// livescript language definition
public func livescriptLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "LiveScript"

    lang.aliases = ["ls"]
    lang.keywords = .grouped([
        "keyword": "as in of if for while finally var new function do return void else break catch instanceof with throw case default try switch continue typeof delete let yield const class debugger async await static import from export extends usingthen,unless,until,loop,of,by,when,and,or,is,isnt,not,it,that,otherwise,from,to,til,fallthrough,case,enum,native,list,map,__hasProp,__extends,__slice,__bind,__indexOf" as Any,
        "literal": "true false null undefined NaN Infinityyes,no,on,off,it,that,void" as Any,
        "built_in": "setInterval setTimeout clearInterval clearTimeout require exports eval isFinite isNaN parseFloat parseInt decodeURI decodeURIComponent encodeURI encodeURIComponent escape unescape Object Function Boolean Symbol Math Date Number BigInt String RegExp Array Float32Array Float64Array Int8Array Uint8Array Uint8ClampedArray Int16Array Int32Array Uint16Array Uint32Array BigInt64Array BigUint64Array Set Map WeakSet WeakMap ArrayBuffer SharedArrayBuffer Atomics DataView JSON Promise Generator GeneratorFunction AsyncFunction Reflect Proxy Intl WebAssembly Error EvalError InternalError RangeError ReferenceError SyntaxError TypeError URIErrornpm,print" as Any,
    ])
    lang.illegal = .regex("\\/\\*")
    lang.contains = [
        .mode(CommonModes.BINARY_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(\\b0[xX][a-fA-F0-9_]+)|(\\b\\d(\\d|_\\d)*(\\.(\\d(\\d|_\\d)*)?)?(_*[eE]([-+]\\d(_\\d|\\d)*)?)?[_a-z]*)")
            mode.scope = .single("number")
            mode.relevance = 0
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("(\\s*/)?")
                    mode.relevance = 0
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("'''")
                    mode.end = .regex("'''")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"\"\"")
                    mode.end = .regex("\"\"\"")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("#\\{")
                            mode.end = .regex("\\}")
                            mode.scope = .single("subst")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_1" as Any,
                            ])

                            mode.contains = [
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                /* circular ref: __ref_3 */ .mode(Mode()),
                                /* circular ref: __ref_4 */ .mode(Mode()),
                                .mode({
                                    let mode = Mode()
                                    mode.scope = .single("regexp")
                                    mode.variants = [
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("//")
                                            mode.end = .regex("//[gim]*")
                                            mode.contains = [
                                                /* circular ref: __ref_5 */ .mode(Mode()),
                                                .mode(CommonModes.HASH_COMMENT_MODE()),
                                            ]
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\/(?![ *])(\\\\.|[^\\\\\\n])*?\\/[gim]*(?=\\W)")
                                            return mode
                                        }(),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("@[A-Za-z$_](?:-[0-9A-Za-z$_]|[0-9A-Za-z$_])*")
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("``")
                                    mode.end = .regex("``")
                                    mode.excludeBegin = true
                                    mode.excludeEnd = true
                                    mode.subLanguage = .single("javascript")
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("#[A-Za-z$_]")
                            mode.end = .regex("(?:-[0-9A-Za-z$_]|[0-9A-Za-z$_])*")
                            mode.scope = .single("subst")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_1" as Any,
                            ])

                            return mode
                        }()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_5 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\\\")
                    mode.end = .regex("(\\s|$)")
                    return mode
                }(),
            ]
            return mode
        }()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_9 */ .mode(Mode()),
        .mode(CommonModes.COMMENT("\\/\\*", "\\*\\/")),
        /* circular ref: __ref_10 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(#=>|=>|\\|>>|-?->|!->)")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("function")
            mode.returnBegin = true
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.scope = .single("params")
                    mode.returnBegin = true
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\(")
                            mode.end = .regex("\\)")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_1" as Any,
                            ])

                            mode.contains = [
                                .selfReference,
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                /* circular ref: __ref_3 */ .mode(Mode()),
                                /* circular ref: __ref_4 */ .mode(Mode()),
                                /* circular ref: __ref_7 */ .mode(Mode()),
                                /* circular ref: __ref_8 */ .mode(Mode()),
                                /* circular ref: __ref_9 */ .mode(Mode()),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("([A-Za-z$_](?:-[0-9A-Za-z$_]|[0-9A-Za-z$_])*\\s*(?:=|:=)\\s*)?(\\(.*\\)\\s*)?\\B->\\*?")
                    mode.end = .regex("->\\*?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("([A-Za-z$_](?:-[0-9A-Za-z$_]|[0-9A-Za-z$_])*\\s*(?:=|:=)\\s*)?!?(\\(.*\\)\\s*)?\\B[-~]{1,2}>\\*?")
                    mode.end = .regex("[-~]{1,2}>\\*?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("([A-Za-z$_](?:-[0-9A-Za-z$_]|[0-9A-Za-z$_])*\\s*(?:=|:=)\\s*)?(\\(.*\\)\\s*)?\\B!?[-~]{1,2}>\\*?")
                    mode.end = .regex("!?[-~]{1,2}>\\*?")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .multi([2: "title.class", 4: "title.class.inherited"])
            mode.keywords = .grouped([
                "__circularRef": "__ref_1" as Any,
            ])

            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("class\\s+"), .regex("[A-Za-z$_](?:-[0-9A-Za-z$_]|[0-9A-Za-z$_])*"), .regex("\\s+extends\\s+"), .regex("[A-Za-z$_](?:-[0-9A-Za-z$_]|[0-9A-Za-z$_])*")])
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("class\\s+"), .regex("[A-Za-z$_](?:-[0-9A-Za-z$_]|[0-9A-Za-z$_])*")])
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[A-Za-z$_](?:-[0-9A-Za-z$_]|[0-9A-Za-z$_])*:")
            mode.end = .regex(":")
            mode.relevance = 0
            mode.returnBegin = true
            mode.returnEnd = true
            return mode
        }()),
    ]

    return lang
}

/// Register livescript language
public extension HighlightJS {
    func registerLivescript() {
        registerLanguage("livescript", definition: livescriptLanguage)
    }
}
