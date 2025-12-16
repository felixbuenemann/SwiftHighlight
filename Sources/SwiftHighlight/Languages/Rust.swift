// Auto-generated from highlight.js
// Language: rust

import Foundation

/// rust language definition
public func rustLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Rust"

    lang.aliases = ["rs"]
    lang.keywords = .grouped([
        "type": ["i8", "i16", "i32", "i64", "i128", "isize", "u8", "u16", "u32", "u64", "u128", "usize", "f32", "f64", "str", "char", "bool", "Box", "Option", "Result", "String", "Vec"] as Any,
        "keyword": ["abstract", "as", "async", "await", "become", "box", "break", "const", "continue", "crate", "do", "dyn", "else", "enum", "extern", "false", "final", "fn", "for", "if", "impl", "in", "let", "loop", "macro", "match", "mod", "move", "mut", "override", "priv", "pub", "ref", "return", "[object Object]", "Self", "static", "struct", "super", "trait", "true", "try", "type", "typeof", "union", "unsafe", "unsized", "use", "virtual", "where", "while", "yield"] as Any,
        "literal": ["true", "false", "Some", "None", "Ok", "Err"] as Any,
        "built_in": ["drop ", "Copy", "Send", "Sized", "Sync", "Drop", "Fn", "FnMut", "FnOnce", "ToOwned", "Clone", "Debug", "PartialEq", "PartialOrd", "Eq", "Ord", "AsRef", "AsMut", "Into", "From", "Default", "Iterator", "Extend", "IntoIterator", "DoubleEndedIterator", "ExactSizeIterator", "SliceConcatExt", "ToString", "assert!", "assert_eq!", "bitflags!", "bytes!", "cfg!", "col!", "concat!", "concat_idents!", "debug_assert!", "debug_assert_eq!", "env!", "eprintln!", "panic!", "file!", "format!", "format_args!", "include_bytes!", "include_str!", "line!", "local_data_key!", "module_path!", "option_env!", "print!", "println!", "select!", "stringify!", "try!", "unimplemented!", "unreachable!", "vec!", "write!", "writeln!", "macro_rules!", "assert_ne!", "debug_assert_ne!"] as Any,
    ])
    lang.illegal = .regex("</")
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.COMMENT("/\\*", "\\*/")),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'[a-zA-Z_][a-zA-Z0-9_]*(?!')")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("b?r(#*)\"(.|\\n)*?\"\\1(?!#)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("b?'")
                    mode.end = .regex("'")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\\\('|\\w|x\\w{2}|u\\w{4}|U\\w{8})")
                            mode.scope = .single("char.escape")
                            return mode
                        }()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("number")
            mode.relevance = 0
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b0b([01_]+)([ui](8|16|32|64|128|size)|f(32|64))?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b0o([0-7_]+)([ui](8|16|32|64|128|size)|f(32|64))?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b0x([A-Fa-f0-9_]+)([ui](8|16|32|64|128|size)|f(32|64))?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b(\\d[\\d_]*(\\.[0-9_]+)?([eE][+-]?[0-9_]+)?)([ui](8|16|32|64|128|size)|f(32|64))?")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("fn"), .regex("\\s+"), .regex("/(r#)?/[a-zA-Z_]\\w*")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#!?\\[")
            mode.end = .regex("\\]")
            mode.scope = .single("meta")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("let"), .regex("\\s+"), .regex("(?:mut\\s+)?"), .regex("/(r#)?/[a-zA-Z_]\\w*")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("for"), .regex("\\s+"), .regex("/(r#)?/[a-zA-Z_]\\w*"), .regex("\\s+"), .regex("in")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("type"), .regex("\\s+"), .regex("/(r#)?/[a-zA-Z_]\\w*")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("(?:trait|enum|struct|union|impl|for)"), .regex("\\s+"), .regex("/(r#)?/[a-zA-Z_]\\w*")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z]\\w*::")
            mode.keywords = .grouped([
                "keyword": "Self" as Any,
                "built_in": ["drop ", "Copy", "Send", "Sized", "Sync", "Drop", "Fn", "FnMut", "FnOnce", "ToOwned", "Clone", "Debug", "PartialEq", "PartialOrd", "Eq", "Ord", "AsRef", "AsMut", "Into", "From", "Default", "Iterator", "Extend", "IntoIterator", "DoubleEndedIterator", "ExactSizeIterator", "SliceConcatExt", "ToString", "assert!", "assert_eq!", "bitflags!", "bytes!", "cfg!", "col!", "concat!", "concat_idents!", "debug_assert!", "debug_assert_eq!", "env!", "eprintln!", "panic!", "file!", "format!", "format_args!", "include_bytes!", "include_str!", "line!", "local_data_key!", "module_path!", "option_env!", "print!", "println!", "select!", "stringify!", "try!", "unimplemented!", "unreachable!", "vec!", "write!", "writeln!", "macro_rules!", "assert_ne!", "debug_assert_ne!"] as Any,
                "type": ["i8", "i16", "i32", "i64", "i128", "isize", "u8", "u16", "u32", "u64", "u128", "usize", "f32", "f64", "str", "char", "bool", "Box", "Option", "Result", "String", "Vec"] as Any,
            ])

            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("->")
            mode.scope = .single("punctuation")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/\\b//(?!let|for|while|if|else|match\\b)//(r#)?/[a-zA-Z]\\w*(?=\\s*\\()")
            mode.scope = .single("title.function.invoke")
            mode.relevance = 0
            return mode
        }()),
    ]

    return lang
}

/// Register rust language
public extension HighlightJS {
    func registerRust() {
        registerLanguage("rust", definition: rustLanguage)
    }
}
