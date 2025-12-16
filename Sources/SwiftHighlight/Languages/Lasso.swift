// Auto-generated from highlight.js
// Language: lasso

import Foundation

/// lasso language definition
public func lassoLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Lasso"

    lang.aliases = ["ls", "lassoscript"]
    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "literal": "true false none minimal full all void and or not bw nbw ew new cn ncn lt lte gt gte eq neq rx nrx ft" as Any,
        "built_in": "array date decimal duration integer map pair string tag xml null boolean bytes keyword list locale queue set stack staticarray local var variable global data self inherited currentcapture givenblock" as Any,
        "keyword": "cache database_names database_schemanames database_tablenames define_tag define_type email_batch encode_set html_comment handle handle_error header if inline iterate ljax_target link link_currentaction link_currentgroup link_currentrecord link_detail link_firstgroup link_firstrecord link_lastgroup link_lastrecord link_nextgroup link_nextrecord link_prevgroup link_prevrecord log loop namespace_using output_none portal private protect records referer referrer repeating resultset rows search_args search_arguments select sort_args sort_arguments thread_atomic value_list while abort case else fail_if fail_ifnot fail if_empty if_false if_null if_true loop_abort loop_continue loop_count params params_up return return_value run_children soap_definetag soap_lastrequest soap_lastresponse tag_name ascending average by define descending do equals frozen group handle_failure import in into join let match max min on order parent protected provide public require returnhome skip split_thread sum take thread to trait type where with yield yieldhome" as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\]|\\?>")
            mode.scope = .single("meta")
            mode.relevance = 0
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("\\[|<\\?(lasso(script)?|=)")
                    mode.relevance = 0
                    mode.contains = [
                        .mode(CommonModes.COMMENT("<!--", "-->")),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[noprocess\\]")
            mode.scope = .single("meta")
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("\\[/noprocess\\]")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[/noprocess|<\\?(lasso(script)?|=)")
            mode.scope = .single("meta")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[no_square_brackets")
            mode.scope = .single("meta")
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("\\[/no_square_brackets\\]")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_1" as Any,
                    ])

                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\]|\\?>")
                            mode.scope = .single("meta")
                            mode.relevance = 0
                            mode.starts = {
                                {
                                    let mode = Mode()
                                    mode.end = .regex("\\[noprocess\\]|<\\?(lasso(script)?|=)")
                                    mode.contains = [
                                        /* circular ref: __ref_0 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()
                            }()
                            return mode
                        }()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        .mode(CommonModes.C_LINE_COMMENT_MODE()),
                        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
                        .mode(CommonModes.C_NUMBER_MODE()),
                        .mode(CommonModes.APOS_STRING_MODE()),
                        .mode(CommonModes.QUOTE_STRING_MODE()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("`")
                            mode.end = .regex("`")
                            mode.scope = .single("string")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("[#$][a-zA-Z_][\\w.]*")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("#")
                                    mode.end = .regex("\\d+")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("::\\s*")
                            mode.end = .regex("[a-zA-Z_][\\w.]*")
                            mode.scope = .single("type")
                            mode.illegal = .regex("\\W")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("params")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("-(?!infinity)[a-zA-Z_][\\w.]*")
                                    mode.relevance = 0
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("(\\.\\.\\.)")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("(->|\\.)\\s*")
                            mode.relevance = 0
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("'[a-zA-Z_][\\w.]*'")
                                    mode.scope = .single("symbol")
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.end = .regex("\\(|=>")
                            mode.scope = .single("class")
                            mode.beginKeywords = "define"
                            mode.returnEnd = true
                            mode.contains = [
                                .mode(CommonModes.TITLE_MODE()),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[")
            mode.scope = .single("meta")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^#!")
            mode.end = .regex("lasso9$")
            mode.scope = .single("meta")
            mode.relevance = 10
            return mode
        }()),
        /* circular ref: __ref_4 */ .mode(Mode()),
        /* circular ref: __ref_5 */ .mode(Mode()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_9 */ .mode(Mode()),
        /* circular ref: __ref_10 */ .mode(Mode()),
        /* circular ref: __ref_11 */ .mode(Mode()),
        /* circular ref: __ref_12 */ .mode(Mode()),
        /* circular ref: __ref_13 */ .mode(Mode()),
        /* circular ref: __ref_14 */ .mode(Mode()),
    ]

    return lang
}

/// Register lasso language
public extension HighlightJS {
    func registerLasso() {
        registerLanguage("lasso", definition: lassoLanguage)
    }
}
