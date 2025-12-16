// Auto-generated from highlight.js
// Language: nginx

import Foundation

/// nginx language definition
public func nginxLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Nginx config"

    lang.aliases = ["nginxconf"]
    lang.illegal = .regex("[^\\s\\}\\{]")
    lang.contains = [
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.end = .regex(";|\\{")
            mode.keywords = .grouped([
                "section": "upstream location" as Any,
            ])

            mode.beginKeywords = "upstream location"
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("variable")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\$\\d+")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\$\\{\\w+\\}")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("/[$@]/[a-zA-Z_]\\w*")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("\"")
                            mode.end = .regex("\"")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("'")
                            mode.end = .regex("'")
                            return mode
                        }(),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("([a-z]+):/")
                    mode.end = .regex("\\s")
                    mode.endsWithParent = true
                    mode.excludeEnd = true
                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.scope = .single("regexp")
                    mode.contains = [
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                    ]
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\s\\^")
                            mode.end = .regex("\\s|\\{|;")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("~\\*?\\s+")
                            mode.end = .regex("\\s|\\{|;")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\*(\\.[a-z\\-]+)+")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("([a-z\\-]+\\.)+\\*")
                            return mode
                        }(),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\b\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}(:\\d{1,5})?\\b")
                    mode.scope = .single("number")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\b\\d+[kKmMgGdshdwy]?\\b")
                    mode.scope = .single("number")
                    mode.relevance = 0
                    return mode
                }()),
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z_]\\w*(?=\\s+\\{)")
            mode.scope = .single("section")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(?=[a-zA-Z_]\\w*\\s)")
            mode.end = .regex(";|\\{")
            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-zA-Z_]\\w*")
                    mode.scope = .single("attribute")
                    mode.starts = {
                        {
                            let mode = Mode()
                            mode.relevance = 0
                            mode.keywords = .grouped([
                                "literal": ["on", "off", "yes", "no", "true", "false", "none", "blocked", "debug", "info", "notice", "warn", "error", "crit", "select", "break", "last", "permanent", "redirect", "kqueue", "rtsig", "epoll", "poll", "/dev/poll"] as Any,
                            ])

                            mode.contains = [
                                /* circular ref: __ref_0 */ .mode(Mode()),
                                /* circular ref: __ref_3 */ .mode(Mode()),
                                /* circular ref: __ref_4 */ .mode(Mode()),
                                /* circular ref: __ref_5 */ .mode(Mode()),
                                /* circular ref: __ref_6 */ .mode(Mode()),
                                /* circular ref: __ref_7 */ .mode(Mode()),
                                /* circular ref: __ref_1 */ .mode(Mode()),
                            ]
                            return mode
                        }()
                    }()
                    return mode
                }()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register nginx language
public extension HighlightJS {
    func registerNginx() {
        registerLanguage("nginx", definition: nginxLanguage)
    }
}
