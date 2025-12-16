// Auto-generated from highlight.js
// Language: scilab

import Foundation

/// scilab language definition
public func scilabLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Scilab"

    lang.aliases = ["sci"]
    lang.keywords = .grouped([
        "keyword": "abort break case clear catch continue do elseif else endfunction end for function global if pause return resume select try then while" as Any,
        "literal": "%f %F %t %T %pi %eps %inf %nan %e %i %z %s" as Any,
        "built_in": "abs and acos asin atan ceil cd chdir clearglobal cosh cos cumprod deff disp error exec execstr exists exp eye gettext floor fprintf fread fsolve imag isdef isempty isinfisnan isvector lasterror length load linspace list listfiles log10 log2 log max min msprintf mclose mopen ones or pathconvert poly printf prod pwd rand real round sinh sin size gsort sprintf sqrt strcat strcmps tring sum system tanh tan type typename warning zeros matrix" as Any,
    ])
    lang.illegal = .regex("(\"|#|/\\*|\\s+/\\w+)")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.end = .regex("$")
            mode.scope = .single("function")
            mode.beginKeywords = "function"
            mode.contains = [
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z_][a-zA-Z_0-9]*[\\.']+")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[")
            mode.end = .regex("\\][\\.']*")
            mode.relevance = 0
            mode.contains = [
                .mode(CommonModes.C_NUMBER_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("'|\"")
                    mode.end = .regex("'|\"")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("''")
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode(CommonModes.COMMENT("//", "$")),
        /* circular ref: __ref_0 */ .mode(Mode()),
        /* circular ref: __ref_1 */ .mode(Mode()),
    ]

    return lang
}

/// Register scilab language
public extension HighlightJS {
    func registerScilab() {
        registerLanguage("scilab", definition: scilabLanguage)
    }
}
