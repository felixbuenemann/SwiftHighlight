// Auto-generated from highlight.js
// Language: applescript

import Foundation

/// applescript language definition
public func applescriptLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "AppleScript"

    lang.aliases = ["osascript"]
    lang.keywords = .grouped([
        "keyword": "about above after against and around as at back before beginning behind below beneath beside between but by considering contain contains continue copy div does eighth else end equal equals error every exit fifth first for fourth from front get given global if ignoring in into is it its last local me middle mod my ninth not of on onto or over prop property put ref reference repeat returning script second set seventh since sixth some tell tenth that the|0 then third through thru timeout times to transaction try until where while whose with without" as Any,
        "literal": "AppleScript false linefeed return pi quote result space tab true" as Any,
        "built_in": "alias application boolean class constant date file integer list number real record string text activate beep count delay launch log offset read round run say summarize write character characters contents day frontmost id item length month name|0 paragraph paragraphs rest reverse running time version weekday word words year" as Any,
    ])
    lang.illegal = .regex("\\/\\/|->|=>|\\[\\[")
    lang.contains = [
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/\\b/(?:/clipboard info/|/the clipboard/|/info for/|/list (disks|folder)/|/mount volume/|/path to/|/(close|open for) access/|/(get|set) eof/|/current date/|/do shell script/|/get volume settings/|/random number/|/set volume/|/system attribute/|/system info/|/time to GMT/|/(load|run|store) script/|/scripting components/|/ASCII (character|number)/|/localized string/|/choose (application|color|file|file name|folder|from list|remote application|URL)/|/display (alert|dialog)/)/\\b/")
            mode.scope = .single("built_in")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*return\\b")
            mode.scope = .single("built_in")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(text item delimiters|current application|missing value)\\b")
            mode.scope = .single("literal")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/\\b/(?:/apart from/|/aside from/|/instead of/|/out of/|/greater than/|/isn't|(doesn't|does not) (equal|come before|come after|contain)/|/(greater|less) than( or equal)?/|/(starts?|ends|begins?) with/|/contained by/|/comes (before|after)/|/a (ref|reference)/|/POSIX (file|path)/|/(date|time) string/|/quoted form/)/\\b/")
            mode.scope = .single("keyword")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.beginKeywords = "on"
            mode.illegal = .regex("[${=;\\n]")
            mode.contains = [
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.contains = [
                        .selfReference,
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode(CommonModes.COMMENT("--", "$")),
        .mode(CommonModes.COMMENT("\\(\\*", "\\*\\)")),
        .mode(CommonModes.HASH_COMMENT_MODE()),
    ]

    return lang
}

/// Register applescript language
public extension HighlightJS {
    func registerApplescript() {
        registerLanguage("applescript", definition: applescriptLanguage)
    }
}
