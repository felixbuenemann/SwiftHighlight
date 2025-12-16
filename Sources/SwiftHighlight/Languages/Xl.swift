// Auto-generated from highlight.js
// Language: xl

import Foundation

/// xl language definition
public func xlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "XL"

    lang.aliases = ["tao"]
    lang.keywords = .grouped([
        "keyword": ["if", "then", "else", "do", "while", "until", "for", "loop", "import", "with", "is", "as", "where", "when", "by", "data", "constant", "integer", "real", "text", "name", "boolean", "symbol", "infix", "prefix", "postfix", "block", "tree"] as Any,
        "literal": ["true", "false", "nil"] as Any,
        "built_in": ["in", "mod", "rem", "and", "or", "xor", "not", "abs", "sign", "floor", "ceil", "sqrt", "sin", "cos", "tan", "asin", "acos", "atan", "exp", "expm1", "log", "log2", "log10", "log1p", "pi", "at", "text_length", "text_range", "text_find", "text_replace", "contains", "page", "slide", "basic_slide", "title_slide", "title", "subtitle", "fade_in", "fade_out", "fade_at", "clear_color", "color", "line_color", "line_width", "texture_wrap", "texture_transform", "texture", "scale_?x", "scale_?y", "scale_?z?", "translate_?x", "translate_?y", "translate_?z?", "rotate_?x", "rotate_?y", "rotate_?z?", "rectangle", "circle", "ellipse", "sphere", "path", "line_to", "move_to", "quad_to", "curve_to", "theme", "background", "contents", "locally", "time", "mouse_?x", "mouse_?y", "mouse_buttons", "ObjectLoader", "Animate", "MovieCredits", "Slides", "Filters", "Shading", "Materials", "LensFlare", "Mapping", "VLCAudioVideo", "StereoDecoder", "PointCloud", "NetworkAccess", "RemoteControl", "RegExp", "ChromaKey", "Snowfall", "NodeJS", "Speech", "Charts"] as Any,
    ])
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.illegal = .regex("\\n")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            mode.illegal = .regex("\\n")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("<<")
            mode.end = .regex(">>")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-z][^\\n]*->")
            mode.end = .regex("->")
            mode.scope = .single("function")
            mode.returnBegin = true
            mode.contains = [
                .mode(CommonModes.TITLE_MODE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("$")
            mode.keywords = .grouped([
                "__circularRef": "__ref_0" as Any,
            ])

            mode.beginKeywords = "import"
            mode.contains = [
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[0-9]+#[0-9A-Z_]+(\\.[0-9-A-Z_]+)?#?([Ee][+-]?[0-9]+)?")
            mode.scope = .single("number")
            return mode
        }()),
        .mode(CommonModes.NUMBER_MODE()),
    ]

    return lang
}

/// Register xl language
public extension HighlightJS {
    func registerXl() {
        registerLanguage("xl", definition: xlLanguage)
    }
}
