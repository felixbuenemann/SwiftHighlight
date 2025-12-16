// Auto-generated from highlight.js
// Language: handlebars

import Foundation

/// handlebars language definition
public func handlebarsLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Handlebars"

    lang.aliases = ["hbs", "html.hbs", "html.handlebars", "htmlbars"]
    lang.caseInsensitive = true
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\\\{\\{")
            mode.skip = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\\\\\\\(?=\\{\\{)")
            mode.skip = true
            return mode
        }()),
        .mode(CommonModes.COMMENT("\\{\\{!--", "--\\}\\}")),
        .mode(CommonModes.COMMENT("\\{\\{!", "\\}\\}")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{\\{\\{\\{(?!\\/)")
            mode.end = .regex("\\}\\}\\}\\}")
            mode.scope = .single("template-tag")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("(?:\\.|\\.\\/|\\/)?(?:/\"\"|\"[^\"]+\"/|/''|'[^']+'/|/\\[\\]|\\[[^\\]]+\\]/|/[^\\s!\"#%&'()*+,.\\/;<=>@\\[\\\\\\]^`{|}~]+/)(?:/(\\.|\\/)/(?:/\"\"|\"[^\"]+\"/|/''|'[^']+'/|/\\[\\]|\\[[^\\]]+\\]/|/[^\\s!\"#%&'()*+,.\\/;<=>@\\[\\\\\\]^`{|}~]+/))*")
                    mode.scope = .single("name")
                    mode.keywords = .grouped([
                        "built_in": ["action", "bindattr", "collection", "component", "concat", "debugger", "each", "each-in", "get", "hash", "if", "in", "input", "link-to", "loc", "log", "lookup", "mut", "outlet", "partial", "query-params", "render", "template", "textarea", "unbound", "unless", "view", "with", "yield"] as Any,
                    ])

                    mode.starts = {
                        {
                            let mode = Mode()
                            mode.end = .regex("\\}\\}")
                            mode.contains = [
                                .mode(CommonModes.NUMBER_MODE()),
                                .mode(CommonModes.QUOTE_STRING_MODE()),
                                .mode(CommonModes.APOS_STRING_MODE()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("as\\s+\\|")
                                    mode.end = .regex("\\|")
                                    mode.keywords = .grouped([
                                        "keyword": "as" as Any,
                                    ])

                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\\w+")
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("(/\\[\\]|\\[[^\\]]+\\]/|/[^\\s!\"#%&'()*+,.\\/;<=>@\\[\\\\\\]^`{|}~]+/)(?==)")
                                    mode.scope = .single("attr")
                                    mode.relevance = 0
                                    mode.starts = {
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("=")
                                            mode.end = .regex("=")
                                            return mode
                                        }()
                                    }()
                                    return mode
                                }()),
                                /* circular ref: __ref_6 */ .mode(Mode()),
                                /* circular ref: __ref_7 */ .mode(Mode()),
                            ]
                            return mode
                        }()
                    }()
                    return mode
                }()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("\\{\\{\\{\\{\\/")
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{\\{\\{\\{\\/")
            mode.end = .regex("\\}\\}\\}\\}")
            mode.scope = .single("template-tag")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("(?:\\.|\\.\\/|\\/)?(?:/\"\"|\"[^\"]+\"/|/''|'[^']+'/|/\\[\\]|\\[[^\\]]+\\]/|/[^\\s!\"#%&'()*+,.\\/;<=>@\\[\\\\\\]^`{|}~]+/)(?:/(\\.|\\/)/(?:/\"\"|\"[^\"]+\"/|/''|'[^']+'/|/\\[\\]|\\[[^\\]]+\\]/|/[^\\s!\"#%&'()*+,.\\/;<=>@\\[\\\\\\]^`{|}~]+/))*")
                    mode.scope = .single("name")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_3" as Any,
                    ])

                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{\\{#")
            mode.end = .regex("\\}\\}")
            mode.scope = .single("template-tag")
            mode.contains = [
                /* circular ref: __ref_8 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{\\{(?=else\\}\\})")
            mode.end = .regex("\\}\\}")
            mode.scope = .single("template-tag")
            mode.keywords = .simple("else")

            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{\\{(?=else if)")
            mode.end = .regex("\\}\\}")
            mode.scope = .single("template-tag")
            mode.keywords = .simple("else if")

            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{\\{\\/")
            mode.end = .regex("\\}\\}")
            mode.scope = .single("template-tag")
            mode.contains = [
                /* circular ref: __ref_9 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\{\\{\\{")
            mode.end = .regex("\\}\\}\\}")
            mode.scope = .single("template-variable")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("(?:\\.|\\.\\/|\\/)?(?:/\"\"|\"[^\"]+\"/|/''|'[^']+'/|/\\[\\]|\\[[^\\]]+\\]/|/[^\\s!\"#%&'()*+,.\\/;<=>@\\[\\\\\\]^`{|}~]+/)(?:/(\\.|\\/)/(?:/\"\"|\"[^\"]+\"/|/''|'[^']+'/|/\\[\\]|\\[[^\\]]+\\]/|/[^\\s!\"#%&'()*+,.\\/;<=>@\\[\\\\\\]^`{|}~]+/))*")
                    mode.scope = .single("name")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_3" as Any,
                    ])

                    mode.starts = {
                        {
                            let mode = Mode()
                            mode.end = .regex("\\}\\}")
                            mode.contains = [
                                /* circular ref: __ref_0 */ .mode(Mode()),
                                /* circular ref: __ref_1 */ .mode(Mode()),
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                /* circular ref: __ref_4 */ .mode(Mode()),
                                /* circular ref: __ref_5 */ .mode(Mode()),
                                /* circular ref: __ref_6 */ .mode(Mode()),
                                /* circular ref: __ref_7 */ .mode(Mode()),
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
                /* circular ref: __ref_10 */ .mode(Mode()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register handlebars language
public extension HighlightJS {
    func registerHandlebars() {
        registerLanguage("handlebars", definition: handlebarsLanguage)
    }
}
