// Auto-generated from highlight.js
// Language: hy

import Foundation

/// hy language definition
public func hyLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Hy"

    lang.aliases = ["hylang"]
    lang.illegal = .regex("\\S")
    lang.contains = [
        .mode(CommonModes.SHEBANG()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\(")
            mode.end = .regex("\\)")
            mode.contains = [
                .mode(CommonModes.COMMENT("comment", "$")),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-zA-Z_\\-!.?+*=<>&#'][a-zA-Z_\\-!.?+*=<>&#'0-9/;:]*")
                    mode.scope = .single("name")
                    mode.keywords = .grouped([
                        "built_in": "!= % %= & &= * ** **= *= *map + += , --build-class-- --import-- -= . / // //= /= < << <<= <= = > >= >> >>= @ @= ^ ^= abs accumulate all and any ap-compose ap-dotimes ap-each ap-each-while ap-filter ap-first ap-if ap-last ap-map ap-map-when ap-pipe ap-reduce ap-reject apply as-> ascii assert assoc bin break butlast callable calling-module-name car case cdr chain chr coll? combinations compile compress cond cons cons? continue count curry cut cycle dec def default-method defclass defmacro defmacro-alias defmacro/g! defmain defmethod defmulti defn defn-alias defnc defnr defreader defseq del delattr delete-route dict-comp dir disassemble dispatch-reader-macro distinct divmod do doto drop drop-last drop-while empty? end-sequence eval eval-and-compile eval-when-compile even? every? except exec filter first flatten float? fn fnc fnr for for* format fraction genexpr gensym get getattr global globals group-by hasattr hash hex id identity if if* if-not if-python2 import in inc input instance? integer integer-char? integer? interleave interpose is is-coll is-cons is-empty is-even is-every is-float is-instance is-integer is-integer-char is-iterable is-iterator is-keyword is-neg is-none is-not is-numeric is-odd is-pos is-string is-symbol is-zero isinstance islice issubclass iter iterable? iterate iterator? keyword keyword? lambda last len let lif lif-not list* list-comp locals loop macro-error macroexpand macroexpand-1 macroexpand-all map max merge-with method-decorator min multi-decorator multicombinations name neg? next none? nonlocal not not-in not? nth numeric? oct odd? open or ord partition permutations pos? post-route postwalk pow prewalk print product profile/calls profile/cpu put-route quasiquote quote raise range read read-str recursive-replace reduce remove repeat repeatedly repr require rest round route route-with-methods rwm second seq set-comp setattr setv some sorted string string? sum switch symbol? take take-nth take-while tee try unless unquote unquote-splicing vars walk when while with with* with-decorator with-gensyms xi xor yield yield-from zero? zip zip-longest | |= ~" as Any,
                    ])

                    mode.relevance = 0
                    mode.starts = {
                        {
                            let mode = Mode()
                            mode.relevance = 0
                            mode.contains = [
                                /* circular ref: __ref_0 */ .mode(Mode()),
                                .mode(CommonModes.QUOTE_STRING_MODE()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\^[a-zA-Z_\\-!.?+*=<>&#'][a-zA-Z_\\-!.?+*=<>&#'0-9/;:]*")
                                    mode.scope = .single("comment")
                                    return mode
                                }()),
                                .mode(CommonModes.COMMENT("\\^\\{", "\\}")),
                                .mode(CommonModes.COMMENT(";", "$")),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("[:]{1,2}[a-zA-Z_\\-!.?+*=<>&#'][a-zA-Z_\\-!.?+*=<>&#'0-9/;:]*")
                                    mode.scope = .single("symbol")
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("[\\[\\{]")
                                    mode.end = .regex("[\\]\\}]")
                                    mode.relevance = 0
                                    mode.contains = [
                                        /* circular ref: __ref_0 */ .mode(Mode()),
                                        /* circular ref: __ref_1 */ .mode(Mode()),
                                        /* circular ref: __ref_2 */ .mode(Mode()),
                                        /* circular ref: __ref_3 */ .mode(Mode()),
                                        /* circular ref: __ref_4 */ .mode(Mode()),
                                        /* circular ref: __ref_5 */ .mode(Mode()),
                                        /* circular ref: __ref_6 */ .mode(Mode()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("[-+]?\\d+(\\.\\d+)?")
                                            mode.scope = .single("number")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\b([Tt]rue|[Ff]alse|nil|None)\\b")
                                            mode.scope = .single("literal")
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("[a-zA-Z_\\-!.?+*=<>&#'][a-zA-Z_\\-!.?+*=<>&#'0-9/;:]*")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                /* circular ref: __ref_7 */ .mode(Mode()),
                                /* circular ref: __ref_8 */ .mode(Mode()),
                                /* circular ref: __ref_9 */ .mode(Mode()),
                            ]
                            return mode
                        }()
                    }()
                    return mode
                }()),
                /* circular ref: __ref_10 */ .mode(Mode()),
            ]
            return mode
        }()),
        /* circular ref: __ref_1 */ .mode(Mode()),
        /* circular ref: __ref_2 */ .mode(Mode()),
        /* circular ref: __ref_3 */ .mode(Mode()),
        /* circular ref: __ref_4 */ .mode(Mode()),
        /* circular ref: __ref_5 */ .mode(Mode()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
    ]

    return lang
}

/// Register hy language
public extension HighlightJS {
    func registerHy() {
        registerLanguage("hy", definition: hyLanguage)
    }
}
