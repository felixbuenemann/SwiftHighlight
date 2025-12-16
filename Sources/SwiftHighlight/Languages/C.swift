// Auto-generated from highlight.js
// Language: c

import Foundation

/// c language definition
public func cLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "C"

    lang.aliases = ["h"]
    lang.keywords = .grouped([
        "keyword": ["asm", "auto", "break", "case", "continue", "default", "do", "else", "enum", "extern", "for", "fortran", "goto", "if", "inline", "register", "restrict", "return", "sizeof", "typeof", "typeof_unqual", "struct", "switch", "typedef", "union", "volatile", "while", "_Alignas", "_Alignof", "_Atomic", "_Generic", "_Noreturn", "_Static_assert", "_Thread_local", "alignas", "alignof", "noreturn", "static_assert", "thread_local", "_Pragma"] as Any,
        "type": ["float", "double", "signed", "unsigned", "int", "short", "long", "char", "void", "_Bool", "_BitInt", "_Complex", "_Imaginary", "_Decimal32", "_Decimal64", "_Decimal96", "_Decimal128", "_Decimal64x", "_Decimal128x", "_Float16", "_Float32", "_Float64", "_Float128", "_Float32x", "_Float64x", "_Float128x", "const", "static", "constexpr", "complex", "bool", "imaginary"] as Any,
        "literal": "true false NULL" as Any,
        "built_in": "std string wstring cin cout cerr clog stdin stdout stderr stringstream istringstream ostringstream auto_ptr deque list queue stack vector map set pair bitset multiset multimap unordered_set unordered_map unordered_multiset unordered_multimap priority_queue make_pair array shared_ptr abort terminate abs acos asin atan2 atan calloc ceil cosh cos exit exp fabs floor fmod fprintf fputs free frexp fscanf future isalnum isalpha iscntrl isdigit isgraph islower isprint ispunct isspace isupper isxdigit tolower toupper labs ldexp log10 log malloc realloc memchr memcmp memcpy memset modf pow printf putchar puts scanf sinh sin snprintf sprintf sqrt sscanf strcat strchr strcmp strcpy strcspn strlen strncat strncmp strncpy strpbrk strrchr strspn strstr tanh tan vfprintf vprintf vsprintf endl initializer_list unique_ptr" as Any,
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
                    mode.begin = .regex("#\\s*[a-z]+\\b")
                    mode.end = .regex("$")
                    mode.scope = .single("meta")
                    mode.keywords = .grouped([
                        "keyword": "if else elif endif define undef warning error line pragma _Pragma ifdef ifndef elifdef elifndef include" as Any,
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
                    mode.scope = .single("type")
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\b[a-z\\d_]*_t\\b")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\batomic_[a-z]{3,6}\\b")
                            return mode
                        }(),
                    ]
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
                            mode.begin = .regex("\\b(0b[01']+)")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("(-?)\\b([\\d']+(\\.[\\d']*)?|\\.[\\d']+)((ll|LL|l|L)(u|U)?|(u|U)(ll|LL|l|L)?|f|F|b|B)")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("(-?)\\b(0[xX][a-fA-F0-9]+(?:'[a-fA-F0-9]+)*(?:\\.[a-fA-F0-9]*(?:'[a-fA-F0-9]*)*)?(?:[pP][-+]?[0-9]+)?(l|L)?(u|U)?)")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("(-?)\\b\\d+(?:'\\d+)*(?:\\.\\d*(?:'\\d*)*)?(?:[eE][-+]?\\d+)?")
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
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                        /* circular ref: __ref_9 */ .mode(Mode()),
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
            mode.begin = .regex("((decltype\\(auto\\)|(?:[a-zA-Z_]\\w*::)?[a-zA-Z_]\\w*(?:<[^<>]+>)?)[\\*&\\s]+)+(?:[a-zA-Z_]\\w*::)?[a-zA-Z]\\w*\\s*\\(")
            mode.end = .regex("[{;=]")
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
                            mode.scope = .single("title.function")
                            mode.relevance = 0
                            return mode
                        }()),
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
                        /* circular ref: __ref_9 */ .mode(Mode()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                        /* circular ref: __ref_7 */ .mode(Mode()),
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
                                /* circular ref: __ref_9 */ .mode(Mode()),
                                /* circular ref: __ref_8 */ .mode(Mode()),
                                /* circular ref: __ref_7 */ .mode(Mode()),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_7 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_6 */ .mode(Mode()),
            ]
            return mode
        }()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_1 */ .mode(Mode()),
        /* circular ref: __ref_2 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_9 */ .mode(Mode()),
        /* circular ref: __ref_6 */ .mode(Mode()),
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
            mode.end = .regex("[{;:<>=]")
            mode.scope = .single("class")
            mode.beginKeywords = "enum class struct union"
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.beginKeywords = "final class struct"
                    return mode
                }()),
                .mode(CommonModes.TITLE_MODE()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register c language
public extension HighlightJS {
    func registerC() {
        registerLanguage("c", definition: cLanguage)
    }
}
