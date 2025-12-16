// Auto-generated from highlight.js
// Language: scss

import Foundation

/// scss language definition
public func scssLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "SCSS"

    lang.caseInsensitive = true
    lang.illegal = .regex("[=/|']")
    lang.contains = [
        .mode(CommonModes.C_LINE_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b\\d+(\\.\\d+)?(%|em|ex|ch|rem|vw|vh|vmin|vmax|cm|mm|in|pt|pc|px|deg|grad|rad|turn|s|ms|Hz|kHz|dpi|dpcm|dppx)?")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#[A-Za-z0-9_-]+")
            mode.scope = .single("selector-id")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\.[A-Za-z0-9_-]+")
            mode.scope = .single("selector-class")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\[")
            mode.end = .regex("\\]")
            mode.scope = .single("selector-attr")
            mode.illegal = .regex("$")
            mode.contains = [
                .mode(CommonModes.APOS_STRING_MODE()),
                .mode(CommonModes.QUOTE_STRING_MODE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(a|abbr|address|article|aside|audio|b|blockquote|body|button|canvas|caption|cite|code|dd|del|details|dfn|div|dl|dt|em|fieldset|figcaption|figure|footer|form|h1|h2|h3|h4|h5|h6|header|hgroup|html|i|iframe|img|input|ins|kbd|label|legend|li|main|mark|menu|nav|object|ol|optgroup|option|p|picture|q|quote|samp|section|select|source|span|strong|summary|sup|table|tbody|td|textarea|tfoot|th|thead|time|tr|ul|var|video|defs|g|marker|mask|pattern|svg|switch|symbol|feBlend|feColorMatrix|feComponentTransfer|feComposite|feConvolveMatrix|feDiffuseLighting|feDisplacementMap|feFlood|feGaussianBlur|feImage|feMerge|feMorphology|feOffset|feSpecularLighting|feTile|feTurbulence|linearGradient|radialGradient|stop|circle|ellipse|image|line|path|polygon|polyline|rect|text|use|textPath|tspan|foreignObject|clipPath)\\b")
            mode.scope = .single("selector-tag")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(":(where|visited|valid|user-invalid|target-within|target|scope|root|right|required|read-write|read-only|placeholder-shown|past|out-of-range|optional|only-of-type|only-child|nth-of-type|nth-last-of-type|nth-last-col|nth-last-child|nth-col|nth-child|not|local-link|link|left|last-of-type|last-child|lang|is|invalid|indeterminate|in-range|hover|host-context|host|has|future|fullscreen|focus-within|focus-visible|focus|first-of-type|first-child|first|enabled|empty|drop|disabled|dir|defined|default|current|checked|blank|any-link|active)")
            mode.scope = .single("selector-pseudo")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(":(:)?(spelling-error|slotted|selection|placeholder|part|marker|grammar-error|first-line|first-letter|cue-region|cue|before|backdrop|after)")
            mode.scope = .single("selector-pseudo")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(\\$[a-zA-Z-][a-zA-Z0-9_-]*)\\b")
            mode.scope = .single("variable")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\(")
            mode.end = .regex("\\)")
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("--[A-Za-z_][A-Za-z0-9_-]*")
            mode.scope = .single("attr")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(zoom|z-index|writing-mode|word-wrap|word-spacing|word-break|will-change|width|widows|white-space|visibility|vertical-align|user-select|unicode-bidi|translate|transition-timing-function|transition-property|transition-duration|transition-delay|transition|transform-style|transform-origin|transform|touch-action|top|text-underline-position|text-transform|text-shadow|text-rendering|text-overflow|text-orientation|text-justify|text-indent|text-decoration-style|text-decoration-line|text-decoration-color|text-decoration|text-align-last|text-align|table-layout|tab-size|stroke-width|stroke-linejoin|stroke-linecap|stroke-dashoffset|stroke-dasharray|stroke|shape-outside|scroll-snap-type|scroll-snap-align|scroll-padding|scroll-margin|scroll-behavior|scale|row-gap|rotate|right|resize|quotes|position|pointer-events|place-self|place-items|place-content|perspective-origin|perspective|padding-top|padding-right|padding-left|padding-inline|padding-bottom|padding-block|padding|overflow-y|overflow-x|overflow-wrap|overflow-anchor|overflow|outline-width|outline-style|outline-offset|outline-color|outline|orphans|order|opacity|offset|object-position|object-fit|mix-blend-mode|min-width|min-inline-size|min-height|min-block-size|max-width|max-inline-size|max-height|max-block-size|mask-image|mask|margin-top|margin-right|margin-left|margin-inline|margin-bottom|margin-block|margin|list-style-type|list-style-position|list-style-image|list-style|line-height|letter-spacing|left|justify-self|justify-items|justify-content|isolation|inset|inline-size|image-rendering|hyphens|height|grid-template-rows|grid-template-columns|grid-template-areas|grid-template|grid-row|grid-gap|grid-column|grid-auto-rows|grid-auto-flow|grid-auto-columns|grid-area|grid|gap|font-weight|font-variant|font-style|font-stretch|font-size-adjust|font-size|font-kerning|font-feature-settings|font-family|font|float|flex-wrap|flex-shrink|flex-grow|flex-flow|flex-direction|flex-basis|flex|filter|fill-rule|fill-opacity|fill|empty-cells|display|direction|cursor|counter-reset|counter-increment|content|contain|columns|column-width|column-span|column-rule|column-gap|column-fill|column-count|color|clip-path|clip|clear|caret-color|caption-side|break-inside|break-before|break-after|box-sizing|box-shadow|box-decoration-break|bottom|border-width|border-top|border-style|border-spacing|border-right|border-radius|border-left|border-inline|border-image|border-color|border-collapse|border-bottom-width|border-bottom-style|border-bottom-right-radius|border-bottom-left-radius|border-bottom-color|border-bottom|border-block-start|border-block-end|border-block-color|border-block|border|block-size|background-size|background-repeat|background-position|background-origin|background-image|background-color|background-clip|background-blend-mode|background-attachment|background|backface-visibility|backdrop-filter|aspect-ratio|appearance|animation-timing-function|animation-play-state|animation-name|animation-iteration-count|animation-fill-mode|animation-duration|animation-direction|animation-delay|animation|all|alignment-baseline|align-self|align-items|align-content|accent-color)\\b")
            mode.scope = .single("attribute")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(whitespace|wait|w-resize|visible|vertical-text|vertical-ideographic|uppercase|upper-roman|upper-alpha|underline|transparent|top|thin|thick|text|text-top|text-bottom|tb-rl|table-header-group|table-footer-group|sw-resize|super|strict|static|square|solid|small-caps|separate|se-resize|scroll|s-resize|rtl|row-resize|ridge|right|repeat|repeat-y|repeat-x|relative|progress|pointer|overline|outside|outset|oblique|nowrap|not-allowed|normal|none|nw-resize|no-repeat|no-drop|newspaper|ne-resize|n-resize|move|middle|medium|ltr|lr-tb|lowercase|lower-roman|lower-alpha|loose|list-item|line|line-through|line-edge|lighter|left|keep-all|justify|italic|inter-word|inter-ideograph|inside|inset|inline|inline-block|inherit|inactive|ideograph-space|ideograph-parenthesis|ideograph-numeric|ideograph-alpha|horizontal|hidden|help|hand|groove|fixed|ellipsis|e-resize|double|dotted|distribute|distribute-space|distribute-letter|distribute-all-lines|disc|disabled|default|decimal|dashed|crosshair|collapse|col-resize|circle|char|center|capitalize|break-word|break-all|bottom|both|bolder|bold|block|bidi-override|below|baseline|auto|always|all-scroll|absolute|table|table-cell)\\b")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(":")
            mode.end = .regex("[;}{]")
            mode.relevance = 0
            mode.contains = [
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_2 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("#(([0-9a-fA-F]{3,4})|(([0-9a-fA-F]{2}){3,4}))\\b")
                    mode.scope = .single("number")
                    return mode
                }()),
                /* circular ref: __ref_0 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\b[Uu]\\+[0-9A-Fa-f][0-9A-Fa-f?]{0,4}(-[0-9A-Fa-f][0-9A-Fa-f]{0,4})?")
                    mode.scope = .single("number")
                    return mode
                }()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                /* circular ref: __ref_4 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("!important")
                    mode.scope = .single("meta")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[\\w-]+(?=\\()")
                    mode.scope = .single("built_in")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@(page|font-face)")
            mode.keywords = .grouped([
                "keyword": "@page @font-face" as Any,
            ])

            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@")
            mode.end = .regex("[{;]")
            mode.keywords = .grouped([
                "keyword": "and or not only" as Any,
                "attribute": "width update scripting scan resolution prefers-reduced-transparency prefers-reduced-motion prefers-contrast prefers-color-scheme pointer overflow-inline overflow-block orientation monochrome min-width min-height max-width max-height inverted-colors hover height grid forced-colors display-mode device-width device-height device-aspect-ratio color-index color-gamut color aspect-ratio any-pointer any-hover" as Any,
            ])

            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("@[a-z-]+")
                    mode.scope = .single("keyword")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[a-z-]+(?=:)")
                    mode.scope = .single("attribute")
                    return mode
                }()),
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                /* circular ref: __ref_4 */ .mode(Mode()),
                /* circular ref: __ref_5 */ .mode(Mode()),
                /* circular ref: __ref_0 */ .mode(Mode()),
            ]
            return mode
        }()),
        /* circular ref: __ref_6 */ .mode(Mode()),
    ]

    return lang
}

/// Register scss language
public extension HighlightJS {
    func registerScss() {
        registerLanguage("scss", definition: scssLanguage)
    }
}
