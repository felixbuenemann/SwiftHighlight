// Auto-generated from highlight.js
// Language: openscad

import Foundation

/// openscad language definition
public func openscadLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "OpenSCAD"

    lang.aliases = ["scad"]
    lang.keywords = .grouped([
        "keyword": "function module include use for intersection_for if else \\%" as Any,
        "literal": "false true PI undef" as Any,
        "built_in": "circle square polygon text sphere cube cylinder polyhedron translate rotate scale resize mirror multmatrix color offset hull minkowski union difference intersection abs sign sin cos tan acos asin atan atan2 floor round ceil ln log pow sqrt exp rands min max concat lookup str chr search version version_num norm cross parent_module echo import import_dxf dxf_linear_extrude linear_extrude rotate_extrude surface projection render children dxf_cross dxf_dim let assign" as Any,
    ])
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b\\d+(\\.\\d+)?(e-?\\d+)?")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("include|use <")
            mode.end = .regex(">")
            mode.scope = .single("meta")
            mode.keywords = .grouped([
                "keyword": "include use" as Any,
            ])

            return mode
        }()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$(f[asn]|t|vp[rtd]|children)")
            mode.scope = .single("keyword")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[*!#%]")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("=|\\{")
            mode.scope = .single("function")
            mode.beginKeywords = "module function"
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.contains = [
                        .selfReference,
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("false|true|PI|undef")
                            mode.scope = .single("literal")
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register openscad language
public extension HighlightJS {
    func registerOpenscad() {
        registerLanguage("openscad", definition: openscadLanguage)
    }
}
