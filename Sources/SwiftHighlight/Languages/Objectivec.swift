// Auto-generated from highlight.js
// Language: objectivec

import Foundation

/// objectivec language definition
public func objectivecLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Objective-C"

    lang.aliases = ["mm", "objc", "obj-c", "obj-c++", "objective-c++"]
    lang.keywords = .grouped([
        "variable.language": ["this", "super"] as Any,
        "keyword": ["while", "export", "sizeof", "typedef", "const", "struct", "for", "union", "volatile", "static", "mutable", "if", "do", "return", "goto", "enum", "else", "break", "extern", "asm", "case", "default", "register", "explicit", "typename", "switch", "continue", "inline", "readonly", "assign", "readwrite", "[object Object]", "@synchronized", "id", "typeof", "nonatomic", "IBOutlet", "IBAction", "strong", "weak", "copy", "in", "out", "inout", "bycopy", "byref", "oneway", "__strong", "__weak", "__block", "__autoreleasing", "@private", "@protected", "@public", "@try", "@property", "@end", "@throw", "@catch", "@finally", "@autoreleasepool", "@synthesize", "@dynamic", "@selector", "@optional", "@required", "@encode", "@package", "@import", "@defs", "@compatibility_alias", "__bridge", "__bridge_transfer", "__bridge_retained", "__bridge_retain", "__covariant", "__contravariant", "__kindof", "_Nonnull", "_Nullable", "_Null_unspecified", "__FUNCTION__", "__PRETTY_FUNCTION__", "__attribute__", "getter", "setter", "retain", "unsafe_unretained", "nonnull", "nullable", "null_unspecified", "null_resettable", "class", "instancetype", "NS_DESIGNATED_INITIALIZER", "NS_UNAVAILABLE", "NS_REQUIRES_SUPER", "NS_RETURNS_INNER_POINTER", "NS_INLINE", "NS_AVAILABLE", "NS_DEPRECATED", "NS_ENUM", "NS_OPTIONS", "NS_SWIFT_UNAVAILABLE", "NS_ASSUME_NONNULL_BEGIN", "NS_ASSUME_NONNULL_END", "NS_REFINED_FOR_SWIFT", "NS_SWIFT_NAME", "NS_SWIFT_NOTHROW", "NS_DURING", "NS_HANDLER", "NS_ENDHANDLER", "NS_VALUERETURN", "NS_VOIDRETURN"] as Any,
        "literal": ["false", "true", "FALSE", "TRUE", "nil", "YES", "NO", "NULL"] as Any,
        "built_in": ["dispatch_once_t", "dispatch_queue_t", "dispatch_sync", "dispatch_async", "dispatch_once"] as Any,
        "type": ["int", "float", "char", "unsigned", "signed", "short", "long", "double", "wchar_t", "unichar", "void", "bool", "BOOL", "id|0", "_Bool"] as Any,
    ])
    lang.illegal = .regex("</")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(AV|CA|CF|CG|CI|CL|CM|CN|CT|MK|MP|MTK|MTL|NS|SCN|SK|UI|WK|XC)\\w+")
            mode.scope = .single("built_in")
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("@\"")
                    mode.end = .regex("\"")
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
            mode.begin = .regex("#\\s*[a-z]+\\b")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            mode.keywords = .grouped([
                "keyword": "if else elif endif define undef warning error line pragma ifdef ifndef include" as Any,
            ])

            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\\\\\n")
                    mode.relevance = 0
                    return mode
                }()),
                .mode(CommonModes.QUOTE_STRING_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("<.*?>")
                    mode.end = .regex("$")
                    mode.scope = .single("string")
                    mode.illegal = .regex("\\n")
                    return mode
                }()),
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_2 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(@interface|@class|@protocol|@implementation)\\b")
            mode.end = .regex("(\\{|$)")
            mode.scope = .single("class")
            mode.keywords = .grouped([
                "keyword": ["@interface", "@class", "@protocol", "@implementation"] as Any,
            ])

            mode.excludeEnd = true
            mode.contains = [
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\.[a-zA-Z_]\\w*")
            mode.relevance = 0
            return mode
        }()),
    ]

    return lang
}

/// Register objectivec language
public extension HighlightJS {
    func registerObjectivec() {
        registerLanguage("objectivec", definition: objectivecLanguage)
    }
}
