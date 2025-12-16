// Auto-generated from highlight.js
// Language: wren

import Foundation

/// wren language definition
public func wrenLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Wren"

    lang.keywords = .grouped([
        "keyword": ["as", "break", "class", "construct", "continue", "else", "for", "foreign", "if", "import", "in", "is", "return", "static", "var", "while"] as Any,
        "variable.language": ["this", "super"] as Any,
        "literal": ["true", "false", "null"] as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.scope = .single("comment")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("#!?"), .regex("[A-Za-z_]+(?=\\()")])
                    mode.end = .regex("\\)")
                    mode.keywords = .grouped([
                        "literal": ["true", "false", "null"] as Any,
                    ])

                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("#!?"), .regex("[A-Za-z_]+")])
                    mode.end = .regex("$")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("%\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("subst")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\b[A-Z]+[a-z]+([A-Z]+[a-z]+)*")
                            mode.scope = .single("title.class")
                            mode.keywords = .grouped([
                                "_": ["Bool", "Class", "Fiber", "Fn", "List", "Map", "Null", "Num", "Object", "Range", "Sequence", "String", "System"] as Any,
                            ])

                            mode.relevance = 0
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("/\\b(?!(if|while|for|else|super)\\b)//[a-zA-Z]\\w*//(?=\\s*[({])/")
                            mode.scope = .single("title.function")
                            mode.relevance = 0
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("/\\b_//[a-zA-Z]\\w*/")
                            mode.scope = .single("variable")
                            mode.relevance = 0
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("(?:-|~|/\\*/|%|/\\.\\.\\./|/\\.\\./|/\\+/|<<|>>|>=|<=|<|>|/\\^/|/!=/|/!/|/\\bis\\b/|==|&&|&|/\\|\\|/|/\\|/|/\\?:/|=)")
                            mode.scope = .single("operator")
                            mode.relevance = 0
                            return mode
                        }()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.scope = .single("char.escape")
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\\\\\\\|\\\\[\"0%abefnrtv]")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\\\x[0-9A-F]{2}")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\\\u[0-9A-F]{4}")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\\\U[0-9A-F]{8}")
                            return mode
                        }(),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"\"\"")
            mode.end = .regex("\"\"\"")
            mode.scope = .single("string")
            return mode
        }()),
        .mode(CommonModes.COMMENT("\\/\\*\\*", "\\*\\/")),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        /* circular ref: __ref_2 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.scope = .multi([2: "title.class", 4: "title.class.inherited"])
            mode.keywords = .array(["as", "break", "class", "construct", "continue", "else", "for", "foreign", "if", "import", "in", "is", "return", "static", "var", "while"])

            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("class\\s+"), .regex("[a-zA-Z]\\w*"), .regex("\\s+is\\s+"), .regex("[a-zA-Z]\\w*")])
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("class\\s+"), .regex("[a-zA-Z]\\w*")])
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("[a-zA-Z]\\w*"), .regex("\\s*"), .regex("="), .regex("\\s*"), .regex("\\("), .regex("[a-zA-Z]\\w*"), .regex("\\)\\s*\\{")])
            mode.scope = .multi([1: "title.function", 3: "operator", 6: "params"])
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(?:/\\b(?!(if|while|for|else|super)\\b)//[a-zA-Z]\\w*/|(?:-|~|/\\*/|%|/\\.\\.\\./|/\\.\\./|/\\+/|<<|>>|>=|<=|<|>|/\\^/|/!=/|/!/|/\\bis\\b/|==|&&|&|/\\|\\|/|/\\|/|/\\?:/|=))/(?=\\s*\\([^)]+\\)\\s*\\{)/")
            mode.scope = .single("title.function")
            mode.starts = {
                {
                    let mode = Mode()
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\(")
                            mode.end = .regex("\\)")
                            mode.contains = [
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("[a-zA-Z]\\w*")
                                    mode.scope = .single("params")
                                    mode.relevance = 0
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        /* circular ref: __ref_3 */ .mode(Mode()),
        /* circular ref: __ref_4 */ .mode(Mode()),
        /* circular ref: __ref_5 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/\\./(?=[a-zA-Z]\\w*)")
            mode.end = .regex("[a-zA-Z]\\w*")
            mode.scope = .single("property")
            mode.relevance = 0
            mode.excludeBegin = true
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(?!as|break|class|construct|continue|else|for|foreign|if|import|in|is|return|static|var|while|this|super|true|false|null\\b)/[a-zA-Z_]\\w*(?:[?!]|\\b)/")
            mode.scope = .single("variable")
            mode.relevance = 0
            return mode
        }()),
    ]

    return lang
}

/// Register wren language
public extension HighlightJS {
    func registerWren() {
        registerLanguage("wren", definition: wrenLanguage)
    }
}
