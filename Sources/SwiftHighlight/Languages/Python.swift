// Auto-generated from highlight.js
// Language: python

import Foundation

/// python language definition
public func pythonLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Python"

    lang.aliases = ["py", "gyp", "ipython"]
    lang.unicodeRegex = true
    lang.keywords = .grouped([
        "keyword": ["and", "as", "assert", "async", "await", "break", "case", "class", "continue", "def", "del", "elif", "else", "except", "finally", "for", "from", "global", "if", "import", "in", "is", "lambda", "match", "nonlocal|10", "not", "or", "pass", "raise", "return", "try", "while", "with", "yield"] as Any,
        "built_in": ["__import__", "abs", "all", "any", "ascii", "bin", "bool", "breakpoint", "bytearray", "bytes", "callable", "chr", "classmethod", "compile", "complex", "delattr", "dict", "dir", "divmod", "enumerate", "eval", "exec", "filter", "float", "format", "frozenset", "getattr", "globals", "hasattr", "hash", "help", "hex", "id", "input", "int", "isinstance", "issubclass", "iter", "len", "list", "locals", "map", "max", "memoryview", "min", "next", "object", "oct", "open", "ord", "pow", "print", "property", "range", "repr", "reversed", "round", "set", "setattr", "slice", "sorted", "staticmethod", "str", "sum", "super", "tuple", "type", "vars", "zip"] as Any,
        "literal": ["__debug__", "Ellipsis", "False", "None", "NotImplemented", "True"] as Any,
        "type": ["Any", "Callable", "Coroutine", "Dict", "List", "Literal", "Generic", "Optional", "Sequence", "Set", "Tuple", "Type", "Union"] as Any,
    ])
    lang.illegal = .regex("(<\\/|\\?)|=>")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^(>>>|\\.\\.\\.) ")
            mode.scope = .single("meta")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("number")
            mode.relevance = 0
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("(\\b([0-9](_?[0-9])*)|((\\b([0-9](_?[0-9])*))?\\.([0-9](_?[0-9])*)|\\b([0-9](_?[0-9])*)\\.))[eE][+-]?([0-9](_?[0-9])*)[jJ]?(?=\\b|and|as|assert|async|await|break|case|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|match|nonlocal|10|not|or|pass|raise|return|try|while|with|yield)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("((\\b([0-9](_?[0-9])*))?\\.([0-9](_?[0-9])*)|\\b([0-9](_?[0-9])*)\\.)[jJ]?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b([1-9](_?[0-9])*|0+(_?0)*)[lLjJ]?(?=\\b|and|as|assert|async|await|break|case|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|match|nonlocal|10|not|or|pass|raise|return|try|while|with|yield)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b0[bB](_?[01])+[lL]?(?=\\b|and|as|assert|async|await|break|case|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|match|nonlocal|10|not|or|pass|raise|return|try|while|with|yield)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b0[oO](_?[0-7])+[lL]?(?=\\b|and|as|assert|async|await|break|case|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|match|nonlocal|10|not|or|pass|raise|return|try|while|with|yield)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b0[xX](_?[0-9a-fA-F])+[lL]?(?=\\b|and|as|assert|async|await|break|case|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|match|nonlocal|10|not|or|pass|raise|return|try|while|with|yield)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b([0-9](_?[0-9])*)[jJ](?=\\b|and|as|assert|async|await|break|case|class|continue|def|del|elif|else|except|finally|for|from|global|if|import|in|is|lambda|match|nonlocal|10|not|or|pass|raise|return|try|while|with|yield)")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\bself\\b")
            mode.scope = .single("variable.language")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.beginKeywords = "if"
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\bor\\b")
            mode.scope = .single("keyword")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("([uU]|[bB]|[rR]|[bB][rR]|[rR][bB])?'''")
                    mode.end = .regex("'''")
                    mode.relevance = 10
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("([uU]|[bB]|[rR]|[bB][rR]|[rR][bB])?\"\"\"")
                    mode.end = .regex("\"\"\"")
                    mode.relevance = 10
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("([fF][rR]|[rR][fF]|[fF])'''")
                    mode.end = .regex("'''")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\{\\{")
                            mode.relevance = 0
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\{")
                            mode.end = .regex("\\}")
                            mode.scope = .single("subst")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_2" as Any,
                            ])

                            mode.illegal = .regex("#")
                            mode.contains = [
                                /* circular ref: __ref_3 */ .mode(Mode()),
                                /* circular ref: __ref_4 */ .mode(Mode()),
                                /* circular ref: __ref_1 */ .mode(Mode()),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("([fF][rR]|[rR][fF]|[fF])\"\"\"")
                    mode.end = .regex("\"\"\"")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_5 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("([uU]|[rR])'")
                    mode.end = .regex("'")
                    mode.relevance = 10
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("([uU]|[rR])\"")
                    mode.end = .regex("\"")
                    mode.relevance = 10
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("([bB]|[bB][rR]|[rR][bB])'")
                    mode.end = .regex("'")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("([bB]|[bB][rR]|[rR][bB])\"")
                    mode.end = .regex("\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("([fF][rR]|[rR][fF]|[fF])'")
                    mode.end = .regex("'")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_5 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("([fF][rR]|[rR][fF]|[fF])\"")
                    mode.end = .regex("\"")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_5 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(?=# type:)")
            mode.end = .regex("$")
            mode.scope = .single("comment")
            mode.keywords = .grouped([
                "__circularRef": "__ref_2" as Any,
            ])

            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("# type:")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("#")
                    mode.end = .regex("\\b\\B")
                    mode.endsWithParent = true
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("\\bdef"), .regex("\\s+"), .regexWithFlags(pattern: "[\\p{XID_Start}_]\\p{XID_Continue}*", flags: "u")])
            mode.scope = .multi([1: "keyword", 3: "title.function"])
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.scope = .single("params")
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\(\\s*\\)")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\(")
                            mode.end = .regex("\\)")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_2" as Any,
                            ])

                            mode.contains = [
                                .selfReference,
                                /* circular ref: __ref_1 */ .mode(Mode()),
                                /* circular ref: __ref_4 */ .mode(Mode()),
                                /* circular ref: __ref_3 */ .mode(Mode()),
                                /* circular ref: __ref_7 */ .mode(Mode()),
                            ]
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
            mode.scope = .multi([1: "keyword", 3: "title.class", 6: "title.class.inherited"])
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("\\bclass"), .regex("\\s+"), .regexWithFlags(pattern: "[\\p{XID_Start}_]\\p{XID_Continue}*", flags: "u"), .regex("\\s*"), .regex("\\(\\s*"), .regexWithFlags(pattern: "[\\p{XID_Start}_]\\p{XID_Continue}*", flags: "u"), .regex("\\s*\\)")])
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("\\bclass"), .regex("\\s+"), .regexWithFlags(pattern: "[\\p{XID_Start}_]\\p{XID_Continue}*", flags: "u")])
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[\\t ]*@")
            mode.end = .regex("(?=#)|$")
            mode.scope = .single("meta")
            mode.contains = [
                /* circular ref: __ref_4 */ .mode(Mode()),
                /* circular ref: __ref_8 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register python language
public extension HighlightJS {
    func registerPython() {
        registerLanguage("python", definition: pythonLanguage)
    }
}
