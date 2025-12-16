// Auto-generated from highlight.js
// Language: delphi

import Foundation

/// delphi language definition
public func delphiLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Delphi"

    lang.aliases = ["dpr", "dfm", "pas", "pascal"]
    lang.caseInsensitive = true
    lang.keywords = .array(["exports", "register", "file", "shl", "array", "record", "property", "for", "mod", "while", "set", "ally", "label", "uses", "raise", "not", "stored", "class", "safecall", "var", "interface", "or", "private", "static", "exit", "index", "inherited", "to", "else", "stdcall", "override", "shr", "asm", "far", "resourcestring", "finalization", "packed", "virtual", "out", "and", "protected", "library", "do", "xorwrite", "goto", "near", "function", "end", "div", "overload", "object", "unit", "begin", "string", "on", "inline", "repeat", "until", "destructor", "write", "message", "program", "with", "read", "initialization", "except", "default", "nil", "if", "case", "cdecl", "in", "downto", "threadvar", "of", "try", "pascal", "const", "external", "constructor", "type", "public", "then", "implementation", "finally", "published", "procedure", "absolute", "reintroduce", "operator", "as", "is", "abstract", "alias", "assembler", "bitpacked", "break", "continue", "cppdecl", "cvar", "enumerator", "experimental", "platform", "deprecated", "unimplemented", "dynamic", "export", "far16", "forward", "generic", "helper", "implements", "interrupt", "iochecks", "local", "name", "nodefault", "noreturn", "nostackframe", "oldfpccall", "otherwise", "saveregisters", "softfloat", "specialize", "strict", "unaligned", "varargs"])
    lang.illegal = .regex("\"|\\$[G-Zg-z]|\\/\\*|<\\/|\\|")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("''")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("#\\d[\\d_]*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#\\$[\\dA-Fa-f][\\dA-Fa-f_]*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#&[0-7][0-7_]*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#%[01][01_]*")
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
                    mode.begin = .regex("\\b\\d[\\d_]*(\\.\\d[\\d_]*)?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\$[\\dA-Fa-f_]+")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\$")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("&[0-7][0-7_]*")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("%[01_]+")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("%")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z]\\w*\\s*=\\s*class\\s*\\(")
            mode.returnBegin = true
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[:;]")
            mode.scope = .single("function")
            mode.keywords = .simple("function constructor|10 destructor|10 procedure|10")

            mode.beginKeywords = "function constructor destructor procedure"
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.keywords = .array(["exports", "register", "file", "shl", "array", "record", "property", "for", "mod", "while", "set", "ally", "label", "uses", "raise", "not", "stored", "class", "safecall", "var", "interface", "or", "private", "static", "exit", "index", "inherited", "to", "else", "stdcall", "override", "shr", "asm", "far", "resourcestring", "finalization", "packed", "virtual", "out", "and", "protected", "library", "do", "xorwrite", "goto", "near", "function", "end", "div", "overload", "object", "unit", "begin", "string", "on", "inline", "repeat", "until", "destructor", "write", "message", "program", "with", "read", "initialization", "except", "default", "nil", "if", "case", "cdecl", "in", "downto", "threadvar", "of", "try", "pascal", "const", "external", "constructor", "type", "public", "then", "implementation", "finally", "published", "procedure", "absolute", "reintroduce", "operator", "as", "is", "abstract", "alias", "assembler", "bitpacked", "break", "continue", "cppdecl", "cvar", "enumerator", "experimental", "platform", "deprecated", "unimplemented", "dynamic", "export", "far16", "forward", "generic", "helper", "implements", "interrupt", "iochecks", "local", "name", "nodefault", "noreturn", "nostackframe", "oldfpccall", "otherwise", "saveregisters", "softfloat", "specialize", "strict", "unaligned", "varargs"])

                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("meta")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\{\\$")
                                    mode.end = .regex("\\}")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\(\\*\\$")
                                    mode.end = .regex("\\*\\)")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode(CommonModes.C_LINE_COMMENT_MODE()),
                        .mode(CommonModes.COMMENT("\\{", "\\}")),
                        .mode(CommonModes.COMMENT("\\(\\*", "\\*\\)")),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                /* circular ref: __ref_4 */ .mode(Mode()),
                /* circular ref: __ref_5 */ .mode(Mode()),
                /* circular ref: __ref_6 */ .mode(Mode()),
            ]
            return mode
        }()),
        /* circular ref: __ref_3 */ .mode(Mode()),
        /* circular ref: __ref_4 */ .mode(Mode()),
        /* circular ref: __ref_5 */ .mode(Mode()),
        /* circular ref: __ref_6 */ .mode(Mode()),
    ]

    return lang
}

/// Register delphi language
public extension HighlightJS {
    func registerDelphi() {
        registerLanguage("delphi", definition: delphiLanguage)
    }
}
