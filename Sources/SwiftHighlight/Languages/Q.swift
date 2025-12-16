// Auto-generated from highlight.js
// Language: q

import Foundation

/// q language definition
public func qLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Q"

    lang.aliases = ["k", "kdb"]
    lang.keywords = .grouped([
        "keyword": "do while select delete by update from" as Any,
        "literal": "0b 1b" as Any,
        "built_in": "neg not null string reciprocal floor ceiling signum mod xbar xlog and or each scan over prior mmu lsq inv md5 ltime gtime count first var dev med cov cor all any rand sums prds mins maxs fills deltas ratios avgs differ prev next rank reverse iasc idesc asc desc msum mcount mavg mdev xrank mmin mmax xprev rotate distinct group where flip type key til get value attr cut set upsert raze union inter except cross sv vs sublist enlist read0 read1 hopen hclose hdel hsym hcount peach system ltrim rtrim trim lower upper ssr view tables views cols xcols keys xkey xcol xasc xdesc fkeys meta lj aj aj0 ij pj asof uj ww wj wj1 fby xgroup ungroup ej save load rsave rload show csv parse eval min max avg wavg wsum sin cos tan sum" as Any,
        "type": "`float `double int `timestamp `timespan `datetime `time `boolean `symbol `char `byte `short `long `real `month `date `minute `second `guid" as Any,
    ])
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.C_NUMBER_MODE()),
    ]

    return lang
}

/// Register q language
public extension HighlightJS {
    func registerQ() {
        registerLanguage("q", definition: qLanguage)
    }
}
