// Auto-generated from highlight.js
// Language: rsl

import Foundation

/// rsl language definition
public func rslLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "RenderMan RSL"

    lang.keywords = .grouped([
        "keyword": ["while", "for", "if", "do", "return", "else", "break", "extern", "continue"] as Any,
        "built_in": ["abs", "acos", "ambient", "area", "asin", "atan", "atmosphere", "attribute", "calculatenormal", "ceil", "cellnoise", "clamp", "comp", "concat", "cos", "degrees", "depth", "Deriv", "diffuse", "distance", "Du", "Dv", "environment", "exp", "faceforward", "filterstep", "floor", "format", "fresnel", "incident", "length", "lightsource", "log", "match", "max", "min", "mod", "noise", "normalize", "ntransform", "opposite", "option", "phong", "pnoise", "pow", "printf", "ptlined", "radians", "random", "reflect", "refract", "renderinfo", "round", "setcomp", "setxcomp", "setycomp", "setzcomp", "shadow", "sign", "sin", "smoothstep", "specular", "specularbrdf", "spline", "sqrt", "step", "tan", "texture", "textureinfo", "trace", "transform", "vtransform", "xcomp", "ycomp", "zcomp"] as Any,
        "type": ["matrix", "float", "color", "point", "normal", "vector"] as Any,
    ])
    lang.illegal = .regex("</")
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.C_NUMBER_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("(surface|displacement|light|volume|imager)"), .regex("\\s+"), .regex("[a-zA-Z]\\w*")])
            mode.scope = .multi([1: "keyword", 3: "title.class"])
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\(")
            mode.beginKeywords = "illuminate illuminance gather"
            return mode
        }()),
    ]

    return lang
}

/// Register rsl language
public extension HighlightJS {
    func registerRsl() {
        registerLanguage("rsl", definition: rslLanguage)
    }
}
