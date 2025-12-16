// Auto-generated from highlight.js
// Language: abnf

import Foundation

/// abnf language definition
public func abnfLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Augmented Backus-Naur Form"

    lang.keywords = .array(["ALPHA", "BIT", "CHAR", "CR", "CRLF", "CTL", "DIGIT", "DQUOTE", "HEXDIG", "HTAB", "LF", "LWSP", "OCTET", "SP", "VCHAR", "WSP"])
    lang.illegal = .regex("[!@#$^&',?+~`|:]")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("=\\/?")
            mode.scope = .single("operator")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/^[a-zA-Z][a-zA-Z0-9-]*//(?=\\s*=)/")
            mode.scope = .single("attribute")
            return mode
        }()),
        .mode(CommonModes.COMMENT(";", "$")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("%b[0-1]+(-[0-1]+|(\\.[0-1]+)+)?")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("%d[0-9]+(-[0-9]+|(\\.[0-9]+)+)?")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("%x[0-9A-F]+(-[0-9A-F]+|(\\.[0-9A-F]+)+)?")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("%[si](?=\".*\")")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.NUMBER_MODE()),
    ]

    return lang
}

/// Register abnf language
public extension HighlightJS {
    func registerAbnf() {
        registerLanguage("abnf", definition: abnfLanguage)
    }
}
