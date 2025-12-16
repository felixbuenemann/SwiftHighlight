// Auto-generated from highlight.js
// Language: processing

import Foundation

/// processing language definition
public func processingLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Processing"

    lang.aliases = ["pde"]
    lang.keywords = .grouped([
        "keyword": ["abstract", "assert", "break", "case", "catch", "const", "continue", "default", "else", "enum", "final", "finally", "for", "if", "import", "instanceof", "long", "native", "new", "package", "private", "private", "protected", "protected", "public", "public", "return", "static", "strictfp", "switch", "synchronized", "throw", "throws", "transient", "try", "void", "volatile", "while"] as Any,
        "literal": "P2D P3D HALF_PI PI QUARTER_PI TAU TWO_PI null true false" as Any,
        "title": "setup draw" as Any,
        "variable": "super this" as Any,
        "built_in": ["displayHeight", "displayWidth", "mouseY", "mouseX", "mousePressed", "pmouseX", "pmouseY", "key", "keyCode", "pixels", "focused", "frameCount", "frameRate", "height", "width", "size", "createGraphics", "beginDraw", "createShape", "loadShape", "PShape", "arc", "ellipse", "line", "point", "quad", "rect", "triangle", "bezier", "bezierDetail", "bezierPoint", "bezierTangent", "curve", "curveDetail", "curvePoint", "curveTangent", "curveTightness", "shape", "shapeMode", "beginContour", "beginShape", "bezierVertex", "curveVertex", "endContour", "endShape", "quadraticVertex", "vertex", "ellipseMode", "noSmooth", "rectMode", "smooth", "strokeCap", "strokeJoin", "strokeWeight", "mouseClicked", "mouseDragged", "mouseMoved", "mousePressed", "mouseReleased", "mouseWheel", "keyPressed", "keyPressedkeyReleased", "keyTyped", "print", "println", "save", "saveFrame", "day", "hour", "millis", "minute", "month", "second", "year", "background", "clear", "colorMode", "fill", "noFill", "noStroke", "stroke", "alpha", "blue", "brightness", "color", "green", "hue", "lerpColor", "red", "saturation", "modelX", "modelY", "modelZ", "screenX", "screenY", "screenZ", "ambient", "emissive", "shininess", "specular", "add", "createImage", "beginCamera", "camera", "endCamera", "frustum", "ortho", "perspective", "printCamera", "printProjection", "cursor", "frameRate", "noCursor", "exit", "loop", "noLoop", "popStyle", "pushStyle", "redraw", "binary", "boolean", "byte", "char", "float", "hex", "int", "str", "unbinary", "unhex", "join", "match", "matchAll", "nf", "nfc", "nfp", "nfs", "split", "splitTokens", "trim", "append", "arrayCopy", "concat", "expand", "reverse", "shorten", "sort", "splice", "subset", "box", "sphere", "sphereDetail", "createInput", "createReader", "loadBytes", "loadJSONArray", "loadJSONObject", "loadStrings", "loadTable", "loadXML", "open", "parseXML", "saveTable", "selectFolder", "selectInput", "beginRaw", "beginRecord", "createOutput", "createWriter", "endRaw", "endRecord", "PrintWritersaveBytes", "saveJSONArray", "saveJSONObject", "saveStream", "saveStrings", "saveXML", "selectOutput", "popMatrix", "printMatrix", "pushMatrix", "resetMatrix", "rotate", "rotateX", "rotateY", "rotateZ", "scale", "shearX", "shearY", "translate", "ambientLight", "directionalLight", "lightFalloff", "lights", "lightSpecular", "noLights", "normal", "pointLight", "spotLight", "image", "imageMode", "loadImage", "noTint", "requestImage", "tint", "texture", "textureMode", "textureWrap", "blend", "copy", "filter", "get", "loadPixels", "set", "updatePixels", "blendMode", "loadShader", "PShaderresetShader", "shader", "createFont", "loadFont", "text", "textFont", "textAlign", "textLeading", "textMode", "textSize", "textWidth", "textAscent", "textDescent", "abs", "ceil", "constrain", "dist", "exp", "floor", "lerp", "log", "mag", "map", "max", "min", "norm", "pow", "round", "sq", "sqrt", "acos", "asin", "atan", "atan2", "cos", "degrees", "radians", "sin", "tan", "noise", "noiseDetail", "noiseSeed", "random", "randomGaussian", "randomSeed", "BufferedReader", "PVector", "PFont", "PImage", "PGraphics", "HashMap", "String", "Array", "FloatDict", "ArrayList", "FloatList", "IntDict", "IntList", "JSONArray", "JSONObject", "Object", "StringDict", "StringList", "Table", "TableRow", "XML"] as Any,
        "type": ["boolean", "byte", "char", "color", "double", "float", "int", "long", "short"] as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.scope = .single("[object Object]")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("class"), .regex("\\s+"), .regex("[a-zA-Z]\\w*"), .regex("\\s+"), .regex("extends"), .regex("\\s+"), .regex("[a-zA-Z]\\w*")])
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .array([.regex("class"), .regex("\\s+"), .regex("[a-zA-Z]\\w*")])
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("new\\s+"), .regex("[a-zA-Z]\\w*")])
            mode.scope = .single("[object Object]")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("(?:displayHeight|displayWidth|mouseY|mouseX|mousePressed|pmouseX|pmouseY|key|keyCode|pixels|focused|frameCount|frameRate|height|width|size|createGraphics|beginDraw|createShape|loadShape|PShape|arc|ellipse|line|point|quad|rect|triangle|bezier|bezierDetail|bezierPoint|bezierTangent|curve|curveDetail|curvePoint|curveTangent|curveTightness|shape|shapeMode|beginContour|beginShape|bezierVertex|curveVertex|endContour|endShape|quadraticVertex|vertex|ellipseMode|noSmooth|rectMode|smooth|strokeCap|strokeJoin|strokeWeight|mouseClicked|mouseDragged|mouseMoved|mousePressed|mouseReleased|mouseWheel|keyPressed|keyPressedkeyReleased|keyTyped|print|println|save|saveFrame|day|hour|millis|minute|month|second|year|background|clear|colorMode|fill|noFill|noStroke|stroke|alpha|blue|brightness|color|green|hue|lerpColor|red|saturation|modelX|modelY|modelZ|screenX|screenY|screenZ|ambient|emissive|shininess|specular|add|createImage|beginCamera|camera|endCamera|frustum|ortho|perspective|printCamera|printProjection|cursor|frameRate|noCursor|exit|loop|noLoop|popStyle|pushStyle|redraw|binary|boolean|byte|char|float|hex|int|str|unbinary|unhex|join|match|matchAll|nf|nfc|nfp|nfs|split|splitTokens|trim|append|arrayCopy|concat|expand|reverse|shorten|sort|splice|subset|box|sphere|sphereDetail|createInput|createReader|loadBytes|loadJSONArray|loadJSONObject|loadStrings|loadTable|loadXML|open|parseXML|saveTable|selectFolder|selectInput|beginRaw|beginRecord|createOutput|createWriter|endRaw|endRecord|PrintWritersaveBytes|saveJSONArray|saveJSONObject|saveStream|saveStrings|saveXML|selectOutput|popMatrix|printMatrix|pushMatrix|resetMatrix|rotate|rotateX|rotateY|rotateZ|scale|shearX|shearY|translate|ambientLight|directionalLight|lightFalloff|lights|lightSpecular|noLights|normal|pointLight|spotLight|image|imageMode|loadImage|noTint|requestImage|tint|texture|textureMode|textureWrap|blend|copy|filter|get|loadPixels|set|updatePixels|blendMode|loadShader|PShaderresetShader|shader|createFont|loadFont|text|textFont|textAlign|textLeading|textMode|textSize|textWidth|textAscent|textDescent|abs|ceil|constrain|dist|exp|floor|lerp|log|mag|map|max|min|norm|pow|round|sq|sqrt|acos|asin|atan|atan2|cos|degrees|radians|sin|tan|noise|noiseDetail|noiseSeed|random|randomGaussian|randomSeed)(?=\\s*\\()")
                    mode.scope = .single("built_in")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("/\\b(?!for|if|while)/[a-zA-Z]\\w*(?=\\s*\\()")
                    mode.scope = .single("title.function")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("\\."), .regex("[a-zA-Z]\\w*")])
            mode.scope = .single("[object Object]")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode(CommonModes.C_NUMBER_MODE()),
    ]

    return lang
}

/// Register processing language
public extension HighlightJS {
    func registerProcessing() {
        registerLanguage("processing", definition: processingLanguage)
    }
}
