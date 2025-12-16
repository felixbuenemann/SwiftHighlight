// Auto-generated from highlight.js
// Language: oxygene

import Foundation

/// oxygene language definition
public func oxygeneLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Oxygene"

    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": "abstract add and array as asc aspect assembly async begin break block by case class concat const copy constructor continue create default delegate desc distinct div do downto dynamic each else empty end ensure enum equals event except exit extension external false final finalize finalizer finally flags for forward from function future global group has if implementation implements implies in index inherited inline interface into invariants is iterator join locked locking loop matching method mod module namespace nested new nil not notify nullable of old on operator or order out override parallel params partial pinned private procedure property protected public queryable raise read readonly record reintroduce remove repeat require result reverse sealed select self sequence set shl shr skip static step soft take then to true try tuple type union unit unsafe until uses using var virtual raises volatile where while with write xor yield await mapped deprecated stdcall cdecl pascal register safecall overload library platform reference packed strict published autoreleasepool selector strong weak unretained" as Any,
    ])
    lang.illegal = .regex("(\"|\\$[G-Zg-z]|\\/\\*|</|=>|->)")
    lang.contains = [
        .mode(CommonModes.COMMENT("\\{", "\\}")),
        .mode(CommonModes.COMMENT("\\(\\*", "\\*\\)")),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("''")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(#\\d+)+")
            mode.scope = .single("string")
            return mode
        }()),
        .mode(CommonModes.NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[:;]")
            mode.keywords = .simple("function constructor|10 destructor|10 procedure|10 method|10")

            mode.beginKeywords = "function constructor destructor procedure method"
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_0" as Any,
                    ])

                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                /* circular ref: __ref_4 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(";")
            mode.scope = .single("punctuation")
            mode.relevance = 0
            return mode
        }()),
    ]

    return lang
}

/// Register oxygene language
public extension HighlightJS {
    func registerOxygene() {
        registerLanguage("oxygene", definition: oxygeneLanguage)
    }
}
