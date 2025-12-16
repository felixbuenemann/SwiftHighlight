// Auto-generated from highlight.js
// Language: roboconf

import Foundation

/// roboconf language definition
public func roboconfLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Roboconf"

    lang.aliases = ["graph", "instances"]
    lang.caseInsensitive = true
    lang.keywords = .simple("import")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^facet [a-zA-Z-_][^\\n{]+\\{")
            mode.end = .regex("\\}")
            mode.keywords = .simple("facet")

            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-zA-Z-_]+")
                    mode.end = .regex("\\s*:")
                    mode.scope = .single("attribute")
                    mode.excludeEnd = true
                    mode.starts = {
                        {
                            let mode = Mode()
                            mode.end = .regex(";")
                            mode.relevance = 0
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\.[a-zA-Z-_]+")
                                    mode.scope = .single("variable")
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\(optional\\)")
                                    mode.scope = .single("keyword")
                                    return mode
                                }()),
                            ]
                            return mode
                        }()
                    }()
                    return mode
                }()),
                .mode(CommonModes.HASH_COMMENT_MODE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*instance of [a-zA-Z-_][^\\n{]+\\{")
            mode.end = .regex("\\}")
            mode.keywords = .simple("name count channels instance-data instance-state instance of")

            mode.illegal = .regex("\\S")
            mode.contains = [
                .selfReference,
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[a-zA-Z-_][^\\n{]+\\{")
            mode.end = .regex("\\}")
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        /* circular ref: __ref_1 */ .mode(Mode()),
    ]

    return lang
}

/// Register roboconf language
public extension HighlightJS {
    func registerRoboconf() {
        registerLanguage("roboconf", definition: roboconfLanguage)
    }
}
