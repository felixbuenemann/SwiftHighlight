// Auto-generated from highlight.js
// Language: clojure

import Foundation

/// clojure language definition
public func clojureLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Clojure"

    lang.aliases = ["clj", "edn"]
    lang.illegal = .regex("\\S")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex(",")
            mode.scope = .single("punctuation")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\(")
            mode.end = .regex("\\)")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.end = .regex("(\\[|#|\\d|\"|:|\\{|\\)|\\(|$)")
                    mode.keywords = .grouped([
                        "keyword": "def defonce defprotocol defstruct defmulti defmethod defn- defn defmacro deftype defrecord" as Any,
                    ])

                    mode.beginKeywords = "def defonce defprotocol defstruct defmulti defmethod defn- defn defmacro deftype defrecord"
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[#]?[a-zA-Z_\\-!.?+*=<>&'][a-zA-Z_\\-!.?+*=<>&'0-9/;:$#]*")
                            mode.scope = .single("title")
                            mode.relevance = 0
                            mode.endsParent = true
                            mode.excludeEnd = true
                            return mode
                        }()),
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("character")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\\\o[0-3]?[0-7]{1,2}")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\\\u[0-9a-fA-F]{4}")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\\\(newline|space|tab|formfeed|backspace|return)")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\\\\\S")
                                    mode.relevance = 0
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("#\"")
                            mode.end = .regex("\"")
                            mode.scope = .single("regex")
                            mode.contains = [
                                .mode(CommonModes.BACKSLASH_ESCAPE()),
                            ]
                            return mode
                        }()),
                        .mode(CommonModes.QUOTE_STRING_MODE()),
                        .mode(CommonModes.COMMENT(";", "$")),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[:]{1,2}[#]?[a-zA-Z_\\-!.?+*=<>&'][a-zA-Z_\\-!.?+*=<>&'0-9/;:$#]*")
                            mode.scope = .single("symbol")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\[|(#::?[#]?[a-zA-Z_\\-!.?+*=<>&'][a-zA-Z_\\-!.?+*=<>&'0-9/;:$#]*)?\\{")
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
                                /* circular ref: __ref_7 */ .mode(Mode()),
                                .mode({
                                    let mode = Mode()
                                    mode.scope = .single("number")
                                    mode.relevance = 0
                                    mode.variants = [
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("[-+]?0[xX][0-9a-fA-F]+N?")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("[-+]?0[0-7]+N?")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("[-+]?[1-9][0-9]?[rR][0-9a-zA-Z]+N?")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("[-+]?[0-9]+\\/[0-9]+N?")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("[-+]?[0-9]+((\\.[0-9]*([eE][+-]?[0-9]+)?M?)|([eE][+-]?[0-9]+M?|M))")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("[-+]?([1-9][0-9]*|0)N?")
                                            return mode
                                        }(),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\b(true|false|nil)\\b")
                                    mode.scope = .single("literal")
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("[#]?[a-zA-Z_\\-!.?+*=<>&'][a-zA-Z_\\-!.?+*=<>&'0-9/;:$#]*")
                                    mode.relevance = 0
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                        /* circular ref: __ref_9 */ .mode(Mode()),
                        /* circular ref: __ref_10 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[#]?[a-zA-Z_\\-!.?+*=<>&'][a-zA-Z_\\-!.?+*=<>&'0-9/;:$#]*")
                    mode.scope = .single("name")
                    mode.keywords = .grouped([
                        "built_in": "def defonce defprotocol defstruct defmulti defmethod defn- defn defmacro deftype defrecord cond apply if-not if-let if not not= =|0 <|0 >|0 <=|0 >=|0 ==|0 +|0 /|0 *|0 -|0 rem quot neg? pos? delay? symbol? keyword? true? false? integer? empty? coll? list? set? ifn? fn? associative? sequential? sorted? counted? reversible? number? decimal? class? distinct? isa? float? rational? reduced? ratio? odd? even? char? seq? vector? string? map? nil? contains? zero? instance? not-every? not-any? libspec? -> ->> .. . inc compare do dotimes mapcat take remove take-while drop letfn drop-last take-last drop-while while intern condp case reduced cycle split-at split-with repeat replicate iterate range merge zipmap declare line-seq sort comparator sort-by dorun doall nthnext nthrest partition eval doseq await await-for let agent atom send send-off release-pending-sends add-watch mapv filterv remove-watch agent-error restart-agent set-error-handler error-handler set-error-mode! error-mode shutdown-agents quote var fn loop recur throw try monitor-enter monitor-exit macroexpand macroexpand-1 for dosync and or when when-not when-let comp juxt partial sequence memoize constantly complement identity assert peek pop doto proxy first rest cons cast coll last butlast sigs reify second ffirst fnext nfirst nnext meta with-meta ns in-ns create-ns import refer keys select-keys vals key val rseq name namespace promise into transient persistent! conj! assoc! dissoc! pop! disj! use class type num float double short byte boolean bigint biginteger bigdec print-method print-dup throw-if printf format load compile get-in update-in pr pr-on newline flush read slurp read-line subvec with-open memfn time re-find re-groups rand-int rand mod locking assert-valid-fdecl alias resolve ref deref refset swap! reset! set-validator! compare-and-set! alter-meta! reset-meta! commute get-validator alter ref-set ref-history-count ref-min-history ref-max-history ensure sync io! new next conj set! to-array future future-call into-array aset gen-class reduce map filter find empty hash-map hash-set sorted-map sorted-map-by sorted-set sorted-set-by vec vector seq flatten reverse assoc dissoc list disj get union difference intersection extend extend-type extend-protocol int nth delay count concat chunk chunk-buffer chunk-append chunk-first chunk-rest max min dec unchecked-inc-int unchecked-inc unchecked-dec-inc unchecked-dec unchecked-negate unchecked-add-int unchecked-add unchecked-subtract-int unchecked-subtract chunk-next chunk-cons chunked-seq? prn vary-meta lazy-seq spread list* str find-keyword keyword symbol gensym force rationalize" as Any,
                    ])

                    mode.relevance = 0
                    mode.starts = {
                        {
                            let mode = Mode()
                            mode.relevance = 0
                            mode.contains = [
                                /* circular ref: __ref_0 */ .mode(Mode()),
                                /* circular ref: __ref_1 */ .mode(Mode()),
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                /* circular ref: __ref_3 */ .mode(Mode()),
                                /* circular ref: __ref_4 */ .mode(Mode()),
                                /* circular ref: __ref_5 */ .mode(Mode()),
                                /* circular ref: __ref_6 */ .mode(Mode()),
                                /* circular ref: __ref_7 */ .mode(Mode()),
                                /* circular ref: __ref_8 */ .mode(Mode()),
                                /* circular ref: __ref_9 */ .mode(Mode()),
                                /* circular ref: __ref_10 */ .mode(Mode()),
                            ]
                            return mode
                        }()
                    }()
                    return mode
                }()),
                /* circular ref: __ref_11 */ .mode(Mode()),
            ]
            return mode
        }()),
        /* circular ref: __ref_2 */ .mode(Mode()),
        /* circular ref: __ref_3 */ .mode(Mode()),
        /* circular ref: __ref_4 */ .mode(Mode()),
        /* circular ref: __ref_5 */ .mode(Mode()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_9 */ .mode(Mode()),
    ]

    return lang
}

/// Register clojure language
public extension HighlightJS {
    func registerClojure() {
        registerLanguage("clojure", definition: clojureLanguage)
    }
}
