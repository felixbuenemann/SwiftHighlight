// Auto-generated from highlight.js
// Language: gams

import Foundation

/// gams language definition
public func gamsLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "GAMS"

    lang.aliases = ["gms"]
    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": "abort acronym acronyms alias all and assign binary card diag display else eq file files for free ge gt if integer le loop lt maximizing minimizing model models ne negative no not option options or ord positive prod put putpage puttl repeat sameas semicont semiint smax smin solve sos1 sos2 sum system table then until using while xor yes" as Any,
        "literal": "eps inf na" as Any,
        "built_in": "abs arccos arcsin arctan arctan2 Beta betaReg binomial ceil centropy cos cosh cvPower div div0 eDist entropy errorf execSeed exp fact floor frac gamma gammaReg log logBeta logGamma log10 log2 mapVal max min mod ncpCM ncpF ncpVUpow ncpVUsin normal pi poly power randBinomial randLinear randTriangle round rPower sigmoid sign signPower sin sinh slexp sllog10 slrec sqexp sqlog10 sqr sqrec sqrt tan tanh trunc uniform uniformInt vcPower bool_and bool_eqv bool_imp bool_not bool_or bool_xor ifThen rel_eq rel_ge rel_gt rel_le rel_lt rel_ne gday gdow ghour gleap gmillisec gminute gmonth gsecond gyear jdate jnow jstart jtime errorLevel execError gamsRelease gamsVersion handleCollect handleDelete handleStatus handleSubmit heapFree heapLimit heapSize jobHandle jobKill jobStatus jobTerminate licenseLevel licenseStatus maxExecError sleep timeClose timeComp timeElapsed timeExec timeStart" as Any,
    ])
    lang.contains = [
        .mode(CommonModes.COMMENT("^\\$ontext", "^\\$offtext")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\$[a-z0-9]+")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("^\\$[a-z0-9]+")
                    mode.scope = .single("keyword")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode(CommonModes.COMMENT("^\\*", "$")),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.end = .regex(";")
            mode.beginKeywords = "set sets parameter parameters variable variables scalar scalars equation equations"
            mode.contains = [
                .mode(CommonModes.COMMENT("^\\*", "$")),
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("/")
                    mode.end = .regex("/")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_4" as Any,
                    ])

                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("comment")
                            mode.illegal = .regex("\\n")
                            mode.contains = [
                                .mode(CommonModes.BACKSLASH_ESCAPE()),
                            ]
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("'")
                                    mode.end = .regex("'")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\"")
                                    mode.end = .regex("\"")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        .mode(CommonModes.C_NUMBER_MODE()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-z][a-z0-9_]*(\\([a-z0-9_, ]*\\))?[ \\t]+")
                    mode.end = .regex("$")
                    mode.endsWithParent = true
                    mode.excludeBegin = true
                    mode.contains = [
                        /* circular ref: __ref_5 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("/[a-z0-9&#*=?@\\\\><:,()$[\\]_.{}!+%^-]+/(?:/[ ]+//[a-z0-9&#*=?@\\\\><:,()$[\\]_.{}!+%^-]+/)*")
                            mode.scope = .single("comment")
                            mode.relevance = 0
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
            mode.end = .regex(";")
            mode.beginKeywords = "table"
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.end = .regex("$")
                    mode.beginKeywords = "table"
                    mode.contains = [
                        /* circular ref: __ref_7 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                .mode(CommonModes.COMMENT("^\\*", "$")),
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                /* circular ref: __ref_8 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[a-z][a-z0-9_,\\-+' ()$]+\\.{2}")
            mode.scope = .single("function")
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("^[a-z0-9_]+")
                    mode.scope = .single("title")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.scope = .single("symbol")
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("=[lgenxc]=")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\$")
                            return mode
                        }(),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_9 */ .mode(Mode()),
    ]

    return lang
}

/// Register gams language
public extension HighlightJS {
    func registerGams() {
        registerLanguage("gams", definition: gamsLanguage)
    }
}
