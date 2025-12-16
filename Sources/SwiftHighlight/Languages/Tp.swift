// Auto-generated from highlight.js
// Language: tp

import Foundation

/// tp language definition
public func tpLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "TP"

    lang.keywords = .grouped([
        "keyword": ["ABORT", "ACC", "ADJUST", "AND", "AP_LD", "BREAK", "CALL", "CNT", "COL", "CONDITION", "CONFIG", "DA", "DB", "DIV", "DETECT", "ELSE", "END", "ENDFOR", "ERR_NUM", "ERROR_PROG", "FINE", "FOR", "GP", "GUARD", "INC", "IF", "JMP", "LINEAR_MAX_SPEED", "LOCK", "MOD", "MONITOR", "OFFSET", "Offset", "OR", "OVERRIDE", "PAUSE", "PREG", "PTH", "RT_LD", "RUN", "SELECT", "SKIP", "Skip", "TA", "TB", "TO", "TOOL_OFFSET", "Tool_Offset", "UF", "UT", "UFRAME_NUM", "UTOOL_NUM", "UNLOCK", "WAIT", "X", "Y", "Z", "W", "P", "R", "STRLEN", "SUBSTR", "FINDSTR", "VOFFSET", "PROG", "ATTR", "MN", "POS"] as Any,
        "literal": ["ON", "OFF", "max_speed", "LPOS", "JPOS", "ENABLE", "DISABLE", "START", "STOP", "RESET"] as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("(AR|P|PAYLOAD|PR|R|SR|RSR|LBL|VR|UALM|MESSAGE|UTOOL|UFRAME|TIMER|TIMER_OVERFLOW|JOINT_MAX_SPEED|RESUME_PROG|DIAG_REC)\\[")
            mode.end = .regex("\\]")
            mode.scope = .single("built_in")
            mode.contains = [
                .selfReference,
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[1-9][0-9]*")
                    mode.scope = .single("number")
                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex(":[^\\]]+")
                    mode.scope = .single("symbol")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(AI|AO|DI|DO|F|RI|RO|UI|UO|GI|GO|SI|SO)\\[")
            mode.end = .regex("\\]")
            mode.scope = .single("built_in")
            mode.contains = [
                .selfReference,
                /* circular ref: __ref_0 */ .mode(Mode()),
                .mode(CommonModes.QUOTE_STRING_MODE()),
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/(PROG|ATTR|MN|POS|END)\\b")
            mode.scope = .single("keyword")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(CALL|RUN|POINT_LOGIC|LBL)\\b")
            mode.scope = .single("keyword")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(ACC|CNT|Skip|Offset|PSPD|RT_LD|AP_LD|Tool_Offset)")
            mode.scope = .single("keyword")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\d+(sec|msec|mm/sec|cm/min|inch/min|deg/sec|mm|in|cm)?\\b")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.COMMENT("//", "[;$]")),
        .mode(CommonModes.COMMENT("!", "[;$]")),
        .mode(CommonModes.COMMENT("--eg:", "$")),
        /* circular ref: __ref_2 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            return mode
        }()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$[A-Za-z0-9_]+")
            mode.scope = .single("variable")
            return mode
        }()),
    ]

    return lang
}

/// Register tp language
public extension HighlightJS {
    func registerTp() {
        registerLanguage("tp", definition: tpLanguage)
    }
}
