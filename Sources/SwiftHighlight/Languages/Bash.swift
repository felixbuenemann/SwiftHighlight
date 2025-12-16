// Manually ported from highlight.js
// Language: bash

import Foundation

/// Bash language definition
public func bashLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Bash"
    lang.aliases = ["bash", "sh", "zsh"]

    let BASH_KEYWORDS = [
        "if", "then", "else", "elif", "fi", "for", "while", "until", "do", "done", "in",
        "case", "esac", "function", "select", "coproc", "time"
    ].joined(separator: " ")

    let BASH_LITERALS = "true false"

    let BASH_BUILT_INS = [
        "break", "cd", "continue", "eval", "exec", "exit", "export", "getopts", "hash",
        "pwd", "readonly", "return", "shift", "test", "times", "trap", "umask", "unset",
        "alias", "bind", "builtin", "caller", "command", "declare", "echo", "enable",
        "help", "let", "local", "logout", "mapfile", "printf", "read", "readarray",
        "source", "type", "typeset", "ulimit", "unalias", "set", "shopt",
        // Common Unix commands
        "awk", "basename", "bc", "cat", "cp", "curl", "cut", "date", "diff", "dirname",
        "du", "egrep", "env", "expr", "fgrep", "find", "git", "grep", "gzip", "head",
        "hostname", "id", "kill", "less", "ln", "ls", "make", "man", "mkdir", "mkfifo",
        "mknod", "more", "mv", "nl", "nohup", "od", "paste", "perl", "pgrep", "pkill",
        "ps", "python", "python3", "rm", "rmdir", "rsync", "scp", "sed", "seq", "sleep",
        "sort", "split", "ssh", "stat", "sudo", "tail", "tar", "tee", "top", "touch",
        "tr", "uname", "uniq", "wc", "wget", "which", "xargs", "zip"
    ].joined(separator: " ")

    lang.keywords = .grouped([
        "keyword": BASH_KEYWORDS as Any,
        "literal": BASH_LITERALS as Any,
        "built_in": BASH_BUILT_INS as Any
    ])

    // Shebang
    let SHEBANG = Mode()
    SHEBANG.scope = .single("meta")
    SHEBANG.begin = .regex("^#![^\\n]*")
    SHEBANG.relevance = 5

    // Comment
    let COMMENT = Mode()
    COMMENT.scope = .single("comment")
    COMMENT.begin = .regex("#")
    COMMENT.end = .regex("$")

    // Variable
    let VARIABLE = Mode()
    VARIABLE.scope = .single("variable")
    VARIABLE.variants = [
        {
            let m = Mode()
            m.begin = .regex("\\$\\{[^}]+\\}")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("\\$\\([^)]+\\)")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("\\$[A-Za-z_][A-Za-z0-9_]*")
            return m
        }(),
        {
            let m = Mode()
            m.begin = .regex("\\$[0-9#\\?\\$!@*-]")
            return m
        }()
    ]

    // Subshell
    let SUBSHELL = Mode()
    SUBSHELL.begin = .regex("\\$\\(")
    SUBSHELL.end = .regex("\\)")
    SUBSHELL.contains = [.selfReference]

    // Backtick command substitution
    let BACKTICK_SUBST = Mode()
    BACKTICK_SUBST.scope = .single("subst")
    BACKTICK_SUBST.begin = .regex("`")
    BACKTICK_SUBST.end = .regex("`")
    BACKTICK_SUBST.contains = [.mode(VARIABLE)]

    // Double-quoted string
    let DOUBLE_STRING = Mode()
    DOUBLE_STRING.scope = .single("string")
    DOUBLE_STRING.begin = .regex("\"")
    DOUBLE_STRING.end = .regex("\"")
    DOUBLE_STRING.contains = [
        .mode(CommonModes.BACKSLASH_ESCAPE()),
        .mode(VARIABLE),
        .mode(BACKTICK_SUBST)
    ]

    // Single-quoted string (no variable expansion)
    let SINGLE_STRING = Mode()
    SINGLE_STRING.scope = .single("string")
    SINGLE_STRING.begin = .regex("'")
    SINGLE_STRING.end = .regex("'")

    // ANSI-C quoted string
    let ANSI_STRING = Mode()
    ANSI_STRING.scope = .single("string")
    ANSI_STRING.begin = .regex("\\$'")
    ANSI_STRING.end = .regex("'")
    ANSI_STRING.contains = [.mode(CommonModes.BACKSLASH_ESCAPE())]

    // Here-doc
    let HEREDOC = Mode()
    HEREDOC.scope = .single("string")
    HEREDOC.begin = .regex("<<-?\\s*['\"]?([A-Za-z_][A-Za-z0-9_]*)['\"]?")
    HEREDOC.end = .regex("^[A-Za-z_][A-Za-z0-9_]*$")
    HEREDOC.contains = [
        .mode(CommonModes.BACKSLASH_ESCAPE()),
        .mode(VARIABLE),
        .mode(BACKTICK_SUBST)
    ]

    // Number
    let NUMBER = Mode()
    NUMBER.scope = .single("number")
    NUMBER.begin = .regex("\\b[0-9]+(\\.[0-9]+)?\\b")
    NUMBER.relevance = 0

    // Function title
    let FUNC_TITLE = Mode()
    FUNC_TITLE.scope = .single("title.function")
    FUNC_TITLE.begin = .regex("[A-Za-z_][A-Za-z0-9_]*")
    FUNC_TITLE.relevance = 0

    // Function definition
    let FUNCTION = Mode()
    FUNCTION.beginKeywords = "function"
    FUNCTION.end = .regex("\\{|$")
    FUNCTION.excludeEnd = true
    FUNCTION.contains = [.mode(FUNC_TITLE)]

    // Function without keyword
    let FUNCTION_ALT = Mode()
    FUNCTION_ALT.scope = .single("title.function")
    FUNCTION_ALT.begin = .regex("[A-Za-z_][A-Za-z0-9_]*(?=\\s*\\(\\s*\\))")

    // Redirection
    let REDIRECT = Mode()
    REDIRECT.scope = .single("operator")
    REDIRECT.begin = .regex("[0-9]*[<>](&[0-9]|&-)?|>>|<<|&>|>[|&]")

    // Test brackets
    let TEST = Mode()
    TEST.begin = .regex("\\[\\[|\\]\\]|\\[|\\]")

    // Operators
    let OPERATOR = Mode()
    OPERATOR.scope = .single("operator")
    OPERATOR.begin = .regex("&&|\\|\\||;|;;|&")

    lang.contains = [
        .mode(SHEBANG),
        .mode(COMMENT),
        .mode(FUNCTION),
        .mode(FUNCTION_ALT),
        .mode(HEREDOC),
        .mode(DOUBLE_STRING),
        .mode(SINGLE_STRING),
        .mode(ANSI_STRING),
        .mode(VARIABLE),
        .mode(SUBSHELL),
        .mode(BACKTICK_SUBST),
        .mode(NUMBER),
        .mode(REDIRECT),
        .mode(TEST),
        .mode(OPERATOR)
    ]

    return lang
}

/// Register bash language
public extension HighlightJS {
    func registerBash() {
        registerLanguage("bash", definition: bashLanguage)
        registerLanguage("sh", definition: bashLanguage)
        registerLanguage("zsh", definition: bashLanguage)
    }
}
