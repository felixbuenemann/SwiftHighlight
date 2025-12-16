// Auto-generated from highlight.js
// Language: twig

import Foundation

/// twig language definition
public func twigLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Twig"

    lang.aliases = ["craftcms"]
    lang.caseInsensitive = true
    lang.contains = [
        .mode(CommonModes.COMMENT("\\{#", "#\\}")),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("\\{%"), .regex("\\s*"), .regex("(?:apply|autoescape|block|cache|deprecated|do|embed|extends|filter|flush|for|form_theme|from|if|import|include|macro|sandbox|set|stopwatch|trans|trans_default_domain|transchoice|use|verbatim|with|endapply|endautoescape|endblock|endcache|enddeprecated|enddo|endembed|endextends|endfilter|endflush|endfor|endform_theme|endfrom|endif|endimport|endinclude|endmacro|endsandbox|endset|endstopwatch|endtrans|endtrans_default_domain|endtranschoice|enduse|endverbatim|endwith)")])
            mode.end = .regex("%\\}")
            mode.beginScope = .multi([1: "template-tag", 3: "name"])
            mode.endScope = .single("template-tag")
            mode.keywords = .simple("in")

            mode.relevance = 2
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\|(?=[A-Za-z_]+:?)")
                    mode.beginScope = .single("punctuation")
                    mode.relevance = 0
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[A-Za-z_]+:?")
                            mode.keywords = .array(["abs", "abbr_class", "abbr_method", "batch", "capitalize", "column", "convert_encoding", "country_name", "currency_name", "currency_symbol", "data_uri", "date", "date_modify", "default", "escape", "file_excerpt", "file_link", "file_relative", "filter", "first", "format", "format_args", "format_args_as_text", "format_currency", "format_date", "format_datetime", "format_file", "format_file_from_text", "format_number", "format_time", "html_to_markdown", "humanize", "inky_to_html", "inline_css", "join", "json_encode", "keys", "language_name", "last", "length", "locale_name", "lower", "map", "markdown", "markdown_to_html", "merge", "nl2br", "number_format", "raw", "reduce", "replace", "reverse", "round", "slice", "slug", "sort", "spaceless", "split", "striptags", "timezone_name", "title", "trans", "transchoice", "trim", "u|0", "upper", "url_encode", "yaml_dump", "yaml_encode"])

                            return mode
                        }()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.keywords = .grouped([
                        "name": ["absolute_url", "asset|0", "asset_version", "attribute", "block", "constant", "controller|0", "country_timezones", "csrf_token", "cycle", "date", "dump", "expression", "form|0", "form_end", "form_errors", "form_help", "form_label", "form_rest", "form_row", "form_start", "form_widget", "html_classes", "include", "is_granted", "logout_path", "logout_url", "max", "min", "parent", "path|0", "random", "range", "relative_path", "render", "render_esi", "source", "template_from_string", "url|0"] as Any,
                    ])

                    mode.beginKeywords = "absolute_url asset|0 asset_version attribute block constant controller|0 country_timezones csrf_token cycle date dump expression form|0 form_end form_errors form_help form_label form_rest form_row form_start form_widget html_classes include is_granted logout_path logout_url max min parent path|0 random range relative_path render render_esi source template_from_string url|0"
                    mode.relevance = 0
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\(")
                            mode.end = .regex("\\)")
                            mode.excludeBegin = true
                            mode.excludeEnd = true
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.scope = .single("string")
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
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\d+")
                                    mode.scope = .single("number")
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("\\{%"), .regex("\\s*"), .regex("(?:/[a-z_]+/)")])
            mode.end = .regex("%\\}")
            mode.beginScope = .multi([1: "template-tag", 3: "name"])
            mode.endScope = .single("template-tag")
            mode.keywords = .simple("in")

            mode.relevance = 1
            mode.contains = [
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{\\{")
            mode.end = .regex("\\}\\}")
            mode.scope = .single("template-variable")
            mode.contains = [
                .selfReference,
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register twig language
public extension HighlightJS {
    func registerTwig() {
        registerLanguage("twig", definition: twigLanguage)
    }
}
