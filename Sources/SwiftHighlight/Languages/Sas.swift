// Auto-generated from highlight.js
// Language: sas

import Foundation

/// sas language definition
public func sasLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "SAS"

    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "literal": ["null", "missing", "_all_", "_automatic_", "_character_", "_infile_", "_n_", "_name_", "_null_", "_numeric_", "_user_", "_webout_"] as Any,
        "keyword": ["do", "if", "then", "else", "end", "until", "while", "abort", "array", "attrib", "by", "call", "cards", "cards4", "catname", "continue", "datalines", "datalines4", "delete", "delim", "delimiter", "display", "dm", "drop", "endsas", "error", "file", "filename", "footnote", "format", "goto", "in", "infile", "informat", "input", "keep", "label", "leave", "length", "libname", "link", "list", "lostcard", "merge", "missing", "modify", "options", "output", "out", "page", "put", "redirect", "remove", "rename", "replace", "retain", "return", "select", "set", "skip", "startsas", "stop", "title", "update", "waitsas", "where", "window", "x|0", "systask", "add", "and", "alter", "as", "cascade", "check", "create", "delete", "describe", "distinct", "drop", "foreign", "from", "group", "having", "index", "insert", "into", "in", "key", "like", "message", "modify", "msgtype", "not", "null", "on", "or", "order", "primary", "references", "reset", "restrict", "select", "set", "table", "unique", "update", "validate", "view", "where"] as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\s*(proc [\\w\\d_]+|data|run|quit)[\\s;]")
            mode.scope = .single("keyword")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("&[a-zA-Z_&][a-zA-Z0-9_]*\\.?")
            mode.scope = .single("variable")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("^\\s*"), .regex("datalines;|cards;"), .regex("(?:.*\\n)+"), .regex("^\\s*;\\s*$")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("%mend|%macro"), .regex("\\s+"), .regex("[a-zA-Z_&][a-zA-Z0-9_]*")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("%(?:bquote|nrbquote|cmpres|qcmpres|compstor|datatyp|display|do|else|end|eval|global|goto|if|index|input|keydef|label|left|length|let|local|lowcase|macro|mend|nrbquote|nrquote|nrstr|put|qcmpres|qleft|qlowcase|qscan|qsubstr|qsysfunc|qtrim|quote|qupcase|scan|str|substr|superq|syscall|sysevalf|sysexec|sysfunc|sysget|syslput|sysprod|sysrc|sysrput|then|to|trim|unquote|until|upcase|verify|while|window)")
            mode.scope = .single("built_in")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("%[a-zA-Z_][a-zA-Z_0-9]*")
            mode.scope = .single("title.function")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(?:abs|addr|airy|arcos|arsin|atan|attrc|attrn|band|betainv|blshift|bnot|bor|brshift|bxor|byte|cdf|ceil|cexist|cinv|close|cnonct|collate|compbl|compound|compress|cos|cosh|css|curobs|cv|daccdb|daccdbsl|daccsl|daccsyd|dacctab|dairy|date|datejul|datepart|datetime|day|dclose|depdb|depdbsl|depdbsl|depsl|depsl|depsyd|depsyd|deptab|deptab|dequote|dhms|dif|digamma|dim|dinfo|dnum|dopen|doptname|doptnum|dread|dropnote|dsname|erf|erfc|exist|exp|fappend|fclose|fcol|fdelete|fetch|fetchobs|fexist|fget|fileexist|filename|fileref|finfo|finv|fipname|fipnamel|fipstate|floor|fnonct|fnote|fopen|foptname|foptnum|fpoint|fpos|fput|fread|frewind|frlen|fsep|fuzz|fwrite|gaminv|gamma|getoption|getvarc|getvarn|hbound|hms|hosthelp|hour|ibessel|index|indexc|indexw|input|inputc|inputn|int|intck|intnx|intrr|irr|jbessel|juldate|kurtosis|lag|lbound|left|length|lgamma|libname|libref|log|log10|log2|logpdf|logpmf|logsdf|lowcase|max|mdy|mean|min|minute|mod|month|mopen|mort|n|netpv|nmiss|normal|note|npv|open|ordinal|pathname|pdf|peek|peekc|pmf|point|poisson|poke|probbeta|probbnml|probchi|probf|probgam|probhypr|probit|probnegb|probnorm|probt|put|putc|putn|qtr|quote|ranbin|rancau|ranexp|rangam|range|rank|rannor|ranpoi|rantbl|rantri|ranuni|repeat|resolve|reverse|rewind|right|round|saving|scan|sdf|second|sign|sin|sinh|skewness|soundex|spedis|sqrt|std|stderr|stfips|stname|stnamel|substr|sum|symget|sysget|sysmsg|sysprod|sysrc|system|tan|tanh|time|timepart|tinv|tnonct|today|translate|tranwrd|trigamma|trim|trimn|trunc|uniform|upcase|uss|var|varfmt|varinfmt|varlabel|varlen|varname|varnum|varray|varrayx|vartype|verify|vformat|vformatd|vformatdx|vformatn|vformatnx|vformatw|vformatwx|vformatx|vinarray|vinarrayx|vinformat|vinformatd|vinformatdx|vinformatn|vinformatnx|vinformatw|vinformatwx|vinformatx|vlabel|vlabelx|vlength|vlengthx|vname|vnamex|vtype|vtypex|weekday|year|yyq|zipfips|zipname|zipnamel|zipstate)(?=\\()")
            mode.scope = .single("meta")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.scope = .single("string")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode(CommonModes.COMMENT("\\*", ";")),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
    ]

    return lang
}

/// Register sas language
public extension HighlightJS {
    func registerSas() {
        registerLanguage("sas", definition: sasLanguage)
    }
}
