// Auto-generated from highlight.js
// Language: aspectj

import Foundation

/// aspectj language definition
public func aspectjLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "AspectJ"

    lang.keywords = .array(["false", "synchronized", "int", "abstract", "float", "private", "char", "boolean", "static", "null", "if", "const", "for", "true", "while", "long", "throw", "strictfp", "finally", "protected", "import", "native", "final", "return", "void", "enum", "else", "extends", "implements", "break", "transient", "new", "catch", "instanceof", "byte", "super", "volatile", "case", "assert", "short", "package", "default", "double", "public", "try", "this", "switch", "continue", "throws", "privileged", "aspectOf", "adviceexecution", "proceed", "cflowbelow", "cflow", "initialization", "preinitialization", "staticinitialization", "withincode", "target", "within", "execution", "getWithinTypeName", "handler", "thisJoinPoint", "thisJoinPointStaticPart", "thisEnclosingJoinPointStaticPart", "declare", "parents", "warning", "error", "soft", "precedence", "thisAspectInstance"])
    lang.illegal = .regex("<\\/|#")
    lang.contains = [
        .mode(CommonModes.COMMENT("\\/\\*\\*", "\\*\\/")),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[{;=]")
            mode.scope = .single("class")
            mode.beginKeywords = "aspect"
            mode.illegal = .regex("[:;\"\\[\\]]")
            mode.excludeEnd = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.beginKeywords = "extends implements pertypewithin perthis pertarget percflowbelow percflow issingleton"
                    return mode
                }()),
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\([^\\)]*")
                    mode.end = .regex("[)]+")
                    mode.keywords = .array(["false", "synchronized", "int", "abstract", "float", "private", "char", "boolean", "static", "null", "if", "const", "for", "true", "while", "long", "throw", "strictfp", "finally", "protected", "import", "native", "final", "return", "void", "enum", "else", "extends", "implements", "break", "transient", "new", "catch", "instanceof", "byte", "super", "volatile", "case", "assert", "short", "package", "default", "double", "public", "try", "this", "switch", "continue", "throws", "privileged", "aspectOf", "adviceexecution", "proceed", "cflowbelow", "cflow", "initialization", "preinitialization", "staticinitialization", "withincode", "target", "within", "execution", "getWithinTypeName", "handler", "thisJoinPoint", "thisJoinPointStaticPart", "thisEnclosingJoinPointStaticPart", "declare", "parents", "warning", "error", "soft", "precedence", "thisAspectInstance", "get", "set", "args", "call"])

                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[{;=]")
            mode.scope = .single("class")
            mode.keywords = .simple("class interface")

            mode.beginKeywords = "class interface"
            mode.illegal = .regex("[:\"\\[\\]]")
            mode.relevance = 0
            mode.excludeEnd = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.beginKeywords = "extends implements"
                    return mode
                }()),
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[)]")
            mode.beginKeywords = "pointcut after before around throwing returning"
            mode.illegal = .regex("[\"\\[\\]]")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-zA-Z_]\\w*/\\s*\\(/")
                    mode.returnBegin = true
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[:]")
            mode.end = .regex("[{;]")
            mode.keywords = .array(["false", "synchronized", "int", "abstract", "float", "private", "char", "boolean", "static", "null", "if", "const", "for", "true", "while", "long", "throw", "strictfp", "finally", "protected", "import", "native", "final", "return", "void", "enum", "else", "extends", "implements", "break", "transient", "new", "catch", "instanceof", "byte", "super", "volatile", "case", "assert", "short", "package", "default", "double", "public", "try", "this", "switch", "continue", "throws", "privileged", "aspectOf", "adviceexecution", "proceed", "cflowbelow", "cflow", "initialization", "preinitialization", "staticinitialization", "withincode", "target", "within", "execution", "getWithinTypeName", "handler", "thisJoinPoint", "thisJoinPointStaticPart", "thisEnclosingJoinPointStaticPart", "declare", "parents", "warning", "error", "soft", "precedence", "thisAspectInstance"])

            mode.illegal = .regex("[\"\\[\\]]")
            mode.relevance = 0
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-zA-Z_]\\w*/\\s*\\(/")
                    mode.keywords = .array(["false", "synchronized", "int", "abstract", "float", "private", "char", "boolean", "static", "null", "if", "const", "for", "true", "while", "long", "throw", "strictfp", "finally", "protected", "import", "native", "final", "return", "void", "enum", "else", "extends", "implements", "break", "transient", "new", "catch", "instanceof", "byte", "super", "volatile", "case", "assert", "short", "package", "default", "double", "public", "try", "this", "switch", "continue", "throws", "privileged", "aspectOf", "adviceexecution", "proceed", "cflowbelow", "cflow", "initialization", "preinitialization", "staticinitialization", "withincode", "target", "within", "execution", "getWithinTypeName", "handler", "thisJoinPoint", "thisJoinPointStaticPart", "thisEnclosingJoinPointStaticPart", "declare", "parents", "warning", "error", "soft", "precedence", "thisAspectInstance", "get", "set", "args", "call"])

                    mode.relevance = 0
                    return mode
                }()),
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.beginKeywords = "new throw"
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\w+ +\\w+(\\.\\w+)?\\s*\\([^\\)]*\\)\\s*((throws)[\\w\\s,]+)?[\\{;]")
            mode.end = .regex("[{;=]")
            mode.scope = .single("function")
            mode.keywords = .array(["false", "synchronized", "int", "abstract", "float", "private", "char", "boolean", "static", "null", "if", "const", "for", "true", "while", "long", "throw", "strictfp", "finally", "protected", "import", "native", "final", "return", "void", "enum", "else", "extends", "implements", "break", "transient", "new", "catch", "instanceof", "byte", "super", "volatile", "case", "assert", "short", "package", "default", "double", "public", "try", "this", "switch", "continue", "throws", "privileged", "aspectOf", "adviceexecution", "proceed", "cflowbelow", "cflow", "initialization", "preinitialization", "staticinitialization", "withincode", "target", "within", "execution", "getWithinTypeName", "handler", "thisJoinPoint", "thisJoinPointStaticPart", "thisEnclosingJoinPointStaticPart", "declare", "parents", "warning", "error", "soft", "precedence", "thisAspectInstance"])

            mode.excludeEnd = true
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-zA-Z_]\\w*/\\s*\\(/")
                    mode.relevance = 0
                    mode.returnBegin = true
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.keywords = .array(["false", "synchronized", "int", "abstract", "float", "private", "char", "boolean", "static", "null", "if", "const", "for", "true", "while", "long", "throw", "strictfp", "finally", "protected", "import", "native", "final", "return", "void", "enum", "else", "extends", "implements", "break", "transient", "new", "catch", "instanceof", "byte", "super", "volatile", "case", "assert", "short", "package", "default", "double", "public", "try", "this", "switch", "continue", "throws", "privileged", "aspectOf", "adviceexecution", "proceed", "cflowbelow", "cflow", "initialization", "preinitialization", "staticinitialization", "withincode", "target", "within", "execution", "getWithinTypeName", "handler", "thisJoinPoint", "thisJoinPointStaticPart", "thisEnclosingJoinPointStaticPart", "declare", "parents", "warning", "error", "soft", "precedence", "thisAspectInstance"])

                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        .mode(CommonModes.C_NUMBER_MODE()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_4 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
            ]
            return mode
        }()),
        /* circular ref: __ref_5 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@[A-Za-z]+")
            mode.scope = .single("meta")
            return mode
        }()),
    ]

    return lang
}

/// Register aspectj language
public extension HighlightJS {
    func registerAspectj() {
        registerLanguage("aspectj", definition: aspectjLanguage)
    }
}
