// Auto-generated from highlight.js
// Language: cpp

import Foundation

/// cpp language definition
public func cppLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "C++"

    lang.aliases = ["cc", "c++", "h++", "hpp", "hh", "hxx", "cxx"]
    lang.keywords = .grouped([
        "type": ["bool", "char", "char16_t", "char32_t", "char8_t", "double", "float", "int", "long", "short", "void", "wchar_t", "unsigned", "signed", "const", "static"] as Any,
        "keyword": ["alignas", "alignof", "and", "and_eq", "asm", "atomic_cancel", "atomic_commit", "atomic_noexcept", "auto", "bitand", "bitor", "break", "case", "catch", "class", "co_await", "co_return", "co_yield", "compl", "concept", "const_cast|10", "consteval", "constexpr", "constinit", "continue", "decltype", "default", "delete", "do", "dynamic_cast|10", "else", "enum", "explicit", "export", "extern", "false", "final", "for", "friend", "goto", "if", "import", "inline", "module", "mutable", "namespace", "new", "noexcept", "not", "not_eq", "nullptr", "operator", "or", "or_eq", "override", "private", "protected", "public", "reflexpr", "register", "reinterpret_cast|10", "requires", "return", "sizeof", "static_assert", "static_cast|10", "struct", "switch", "synchronized", "template", "this", "thread_local", "throw", "transaction_safe", "transaction_safe_dynamic", "true", "try", "typedef", "typeid", "typename", "union", "using", "virtual", "volatile", "while", "xor", "xor_eq"] as Any,
        "literal": ["NULL", "false", "nullopt", "nullptr", "true"] as Any,
        "built_in": ["_Pragma"] as Any,
        "_type_hints": ["any", "auto_ptr", "barrier", "binary_semaphore", "bitset", "complex", "condition_variable", "condition_variable_any", "counting_semaphore", "deque", "false_type", "flat_map", "flat_set", "future", "imaginary", "initializer_list", "istringstream", "jthread", "latch", "lock_guard", "multimap", "multiset", "mutex", "optional", "ostringstream", "packaged_task", "pair", "promise", "priority_queue", "queue", "recursive_mutex", "recursive_timed_mutex", "scoped_lock", "set", "shared_future", "shared_lock", "shared_mutex", "shared_timed_mutex", "shared_ptr", "stack", "string_view", "stringstream", "timed_mutex", "thread", "true_type", "tuple", "unique_lock", "unique_ptr", "unordered_map", "unordered_multimap", "unordered_multiset", "unordered_set", "variant", "vector", "weak_ptr", "wstring", "wstring_view"] as Any,
    ])
    lang.illegal = .regex("</")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.keywords = .grouped([
                "__circularRef": "__ref_0" as Any,
            ])

            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("/\\b/(?!alignas|alignof|and|and_eq|asm|atomic_cancel|atomic_commit|atomic_noexcept|auto|bitand|bitor|break|case|catch|class|co_await|co_return|co_yield|compl|concept|const_cast|10|consteval|constexpr|constinit|continue|decltype|default|delete|do|dynamic_cast|10|else|enum|explicit|export|extern|false|final|for|friend|goto|if|import|inline|module|mutable|namespace|new|noexcept|not|not_eq|nullptr|operator|or|or_eq|override|private|protected|public|reflexpr|register|reinterpret_cast|10|requires|return|sizeof|static_assert|static_cast|10|struct|switch|synchronized|template|this|thread_local|throw|transaction_safe|transaction_safe_dynamic|true|try|typedef|typeid|typename|union|using|virtual|volatile|while|xor|xor_eq)[a-zA-Z]\\w*(?=(<[^<>]+>|)\\s*\\()")
                    mode.scope = .single("function.dispatch")
                    mode.keywords = .grouped([
                        "_hint": ["abort", "abs", "acos", "apply", "as_const", "asin", "atan", "atan2", "calloc", "ceil", "cerr", "cin", "clog", "cos", "cosh", "cout", "declval", "endl", "exchange", "exit", "exp", "fabs", "floor", "fmod", "forward", "fprintf", "fputs", "free", "frexp", "fscanf", "future", "invoke", "isalnum", "isalpha", "iscntrl", "isdigit", "isgraph", "islower", "isprint", "ispunct", "isspace", "isupper", "isxdigit", "labs", "launder", "ldexp", "log", "log10", "make_pair", "make_shared", "make_shared_for_overwrite", "make_tuple", "make_unique", "malloc", "memchr", "memcmp", "memcpy", "memset", "modf", "move", "pow", "printf", "putchar", "puts", "realloc", "scanf", "sin", "sinh", "snprintf", "sprintf", "sqrt", "sscanf", "std", "stderr", "stdin", "stdout", "strcat", "strchr", "strcmp", "strcpy", "strcspn", "strlen", "strncat", "strncmp", "strncpy", "strpbrk", "strrchr", "strspn", "strstr", "swap", "tan", "tanh", "terminate", "to_underlying", "tolower", "toupper", "vfprintf", "visit", "vprintf", "vsprintf"] as Any,
                    ])

                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("#\\s*[a-z]+\\b")
                    mode.end = .regex("$")
                    mode.scope = .single("meta")
                    mode.keywords = .grouped([
                        "keyword": "if else elif endif define undef warning error line pragma _Pragma ifdef ifndef include" as Any,
                    ])

                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\\\\\n")
                            mode.relevance = 0
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("string")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("(u8?|U|L)?\"")
                                    mode.end = .regex("\"")
                                    mode.contains = [
                                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                                    ]
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("(u8?|U|L)?'(\\\\(x[0-9A-Fa-f]{2}|u[0-9A-Fa-f]{4,8}|[0-7]{3}|\\S)|.)")
                                    mode.end = .regex("'")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("(?:u8?|U|L)?R\"([^()\\\\ ]{0,16})\\(")
                                    mode.end = .regex("\\)([^()\\\\ ]{0,16})\"")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("<.*?>")
                            mode.scope = .single("string")
                            return mode
                        }()),
                        .mode(CommonModes.COMMENT("//", "$")),
                        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\b[a-z\\d_]*_t\\b")
                    mode.scope = .single("type")
                    return mode
                }()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_2 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.scope = .single("number")
                    mode.relevance = 0
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("[+-]?(?:(?:[0-9](?:'?[0-9])*\\.(?:[0-9](?:'?[0-9])*)?|\\.[0-9](?:'?[0-9])*)(?:[Ee][+-]?[0-9](?:'?[0-9])*)?|[0-9](?:'?[0-9])*[Ee][+-]?[0-9](?:'?[0-9])*|0[Xx](?:[0-9A-Fa-f](?:'?[0-9A-Fa-f])*(?:\\.(?:[0-9A-Fa-f](?:'?[0-9A-Fa-f])*)?)?|\\.[0-9A-Fa-f](?:'?[0-9A-Fa-f])*)[Pp][+-]?[0-9](?:'?[0-9])*)(?:[Ff](?:16|32|64|128)?|(BF|bf)16|[Ll]|)")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("[+-]?\\b(?:0[Bb][01](?:'?[01])*|0[Xx][0-9A-Fa-f](?:'?[0-9A-Fa-f])*|0(?:'?[0-7])*|[1-9](?:'?[0-9])*)(?:[Uu](?:LL?|ll?)|[Uu][Zz]?|(?:LL?|ll?)[Uu]?|[Zz][Uu]|)")
                            return mode
                        }(),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.scope = .single("string")
                    mode.variants = [
                        {
                            let mode = Mode()
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            return mode
                        }(),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_0" as Any,
                    ])

                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_6 */ .mode(Mode()),
                        /* circular ref: __ref_7 */ .mode(Mode()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_9 */ .mode(Mode()),
                        /* circular ref: __ref_10 */ .mode(Mode()),
                        .selfReference,
                    ]
                    return mode
                }()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("=")
                    mode.end = .regex(";")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.end = .regex(";")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("((?!struct)(decltype\\(auto\\)|(?:[a-zA-Z_]\\w*::)?[a-zA-Z_]\\w*(?:<[^<>]+>)?)[\\*&\\s]+)+(?:[a-zA-Z_]\\w*::)?[a-zA-Z]\\w*\\s*\\(")
            mode.end = .regex("[{;=]")
            mode.scope = .single("function")
            mode.keywords = .grouped([
                "__circularRef": "__ref_0" as Any,
            ])

            mode.illegal = .regex("[^\\w\\s\\*&:<>.]")
            mode.excludeEnd = true
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("decltype\\(auto\\)")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_0" as Any,
                    ])

                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("(?:[a-zA-Z_]\\w*::)?[a-zA-Z]\\w*\\s*\\(")
                    mode.relevance = 0
                    mode.returnBegin = true
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("(?:[a-zA-Z_]\\w*::)?[a-zA-Z]\\w*")
                            mode.scope = .single("title")
                            mode.relevance = 0
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("::")
                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex(":")
                    mode.endsWithParent = true
                    mode.contains = [
                        /* circular ref: __ref_10 */ .mode(Mode()),
                        /* circular ref: __ref_9 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex(",")
                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_0" as Any,
                    ])

                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_10 */ .mode(Mode()),
                        /* circular ref: __ref_9 */ .mode(Mode()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\(")
                            mode.end = .regex("\\)")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_0" as Any,
                            ])

                            mode.relevance = 0
                            mode.contains = [
                                .selfReference,
                                /* circular ref: __ref_1 */ .mode(Mode()),
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                /* circular ref: __ref_10 */ .mode(Mode()),
                                /* circular ref: __ref_9 */ .mode(Mode()),
                                /* circular ref: __ref_8 */ .mode(Mode()),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_8 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_7 */ .mode(Mode()),
            ]
            return mode
        }()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_1 */ .mode(Mode()),
        /* circular ref: __ref_2 */ .mode(Mode()),
        /* circular ref: __ref_9 */ .mode(Mode()),
        /* circular ref: __ref_10 */ .mode(Mode()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(deque|list|queue|priority_queue|pair|stack|vector|map|set|bitset|multiset|multimap|unordered_map|unordered_set|unordered_multiset|unordered_multimap|array|tuple|optional|variant|function|flat_map|flat_set)\\s*<(?!<)")
            mode.end = .regex(">")
            mode.keywords = .grouped([
                "__circularRef": "__ref_0" as Any,
            ])

            mode.contains = [
                .selfReference,
                /* circular ref: __ref_8 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z]\\w*::")
            mode.keywords = .grouped([
                "__circularRef": "__ref_0" as Any,
            ])

            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("\\b(?:enum(?:\\s+(?:class|struct))?|class|struct|union)"), .regex("\\s+"), .regex("\\w+")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
    ]

    return lang
}

/// Register cpp language
public extension HighlightJS {
    func registerCpp() {
        registerLanguage("cpp", definition: cppLanguage)
    }
}
