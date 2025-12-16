// Auto-generated from highlight.js
// Language: d

import Foundation

/// d language definition
public func dLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "D"

    lang.keywords = .grouped([
        "keyword": "abstract alias align asm assert auto body break byte case cast catch class const continue debug default delete deprecated do else enum export extern final finally for foreach foreach_reverse|10 goto if immutable import in inout int interface invariant is lazy macro mixin module new nothrow out override package pragma private protected public pure ref return scope shared static struct super switch synchronized template this throw try typedef typeid typeof union unittest version void volatile while with __FILE__ __LINE__ __gshared|10 __thread __traits __DATE__ __EOF__ __TIME__ __TIMESTAMP__ __VENDOR__ __VERSION__" as Any,
        "built_in": "bool cdouble cent cfloat char creal dchar delegate double dstring float function idouble ifloat ireal long real short string ubyte ucent uint ulong ushort wchar wstring" as Any,
        "literal": "false null true" as Any,
    ])
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.COMMENT("\\/\\+", "\\+\\/")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("x\"[\\da-fA-F\\s\\n\\r]*\"[cwd]?")
            mode.scope = .single("string")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"[cwd]?")
            mode.scope = .single("string")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\\\(['\"\\?\\\\abfnrtv]|u[\\dA-Fa-f]{4}|[0-7]{1,3}|x[\\dA-Fa-f]{2}|U[\\dA-Fa-f]{8})|&[a-zA-Z\\d]{2,};")
                    mode.relevance = 0
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[rq]\"")
            mode.end = .regex("\"[cwd]?")
            mode.scope = .single("string")
            mode.relevance = 5
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("`")
            mode.end = .regex("`[cwd]?")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("q\"\\{")
            mode.end = .regex("\\}\"")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(((0[xX](([\\da-fA-F][\\da-fA-F_]*|_[\\da-fA-F][\\da-fA-F_]*)\\.([\\da-fA-F][\\da-fA-F_]*|_[\\da-fA-F][\\da-fA-F_]*)|\\.?([\\da-fA-F][\\da-fA-F_]*|_[\\da-fA-F][\\da-fA-F_]*))[pP][+-]?(0|[1-9][\\d_]*|\\d[\\d_]*|[\\d_]+?\\d))|((0|[1-9][\\d_]*|\\d[\\d_]*|[\\d_]+?\\d)(\\.\\d*|([eE][+-]?(0|[1-9][\\d_]*|\\d[\\d_]*|[\\d_]+?\\d)))|\\d+\\.(0|[1-9][\\d_]*|\\d[\\d_]*|[\\d_]+?\\d)|\\.(0|[1-9][\\d_]*)([eE][+-]?(0|[1-9][\\d_]*|\\d[\\d_]*|[\\d_]+?\\d))?))([fF]|L|i|[fF]i|Li)?|((0|[1-9][\\d_]*)|0[bB][01_]+|0[xX]([\\da-fA-F][\\da-fA-F_]*|_[\\da-fA-F][\\da-fA-F_]*))(i|[fF]i|Li))")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b((0|[1-9][\\d_]*)|0[bB][01_]+|0[xX]([\\da-fA-F][\\da-fA-F_]*|_[\\da-fA-F][\\da-fA-F_]*))(L|u|U|Lu|LU|uL|UL)?")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'(\\\\(['\"\\?\\\\abfnrtv]|u[\\dA-Fa-f]{4}|[0-7]{1,3}|x[\\dA-Fa-f]{2}|U[\\dA-Fa-f]{8})|&[a-zA-Z\\d]{2,};|.)")
            mode.end = .regex("'")
            mode.scope = .single("string")
            mode.illegal = .regex(".")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^#!")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            mode.relevance = 5
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#(line)")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            mode.relevance = 5
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@[a-zA-Z_][a-zA-Z_\\d]*")
            mode.scope = .single("keyword")
            return mode
        }()),
    ]

    return lang
}

/// Register d language
public extension HighlightJS {
    func registerD() {
        registerLanguage("d", definition: dLanguage)
    }
}
