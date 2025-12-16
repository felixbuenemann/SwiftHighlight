// Auto-generated from highlight.js
// Language: perl

import Foundation

/// perl language definition
public func perlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Perl"

    lang.aliases = ["pl", "pm"]
    lang.keywords = .grouped([
        "keyword": "abs accept alarm and atan2 bind binmode bless break caller chdir chmod chomp chop chown chr chroot class close closedir connect continue cos crypt dbmclose dbmopen defined delete die do dump each else elsif endgrent endhostent endnetent endprotoent endpwent endservent eof eval exec exists exit exp fcntl field fileno flock for foreach fork format formline getc getgrent getgrgid getgrnam gethostbyaddr gethostbyname gethostent getlogin getnetbyaddr getnetbyname getnetent getpeername getpgrp getpriority getprotobyname getprotobynumber getprotoent getpwent getpwnam getpwuid getservbyname getservbyport getservent getsockname getsockopt given glob gmtime goto grep gt hex if index int ioctl join keys kill last lc lcfirst length link listen local localtime log lstat lt ma map method mkdir msgctl msgget msgrcv msgsnd my ne next no not oct open opendir or ord our pack package pipe pop pos print printf prototype push q|0 qq quotemeta qw qx rand read readdir readline readlink readpipe recv redo ref rename require reset return reverse rewinddir rindex rmdir say scalar seek seekdir select semctl semget semop send setgrent sethostent setnetent setpgrp setpriority setprotoent setpwent setservent setsockopt shift shmctl shmget shmread shmwrite shutdown sin sleep socket socketpair sort splice split sprintf sqrt srand stat state study sub substr symlink syscall sysopen sysread sysseek system syswrite tell telldir tie tied time times tr truncate uc ucfirst umask undef unless unlink unpack unshift untie until use utime values vec wait waitpid wantarray warn when while write x|0 xor y|0" as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.scope = .single("variable")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\s+:\\s*\\w+(\\s*\\(.*?\\))?")
                    mode.scope = .single("attr")
                    return mode
                }()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\$\\d")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("/[$%@](?!\")(\\^\\w\\b|#\\w+(::\\w+)*|\\{\\w+\\}|\\w+(::\\w*)*)/(?![A-Za-z])(?![@$%])")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("[$%@](?!\")[^\\s\\w{=]|\\$=")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode(CommonModes.COMMENT("^=\\w", "=cut")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("->\\{")
            mode.end = .regex("\\}")
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[$@]\\{")
                            mode.end = .regex("\\}")
                            mode.scope = .single("subst")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_4" as Any,
                            ])

                            mode.contains = [
                                /* circular ref: __ref_0 */ .mode(Mode()),
                                /* circular ref: __ref_1 */ .mode(Mode()),
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                /* circular ref: __ref_3 */ .mode(Mode()),
                                /* circular ref: __ref_5 */ .mode(Mode()),
                                .mode({
                                    let mode = Mode()
                                    mode.scope = .single("number")
                                    mode.relevance = 0
                                    mode.variants = [
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("0?\\.[0-9][0-9_]+\\b")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\bv?(0|[1-9][0-9_]*(\\.[0-9_]+)?|[1-9][0-9_]*)\\b")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\b0[0-7][0-7_]*\\b")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\b0x[0-9a-fA-F][0-9a-fA-F_]*\\b")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("\\b0b[0-1][0-1_]*\\b")
                                            return mode
                                        }(),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("(\\/\\/|!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|-|-=|/=|/|:|;|<<|<<=|<=|<|===|==|=|>>>=|>>=|>=|>>>|>>|>|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~|\\b(split|return|print|reverse|grep)\\b)\\s*")
                                    mode.keywords = .simple("split return print reverse grep")

                                    mode.relevance = 0
                                    mode.contains = [
                                        /* circular ref: __ref_1 */ .mode(Mode()),
                                        .mode({
                                            let mode = Mode()
                                            mode.scope = .single("regexp")
                                            mode.relevance = 2
                                            mode.variants = [
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("(?:s|tr|y)(?:/!/|/\\//|/\\|/|/\\?/|/'/|/\"/|/#/|[object Object])/(?:\\\\.|[^\\\\\\/])*?/\\1/(?:\\\\.|[^\\\\\\/])*?/\\1/[dualxmsipngr]{0,12}/")
                                                    return mode
                                                }(),
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("(?:s|tr|y)\\(/(?:\\\\.|[^\\\\\\/])*?/\\)\\(/(?:\\\\.|[^\\\\\\/])*?/\\)/[dualxmsipngr]{0,12}/")
                                                    return mode
                                                }(),
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("(?:s|tr|y)\\[/(?:\\\\.|[^\\\\\\/])*?/\\]\\[/(?:\\\\.|[^\\\\\\/])*?/\\]/[dualxmsipngr]{0,12}/")
                                                    return mode
                                                }(),
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("(?:s|tr|y)\\{/(?:\\\\.|[^\\\\\\/])*?/\\}\\{/(?:\\\\.|[^\\\\\\/])*?/\\}/[dualxmsipngr]{0,12}/")
                                                    return mode
                                                }(),
                                            ]
                                            return mode
                                        }()),
                                        .mode({
                                            let mode = Mode()
                                            mode.scope = .single("regexp")
                                            mode.variants = [
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("(m|qr)\\/\\/")
                                                    mode.relevance = 0
                                                    return mode
                                                }(),
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("(?:(?:m|qr)?)/\\///(?:\\\\.|[^\\\\\\/])*?//\\///[dualxmsipngr]{0,12}/")
                                                    return mode
                                                }(),
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("(?:m|qr)(?:/!/|/\\//|/\\|/|/\\?/|/'/|/\"/|/#/|[object Object])/(?:\\\\.|[^\\\\\\/])*?//\\1//[dualxmsipngr]{0,12}/")
                                                    return mode
                                                }(),
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("(?:m|qr)/\\(//(?:\\\\.|[^\\\\\\/])*?//\\)//[dualxmsipngr]{0,12}/")
                                                    return mode
                                                }(),
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("(?:m|qr)/\\[//(?:\\\\.|[^\\\\\\/])*?//\\]//[dualxmsipngr]{0,12}/")
                                                    return mode
                                                }(),
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("(?:m|qr)/\\{//(?:\\\\.|[^\\\\\\/])*?//\\}//[dualxmsipngr]{0,12}/")
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
                                    mode.end = .regex("(\\s*\\(.*?\\))?[;{]")
                                    mode.scope = .single("function")
                                    mode.beginKeywords = "sub method"
                                    mode.relevance = 5
                                    mode.excludeEnd = true
                                    mode.contains = [
                                        .mode(CommonModes.TITLE_MODE()),
                                        /* circular ref: __ref_6 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.end = .regex("[;{]")
                                    mode.scope = .single("class")
                                    mode.beginKeywords = "class"
                                    mode.relevance = 5
                                    mode.excludeEnd = true
                                    mode.contains = [
                                        /* circular ref: __ref_7 */ .mode(Mode()),
                                        /* circular ref: __ref_6 */ .mode(Mode()),
                                        /* circular ref: __ref_8 */ .mode(Mode()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("-\\w\\b")
                                    mode.relevance = 0
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("^__DATA__$")
                                    mode.end = .regex("^__END__$")
                                    mode.subLanguage = .single("mojolicious")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("^@@.*")
                                            mode.end = .regex("$")
                                            mode.scope = .single("comment")
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                        /* circular ref: __ref_0 */ .mode(Mode()),
                    ]
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("q[qwxr]?\\s*\\(")
                            mode.end = .regex("\\)")
                            mode.relevance = 5
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("q[qwxr]?\\s*\\[")
                            mode.end = .regex("\\]")
                            mode.relevance = 5
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("q[qwxr]?\\s*\\{")
                            mode.end = .regex("\\}")
                            mode.relevance = 5
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("q[qwxr]?\\s*\\|")
                            mode.end = .regex("\\|")
                            mode.relevance = 5
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("q[qwxr]?\\s*<")
                            mode.end = .regex(">")
                            mode.relevance = 5
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("qw\\s+q")
                            mode.end = .regex("q")
                            mode.relevance = 5
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("'")
                            mode.end = .regex("'")
                            mode.contains = [
                                /* circular ref: __ref_9 */ .mode(Mode()),
                            ]
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\"")
                            mode.end = .regex("\"")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("`")
                            mode.end = .regex("`")
                            mode.contains = [
                                /* circular ref: __ref_9 */ .mode(Mode()),
                            ]
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\{\\w+\\}")
                            mode.relevance = 0
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("-?\\w+\\s*=>")
                            mode.relevance = 0
                            return mode
                        }(),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_8 */ .mode(Mode()),
                /* circular ref: __ref_10 */ .mode(Mode()),
                /* circular ref: __ref_11 */ .mode(Mode()),
                /* circular ref: __ref_12 */ .mode(Mode()),
                /* circular ref: __ref_13 */ .mode(Mode()),
                /* circular ref: __ref_14 */ .mode(Mode()),
            ]
            return mode
        }()),
        /* circular ref: __ref_5 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_10 */ .mode(Mode()),
        /* circular ref: __ref_11 */ .mode(Mode()),
        /* circular ref: __ref_12 */ .mode(Mode()),
        /* circular ref: __ref_13 */ .mode(Mode()),
        /* circular ref: __ref_14 */ .mode(Mode()),
    ]

    return lang
}

/// Register perl language
public extension HighlightJS {
    func registerPerl() {
        registerLanguage("perl", definition: perlLanguage)
    }
}
