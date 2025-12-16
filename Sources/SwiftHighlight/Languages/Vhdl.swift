// Auto-generated from highlight.js
// Language: vhdl

import Foundation

/// vhdl language definition
public func vhdlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "VHDL"

    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": ["abs", "access", "after", "alias", "all", "and", "architecture", "array", "assert", "assume", "assume_guarantee", "attribute", "begin", "block", "body", "buffer", "bus", "case", "component", "configuration", "constant", "context", "cover", "disconnect", "downto", "default", "else", "elsif", "end", "entity", "exit", "fairness", "file", "for", "force", "function", "generate", "generic", "group", "guarded", "if", "impure", "in", "inertial", "inout", "is", "label", "library", "linkage", "literal", "loop", "map", "mod", "nand", "new", "next", "nor", "not", "null", "of", "on", "open", "or", "others", "out", "package", "parameter", "port", "postponed", "procedure", "process", "property", "protected", "pure", "range", "record", "register", "reject", "release", "rem", "report", "restrict", "restrict_guarantee", "return", "rol", "ror", "select", "sequence", "severity", "shared", "signal", "sla", "sll", "sra", "srl", "strong", "subtype", "then", "to", "transport", "type", "unaffected", "units", "until", "use", "variable", "view", "vmode", "vprop", "vunit", "wait", "when", "while", "with", "xnor", "xor"] as Any,
        "built_in": ["boolean", "bit", "character", "integer", "time", "delay_length", "natural", "positive", "string", "bit_vector", "file_open_kind", "file_open_status", "std_logic", "std_logic_vector", "unsigned", "signed", "boolean_vector", "integer_vector", "std_ulogic", "std_ulogic_vector", "unresolved_unsigned", "u_unsigned", "unresolved_signed", "u_signed", "real_vector", "time_vector"] as Any,
        "literal": ["false", "true", "note", "warning", "error", "failure", "line", "text", "side", "width"] as Any,
    ])
    lang.illegal = .regex("\\{")
    lang.contains = [
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.COMMENT("--", "$")),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(\\d(_|\\d)*#\\w+(\\.\\w+)?#([eE][-+]?\\d(_|\\d)*)?|\\d(_|\\d)*(\\.\\d(_|\\d)*)?([eE][-+]?\\d(_|\\d)*)?)")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'(U|X|0|1|Z|W|L|H|-)'")
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'[A-Za-z](_?[A-Za-z0-9])*")
            mode.scope = .single("symbol")
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register vhdl language
public extension HighlightJS {
    func registerVhdl() {
        registerLanguage("vhdl", definition: vhdlLanguage)
    }
}
