// Auto-generated from highlight.js
// Language: django

import Foundation

/// django language definition
public func djangoLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Django"

    lang.aliases = ["jinja"]
    lang.caseInsensitive = true
    lang.contains = [
        .mode(CommonModes.COMMENT("\\{%\\s*comment\\s*%\\}", "\\{%\\s*endcomment\\s*%\\}")),
        .mode(CommonModes.COMMENT("\\{#", "#\\}")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{%")
            mode.end = .regex("%\\}")
            mode.scope = .single("template-tag")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\w+")
                    mode.scope = .single("name")
                    mode.keywords = .grouped([
                        "name": "comment endcomment load templatetag ifchanged endifchanged if endif firstof for endfor ifnotequal endifnotequal widthratio extends include spaceless endspaceless regroup ifequal endifequal ssi now with cycle url filter endfilter debug block endblock else autoescape endautoescape csrf_token empty elif endwith static trans blocktrans endblocktrans get_static_prefix get_media_prefix plural get_current_language language get_available_languages get_current_language_bidi get_language_info get_language_info_list localize endlocalize localtime endlocaltime timezone endtimezone get_current_timezone verbatim" as Any,
                    ])

                    mode.starts = {
                        {
                            let mode = Mode()
                            mode.relevance = 0
                            mode.keywords = .simple("in by as")

                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\|[A-Za-z]+:?")
                                    mode.keywords = .grouped([
                                        "name": "truncatewords removetags linebreaksbr yesno get_digit timesince random striptags filesizeformat escape linebreaks length_is ljust rjust cut urlize fix_ampersands title floatformat capfirst pprint divisibleby add make_list unordered_list urlencode timeuntil urlizetrunc wordcount stringformat linenumbers slice date dictsort dictsortreversed default_if_none pluralize lower join center default truncatewords_html upper length phone2numeric wordwrap time addslashes slugify first escapejs force_escape iriencode last safe safeseq truncatechars localize unlocalize localtime utc timezone" as Any,
                                    ])

                                    mode.contains = [
                                        .mode(CommonModes.QUOTE_STRING_MODE()),
                                        .mode(CommonModes.APOS_STRING_MODE()),
                                    ]
                                    return mode
                                }()),
                            ]
                            return mode
                        }()
                    }()
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{\\{")
            mode.end = .regex("\\}\\}")
            mode.scope = .single("template-variable")
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register django language
public extension HighlightJS {
    func registerDjango() {
        registerLanguage("django", definition: djangoLanguage)
    }
}
