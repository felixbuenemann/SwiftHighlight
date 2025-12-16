#!/usr/bin/env node

/**
 * Language Definition Converter
 * Converts highlight.js JavaScript language definitions to Swift
 *
 * Usage: node convert-languages.js [language-name]
 *        node convert-languages.js --all
 */

const fs = require('fs');
const path = require('path');
const vm = require('vm');

// Path to highlight.js source
const HLJS_SRC = path.join(__dirname, '../../src');
const OUTPUT_DIR = path.join(__dirname, '../Sources/SwiftHighlight/Languages');

// Built-in modes that need to be referenced by name in Swift
const BUILTIN_MODES = new Set([
    'BACKSLASH_ESCAPE',
    'APOS_STRING_MODE',
    'QUOTE_STRING_MODE',
    'C_LINE_COMMENT_MODE',
    'C_BLOCK_COMMENT_MODE',
    'HASH_COMMENT_MODE',
    'NUMBER_MODE',
    'C_NUMBER_MODE',
    'BINARY_NUMBER_MODE',
    'REGEXP_MODE',
    'TITLE_MODE',
    'UNDERSCORE_TITLE_MODE',
    'METHOD_GUARD'
]);

// Create a mock for css-shared.js exports (used by less, scss, stylus)
function createCssSharedMock(hljs) {
    const HTML_TAGS = [
        'a', 'abbr', 'address', 'article', 'aside', 'audio', 'b', 'blockquote', 'body', 'button',
        'canvas', 'caption', 'cite', 'code', 'dd', 'del', 'details', 'dfn', 'div', 'dl', 'dt',
        'em', 'fieldset', 'figcaption', 'figure', 'footer', 'form', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6',
        'header', 'hgroup', 'html', 'i', 'iframe', 'img', 'input', 'ins', 'kbd', 'label', 'legend',
        'li', 'main', 'mark', 'menu', 'nav', 'object', 'ol', 'optgroup', 'option', 'p', 'picture',
        'q', 'quote', 'samp', 'section', 'select', 'source', 'span', 'strong', 'summary', 'sup',
        'table', 'tbody', 'td', 'textarea', 'tfoot', 'th', 'thead', 'time', 'tr', 'ul', 'var', 'video'
    ];

    const SVG_TAGS = [
        'defs', 'g', 'marker', 'mask', 'pattern', 'svg', 'switch', 'symbol',
        'feBlend', 'feColorMatrix', 'feComponentTransfer', 'feComposite', 'feConvolveMatrix',
        'feDiffuseLighting', 'feDisplacementMap', 'feFlood', 'feGaussianBlur', 'feImage',
        'feMerge', 'feMorphology', 'feOffset', 'feSpecularLighting', 'feTile', 'feTurbulence',
        'linearGradient', 'radialGradient', 'stop', 'circle', 'ellipse', 'image', 'line',
        'path', 'polygon', 'polyline', 'rect', 'text', 'use', 'textPath', 'tspan',
        'foreignObject', 'clipPath'
    ];

    const TAGS = [...HTML_TAGS, ...SVG_TAGS];

    const MEDIA_FEATURES = [
        'any-hover', 'any-pointer', 'aspect-ratio', 'color', 'color-gamut', 'color-index',
        'device-aspect-ratio', 'device-height', 'device-width', 'display-mode', 'forced-colors',
        'grid', 'height', 'hover', 'inverted-colors', 'monochrome', 'orientation', 'overflow-block',
        'overflow-inline', 'pointer', 'prefers-color-scheme', 'prefers-contrast',
        'prefers-reduced-motion', 'prefers-reduced-transparency', 'resolution', 'scan',
        'scripting', 'update', 'width', 'min-width', 'max-width', 'min-height', 'max-height'
    ].sort().reverse();

    const PSEUDO_CLASSES = [
        'active', 'any-link', 'blank', 'checked', 'current', 'default', 'defined', 'dir',
        'disabled', 'drop', 'empty', 'enabled', 'first', 'first-child', 'first-of-type',
        'fullscreen', 'future', 'focus', 'focus-visible', 'focus-within', 'has', 'host',
        'host-context', 'hover', 'indeterminate', 'in-range', 'invalid', 'is', 'lang',
        'last-child', 'last-of-type', 'left', 'link', 'local-link', 'not', 'nth-child',
        'nth-col', 'nth-last-child', 'nth-last-col', 'nth-last-of-type', 'nth-of-type',
        'only-child', 'only-of-type', 'optional', 'out-of-range', 'past', 'placeholder-shown',
        'read-only', 'read-write', 'required', 'right', 'root', 'scope', 'target',
        'target-within', 'user-invalid', 'valid', 'visited', 'where'
    ].sort().reverse();

    const PSEUDO_ELEMENTS = [
        'after', 'backdrop', 'before', 'cue', 'cue-region', 'first-letter', 'first-line',
        'grammar-error', 'marker', 'part', 'placeholder', 'selection', 'slotted', 'spelling-error'
    ].sort().reverse();

    const PSEUDO_SELECTORS = [...PSEUDO_CLASSES, ...PSEUDO_ELEMENTS].sort().reverse();

    const ATTRIBUTES = [
        'accent-color', 'align-content', 'align-items', 'align-self', 'alignment-baseline', 'all',
        'animation', 'animation-delay', 'animation-direction', 'animation-duration',
        'animation-fill-mode', 'animation-iteration-count', 'animation-name', 'animation-play-state',
        'animation-timing-function', 'appearance', 'aspect-ratio', 'backdrop-filter',
        'backface-visibility', 'background', 'background-attachment', 'background-blend-mode',
        'background-clip', 'background-color', 'background-image', 'background-origin',
        'background-position', 'background-repeat', 'background-size', 'block-size', 'border',
        'border-block', 'border-block-color', 'border-block-end', 'border-block-start',
        'border-bottom', 'border-bottom-color', 'border-bottom-left-radius',
        'border-bottom-right-radius', 'border-bottom-style', 'border-bottom-width', 'border-collapse',
        'border-color', 'border-image', 'border-inline', 'border-left', 'border-radius',
        'border-right', 'border-spacing', 'border-style', 'border-top', 'border-width', 'bottom',
        'box-decoration-break', 'box-shadow', 'box-sizing', 'break-after', 'break-before',
        'break-inside', 'caption-side', 'caret-color', 'clear', 'clip', 'clip-path', 'color',
        'column-count', 'column-fill', 'column-gap', 'column-rule', 'column-span', 'column-width',
        'columns', 'contain', 'content', 'counter-increment', 'counter-reset', 'cursor', 'direction',
        'display', 'empty-cells', 'fill', 'fill-opacity', 'fill-rule', 'filter', 'flex', 'flex-basis',
        'flex-direction', 'flex-flow', 'flex-grow', 'flex-shrink', 'flex-wrap', 'float', 'font',
        'font-family', 'font-feature-settings', 'font-kerning', 'font-size', 'font-size-adjust',
        'font-stretch', 'font-style', 'font-variant', 'font-weight', 'gap', 'grid', 'grid-area',
        'grid-auto-columns', 'grid-auto-flow', 'grid-auto-rows', 'grid-column', 'grid-gap',
        'grid-row', 'grid-template', 'grid-template-areas', 'grid-template-columns',
        'grid-template-rows', 'height', 'hyphens', 'image-rendering', 'inline-size', 'inset',
        'isolation', 'justify-content', 'justify-items', 'justify-self', 'left', 'letter-spacing',
        'line-height', 'list-style', 'list-style-image', 'list-style-position', 'list-style-type',
        'margin', 'margin-block', 'margin-bottom', 'margin-inline', 'margin-left', 'margin-right',
        'margin-top', 'mask', 'mask-image', 'max-block-size', 'max-height', 'max-inline-size',
        'max-width', 'min-block-size', 'min-height', 'min-inline-size', 'min-width', 'mix-blend-mode',
        'object-fit', 'object-position', 'offset', 'opacity', 'order', 'orphans', 'outline',
        'outline-color', 'outline-offset', 'outline-style', 'outline-width', 'overflow',
        'overflow-anchor', 'overflow-wrap', 'overflow-x', 'overflow-y', 'padding', 'padding-block',
        'padding-bottom', 'padding-inline', 'padding-left', 'padding-right', 'padding-top',
        'perspective', 'perspective-origin', 'place-content', 'place-items', 'place-self',
        'pointer-events', 'position', 'quotes', 'resize', 'right', 'rotate', 'row-gap', 'scale',
        'scroll-behavior', 'scroll-margin', 'scroll-padding', 'scroll-snap-align', 'scroll-snap-type',
        'shape-outside', 'stroke', 'stroke-dasharray', 'stroke-dashoffset', 'stroke-linecap',
        'stroke-linejoin', 'stroke-width', 'tab-size', 'table-layout', 'text-align', 'text-align-last',
        'text-decoration', 'text-decoration-color', 'text-decoration-line', 'text-decoration-style',
        'text-indent', 'text-justify', 'text-orientation', 'text-overflow', 'text-rendering',
        'text-shadow', 'text-transform', 'text-underline-position', 'top', 'touch-action', 'transform',
        'transform-origin', 'transform-style', 'transition', 'transition-delay', 'transition-duration',
        'transition-property', 'transition-timing-function', 'translate', 'unicode-bidi',
        'user-select', 'vertical-align', 'visibility', 'white-space', 'widows', 'width', 'will-change',
        'word-break', 'word-spacing', 'word-wrap', 'writing-mode', 'z-index', 'zoom'
    ].sort().reverse();

    return {
        MODES: (hljs) => ({
            IMPORTANT: {
                scope: 'meta',
                begin: '!important'
            },
            BLOCK_COMMENT: hljs.C_BLOCK_COMMENT_MODE,
            HEXCOLOR: {
                scope: 'number',
                begin: /#(([0-9a-fA-F]{3,4})|(([0-9a-fA-F]{2}){3,4}))\b/
            },
            UNICODE_RANGE: {
                scope: 'number',
                begin: /\b[Uu]\+[0-9A-Fa-f][0-9A-Fa-f?]{0,4}(-[0-9A-Fa-f][0-9A-Fa-f]{0,4})?/
            },
            FUNCTION_DISPATCH: {
                className: 'built_in',
                begin: /[\w-]+(?=\()/
            },
            ATTRIBUTE_SELECTOR_MODE: {
                scope: 'selector-attr',
                begin: /\[/,
                end: /\]/,
                illegal: '$',
                contains: [
                    hljs.APOS_STRING_MODE,
                    hljs.QUOTE_STRING_MODE
                ]
            },
            CSS_NUMBER_MODE: {
                scope: 'number',
                begin: hljs.NUMBER_RE + '(' +
                    '%|em|ex|ch|rem' +
                    '|vw|vh|vmin|vmax' +
                    '|cm|mm|in|pt|pc|px' +
                    '|deg|grad|rad|turn' +
                    '|s|ms' +
                    '|Hz|kHz' +
                    '|dpi|dpcm|dppx' +
                    ')?',
                relevance: 0
            },
            CSS_VARIABLE: {
                className: 'attr',
                begin: /--[A-Za-z_][A-Za-z0-9_-]*/
            }
        }),
        TAGS,
        MEDIA_FEATURES,
        PSEUDO_CLASSES,
        PSEUDO_ELEMENTS,
        PSEUDO_SELECTORS,
        ATTRIBUTES
    };
}

// Create a mock hljs object for language definition execution
function createMockHljs() {
    const regex = {
        concat: (...args) => args.map(a => {
            if (typeof a === 'string') return a;
            if (a instanceof RegExp) return a.source;
            return String(a);
        }).join(''),
        either: (...args) => {
            const patterns = args.map(a => {
                if (typeof a === 'string') return a;
                if (a instanceof RegExp) return a.source;
                return String(a);
            });
            return '(?:' + patterns.join('|') + ')';
        },
        lookahead: (pattern) => {
            const src = typeof pattern === 'string' ? pattern : pattern.source;
            return '(?=' + src + ')';
        },
        optional: (pattern) => {
            const src = typeof pattern === 'string' ? pattern : pattern.source;
            return '(?:' + src + ')?';
        },
        anyNumberOfTimes: (pattern) => {
            const src = typeof pattern === 'string' ? pattern : pattern.source;
            return '(?:' + src + ')*';
        }
    };

    return {
        regex,

        // Common patterns
        IDENT_RE: '[a-zA-Z]\\w*',
        UNDERSCORE_IDENT_RE: '[a-zA-Z_]\\w*',
        NUMBER_RE: '\\b\\d+(\\.\\d+)?',
        C_NUMBER_RE: '(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)',
        BINARY_NUMBER_RE: '\\b(0b[01]+)',
        RE_STARTERS_RE: '!|!=|!==|%|%=|&|&&|&=|\\*|\\*=|\\+|\\+=|,|-|-=|/=|/|:|;|<<|<<=|<=|<|===|==|=|>>>=|>>=|>=|>>>|>>|>|\\?|\\[|\\{|\\(|\\^|\\^=|\\||\\|=|\\|\\||~',

        // Built-in modes (marked for later substitution)
        BACKSLASH_ESCAPE: { __builtin: 'BACKSLASH_ESCAPE', begin: '\\\\[\\s\\S]', relevance: 0 },

        APOS_STRING_MODE: {
            __builtin: 'APOS_STRING_MODE',
            scope: 'string',
            begin: "'",
            end: "'",
            illegal: '\\n',
            contains: [{ __builtin: 'BACKSLASH_ESCAPE' }]
        },

        QUOTE_STRING_MODE: {
            __builtin: 'QUOTE_STRING_MODE',
            scope: 'string',
            begin: '"',
            end: '"',
            illegal: '\\n',
            contains: [{ __builtin: 'BACKSLASH_ESCAPE' }]
        },

        C_LINE_COMMENT_MODE: {
            __builtin: 'C_LINE_COMMENT_MODE',
            scope: 'comment',
            begin: '//',
            end: '$'
        },

        C_BLOCK_COMMENT_MODE: {
            __builtin: 'C_BLOCK_COMMENT_MODE',
            scope: 'comment',
            begin: '/\\*',
            end: '\\*/'
        },

        HASH_COMMENT_MODE: {
            __builtin: 'HASH_COMMENT_MODE',
            scope: 'comment',
            begin: '#',
            end: '$'
        },

        NUMBER_MODE: {
            __builtin: 'NUMBER_MODE',
            scope: 'number',
            begin: '\\b\\d+(\\.\\d+)?',
            relevance: 0
        },

        C_NUMBER_MODE: {
            __builtin: 'C_NUMBER_MODE',
            scope: 'number',
            begin: '(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)',
            relevance: 0
        },

        BINARY_NUMBER_MODE: {
            __builtin: 'BINARY_NUMBER_MODE',
            scope: 'number',
            begin: '\\b(0b[01]+)',
            relevance: 0
        },

        REGEXP_MODE: {
            __builtin: 'REGEXP_MODE',
            scope: 'regexp',
            begin: '/(?=[^/\\n]*/)',
            end: '/[gimuy]*',
            illegal: '\\n'
        },

        TITLE_MODE: {
            __builtin: 'TITLE_MODE',
            scope: 'title',
            begin: '[a-zA-Z]\\w*',
            relevance: 0
        },

        UNDERSCORE_TITLE_MODE: {
            __builtin: 'UNDERSCORE_TITLE_MODE',
            scope: 'title',
            begin: '[a-zA-Z_]\\w*',
            relevance: 0
        },

        // Helper functions
        COMMENT: (begin, end, options = {}) => ({
            __builtin: 'COMMENT',
            scope: 'comment',
            begin: typeof begin === 'string' ? begin : begin.source,
            end: typeof end === 'string' ? end : end.source,
            ...options
        }),

        SHEBANG: (options = {}) => ({
            __builtin: 'SHEBANG',
            scope: 'meta',
            begin: options.binary ?
                `#![\\s]*/.*\\b${options.binary}\\b` :
                '#![\\s]*/.*',
            end: '$',
            relevance: options.relevance || 5,
            ...options
        }),

        inherit: (parent, ...objects) => {
            const result = { ...parent };
            for (const obj of objects) {
                Object.assign(result, obj);
            }
            return result;
        },

        END_SAME_AS_BEGIN: (mode) => ({
            __endSameAsBegin: true,
            ...mode
        })
    };
}

// Serialize a language definition to a JSON-compatible structure
function serializeLanguage(lang, name) {
    const seen = new WeakSet();
    let selfRefId = 0;
    const selfRefs = new Map();

    function serialize(obj, depth = 0) {
        if (depth > 50) return { __error: 'max depth exceeded' };

        if (obj === null || obj === undefined) return null;

        if (typeof obj === 'string') return obj;
        if (typeof obj === 'number') return obj;
        if (typeof obj === 'boolean') return obj;

        // Check for RegExp - also handles cross-realm regexps from vm.runInNewContext
        if (obj instanceof RegExp || (obj && obj.constructor && obj.constructor.name === 'RegExp')) {
            return { __regex: obj.source, __flags: obj.flags || '' };
        }

        // Also check for duck-typing - if it has source and it's used as a pattern
        if (obj && typeof obj.source === 'string' && typeof obj.test === 'function') {
            return { __regex: obj.source, __flags: obj.flags || '' };
        }

        if (typeof obj === 'function') {
            // Functions can't be serialized - note them
            return { __function: true };
        }

        if (Array.isArray(obj)) {
            return obj.map(item => {
                if (typeof item === 'string' && item === 'self') {
                    return { __selfRef: true };
                }
                return serialize(item, depth + 1);
            });
        }

        if (typeof obj === 'object') {
            // Check for circular reference
            if (seen.has(obj)) {
                if (!selfRefs.has(obj)) {
                    selfRefs.set(obj, `__ref_${selfRefId++}`);
                }
                return { __circularRef: selfRefs.get(obj) };
            }
            seen.add(obj);

            const result = {};

            // Check for built-in mode
            if (obj.__builtin) {
                result.__builtin = obj.__builtin;
            }

            for (const key of Object.keys(obj)) {
                if (key.startsWith('__') && key !== '__builtin' && key !== '__endSameAsBegin') continue;

                const value = obj[key];

                // Handle 'self' references in contains arrays
                if (key === 'contains' && Array.isArray(value)) {
                    result[key] = value.map(item => {
                        if (item === 'self' || (typeof item === 'string' && item === 'self')) {
                            return { __selfRef: true };
                        }
                        return serialize(item, depth + 1);
                    });
                } else {
                    result[key] = serialize(value, depth + 1);
                }
            }

            return result;
        }

        return String(obj);
    }

    return {
        name: name,
        definition: serialize(lang)
    };
}

// Convert serialized JSON to Swift code
function generateSwift(serialized) {
    const { name, definition } = serialized;
    const swiftName = toPascalCase(name);
    const funcName = toSwiftFunctionName(name);

    let output = `// Auto-generated from highlight.js
// Language: ${name}

import Foundation

/// ${name} language definition
public func ${funcName}Language(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "${escapeSwiftString(definition.name || name)}"

`;

    // Add aliases
    if (definition.aliases && definition.aliases.length > 0) {
        output += `    lang.aliases = [${definition.aliases.map(a => `"${escapeSwiftString(a)}"`).join(', ')}]\n`;
    }

    // Add case insensitivity
    if (definition.case_insensitive || definition.caseInsensitive) {
        output += `    lang.caseInsensitive = true\n`;
    }

    // Add unicode regex
    if (definition.unicodeRegex) {
        output += `    lang.unicodeRegex = true\n`;
    }

    // Add keywords
    if (definition.keywords) {
        output += generateKeywords(definition.keywords, '    ', 'lang');
    }

    // Add illegal
    if (definition.illegal) {
        output += `    lang.illegal = ${generatePattern(definition.illegal)}\n`;
    }

    // Add contains
    if (definition.contains && definition.contains.length > 0) {
        output += `    lang.contains = [\n`;
        for (const mode of definition.contains) {
            output += generateMode(mode, '        ') + ',\n';
        }
        output += `    ]\n`;
    }

    output += `
    return lang
}

/// Register ${name} language
public extension HighlightJS {
    func register${swiftName}() {
        registerLanguage("${escapeSwiftString(name.toLowerCase())}", definition: ${funcName}Language)
    }
}
`;

    return output;
}

// Generate Swift code for a mode
function generateMode(mode, indent = '') {
    if (!mode) return `${indent}.mode(Mode())`;

    // Handle built-in mode references
    if (mode.__builtin) {
        const builtin = mode.__builtin;

        // Handle COMMENT which needs begin and end arguments
        if (builtin === 'COMMENT') {
            const begin = mode.begin ? escapeSwiftString(mode.begin) : '//';
            const end = mode.end ? escapeSwiftString(mode.end) : '$';
            return `${indent}.mode(CommonModes.COMMENT("${begin}", "${end}"))`;
        }

        // Handle SHEBANG which may have options
        if (builtin === 'SHEBANG') {
            if (mode.binary) {
                return `${indent}.mode(CommonModes.SHEBANG(binary: "${escapeSwiftString(mode.binary)}"))`;
            }
            return `${indent}.mode(CommonModes.SHEBANG())`;
        }

        // Default builtin
        return `${indent}.mode(CommonModes.${builtin}())`;
    }

    // Handle self-references
    if (mode.__selfRef) {
        return `${indent}.selfReference`;
    }

    // Handle circular references
    if (mode.__circularRef) {
        return `${indent}/* circular ref: ${mode.__circularRef} */ .mode(Mode())`;
    }

    let lines = [`${indent}.mode({`];
    lines.push(`${indent}    let mode = Mode()`);

    // Generate begin pattern
    if (mode.begin) {
        lines.push(`${indent}    mode.begin = ${generatePattern(mode.begin)}`);
    }

    // Generate match pattern (converted to begin)
    if (mode.match) {
        lines.push(`${indent}    mode.begin = ${generatePattern(mode.match)}`);
    }

    // Generate end pattern
    if (mode.end) {
        lines.push(`${indent}    mode.end = ${generatePattern(mode.end)}`);
    }

    // Generate scope/className
    if (mode.scope) {
        if (typeof mode.scope === 'string') {
            lines.push(`${indent}    mode.scope = .single("${mode.scope}")`);
        } else if (typeof mode.scope === 'object') {
            const entries = Object.entries(mode.scope)
                .map(([k, v]) => `${k}: "${v}"`)
                .join(', ');
            lines.push(`${indent}    mode.scope = .multi([${entries}])`);
        }
    } else if (mode.className) {
        lines.push(`${indent}    mode.scope = .single("${mode.className}")`);
    }

    // Generate beginScope
    if (mode.beginScope) {
        if (typeof mode.beginScope === 'string') {
            lines.push(`${indent}    mode.beginScope = .single("${mode.beginScope}")`);
        } else if (typeof mode.beginScope === 'object') {
            const entries = Object.entries(mode.beginScope)
                .map(([k, v]) => `${k}: "${v}"`)
                .join(', ');
            lines.push(`${indent}    mode.beginScope = .multi([${entries}])`);
        }
    }

    // Generate endScope
    if (mode.endScope) {
        if (typeof mode.endScope === 'string') {
            lines.push(`${indent}    mode.endScope = .single("${mode.endScope}")`);
        } else if (typeof mode.endScope === 'object') {
            const entries = Object.entries(mode.endScope)
                .map(([k, v]) => `${k}: "${v}"`)
                .join(', ');
            lines.push(`${indent}    mode.endScope = .multi([${entries}])`);
        }
    }

    // Generate keywords
    if (mode.keywords) {
        lines.push(generateKeywords(mode.keywords, indent + '    '));
    }

    // Generate beginKeywords
    if (mode.beginKeywords) {
        lines.push(`${indent}    mode.beginKeywords = "${escapeSwiftString(mode.beginKeywords)}"`);
    }

    // Generate illegal
    if (mode.illegal) {
        lines.push(`${indent}    mode.illegal = ${generatePattern(mode.illegal)}`);
    }

    // Generate flags
    if (mode.relevance !== undefined && mode.relevance !== null) {
        lines.push(`${indent}    mode.relevance = ${mode.relevance}`);
    }
    if (mode.endsParent) {
        lines.push(`${indent}    mode.endsParent = true`);
    }
    if (mode.endsWithParent) {
        lines.push(`${indent}    mode.endsWithParent = true`);
    }
    if (mode.excludeBegin) {
        lines.push(`${indent}    mode.excludeBegin = true`);
    }
    if (mode.excludeEnd) {
        lines.push(`${indent}    mode.excludeEnd = true`);
    }
    if (mode.returnBegin) {
        lines.push(`${indent}    mode.returnBegin = true`);
    }
    if (mode.returnEnd) {
        lines.push(`${indent}    mode.returnEnd = true`);
    }
    if (mode.skip) {
        lines.push(`${indent}    mode.skip = true`);
    }

    // Generate subLanguage
    if (mode.subLanguage) {
        if (typeof mode.subLanguage === 'string') {
            lines.push(`${indent}    mode.subLanguage = .single("${mode.subLanguage}")`);
        } else if (Array.isArray(mode.subLanguage)) {
            lines.push(`${indent}    mode.subLanguage = .multiple([${mode.subLanguage.map(s => `"${s}"`).join(', ')}])`);
        }
    }

    // Generate contains
    if (mode.contains && mode.contains.length > 0) {
        lines.push(`${indent}    mode.contains = [`);
        for (const child of mode.contains) {
            lines.push(generateMode(child, indent + '        ') + ',');
        }
        lines.push(`${indent}    ]`);
    }

    // Generate variants
    if (mode.variants && mode.variants.length > 0) {
        lines.push(`${indent}    mode.variants = [`);
        for (const variant of mode.variants) {
            // Variants are Mode objects, not ModeReferences
            lines.push(generateVariantMode(variant, indent + '        ') + ',');
        }
        lines.push(`${indent}    ]`);
    }

    // Generate starts
    if (mode.starts) {
        lines.push(`${indent}    mode.starts = {`);
        lines.push(generateVariantMode(mode.starts, indent + '        '));
        lines.push(`${indent}    }()`);
    }

    lines.push(`${indent}    return mode`);
    lines.push(`${indent}}())`);

    return lines.join('\n');
}

// Generate a variant mode (not wrapped in ModeReference)
function generateVariantMode(mode, indent = '') {
    if (!mode) return `${indent}Mode()`;

    let lines = [];
    lines.push(`${indent}{`);
    lines.push(`${indent}    let mode = Mode()`);

    // Same properties as regular mode
    if (mode.begin) {
        lines.push(`${indent}    mode.begin = ${generatePattern(mode.begin)}`);
    }
    if (mode.match) {
        lines.push(`${indent}    mode.begin = ${generatePattern(mode.match)}`);
    }
    if (mode.end) {
        lines.push(`${indent}    mode.end = ${generatePattern(mode.end)}`);
    }
    if (mode.scope) {
        if (typeof mode.scope === 'string') {
            lines.push(`${indent}    mode.scope = .single("${mode.scope}")`);
        } else if (typeof mode.scope === 'object') {
            const entries = Object.entries(mode.scope)
                .map(([k, v]) => `${k}: "${v}"`)
                .join(', ');
            lines.push(`${indent}    mode.scope = .multi([${entries}])`);
        }
    } else if (mode.className) {
        lines.push(`${indent}    mode.scope = .single("${mode.className}")`);
    }
    if (mode.relevance !== undefined && mode.relevance !== null) {
        lines.push(`${indent}    mode.relevance = ${mode.relevance}`);
    }
    if (mode.keywords) {
        lines.push(generateKeywords(mode.keywords, indent + '    '));
    }
    if (mode.contains && mode.contains.length > 0) {
        lines.push(`${indent}    mode.contains = [`);
        for (const child of mode.contains) {
            lines.push(generateMode(child, indent + '        ') + ',');
        }
        lines.push(`${indent}    ]`);
    }

    lines.push(`${indent}    return mode`);
    lines.push(`${indent}}()`);

    return lines.join('\n');
}

// Generate pattern (regex or string)
function generatePattern(pattern) {
    if (!pattern) return '.string("")';

    if (typeof pattern === 'string') {
        return `.regex("${escapeSwiftString(pattern)}")`;
    }

    // Handle serialized regex with __regex property
    if (pattern.__regex) {
        if (pattern.__flags && pattern.__flags.length > 0) {
            return `.regexWithFlags(pattern: "${escapeSwiftString(pattern.__regex)}", flags: "${pattern.__flags}")`;
        }
        return `.regex("${escapeSwiftString(pattern.__regex)}")`;
    }

    // Handle actual RegExp objects (shouldn't normally reach here after serialization)
    if (pattern instanceof RegExp) {
        if (pattern.flags && pattern.flags.length > 0) {
            return `.regexWithFlags(pattern: "${escapeSwiftString(pattern.source)}", flags: "${pattern.flags}")`;
        }
        return `.regex("${escapeSwiftString(pattern.source)}")`;
    }

    if (Array.isArray(pattern)) {
        const patterns = pattern.map(p => generatePattern(p));
        return `.array([${patterns.join(', ')}])`;
    }

    // Try to extract source if it looks like a regex object
    if (typeof pattern === 'object' && pattern.source) {
        return `.regex("${escapeSwiftString(pattern.source)}")`;
    }

    return `.string("${escapeSwiftString(String(pattern))}")`;
}

// Generate keywords for a mode
function generateKeywords(keywords, indent, varName = 'mode') {
    if (!keywords) return '';

    if (typeof keywords === 'string') {
        return `${indent}${varName}.keywords = .simple("${escapeSwiftString(keywords)}")\n`;
    }

    if (Array.isArray(keywords)) {
        const items = keywords.map(k => `"${escapeSwiftString(String(k))}"`).join(', ');
        return `${indent}${varName}.keywords = .array([${items}])\n`;
    }

    if (typeof keywords === 'object') {
        let lines = [`${indent}${varName}.keywords = .grouped([`];
        for (const [key, value] of Object.entries(keywords)) {
            if (key === '$pattern') continue; // Skip $pattern for now

            if (typeof value === 'string') {
                lines.push(`${indent}    "${key}": "${escapeSwiftString(value)}" as Any,`);
            } else if (Array.isArray(value)) {
                const items = value.map(v => `"${escapeSwiftString(String(v))}"`).join(', ');
                lines.push(`${indent}    "${key}": [${items}] as Any,`);
            }
        }
        lines.push(`${indent}])`);
        return lines.join('\n') + '\n';
    }

    return '';
}

// Escape string for Swift
function escapeSwiftString(str) {
    if (!str) return '';
    return str
        // Remove non-printable ASCII characters first
        .replace(/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]/g, '')
        .replace(/\\/g, '\\\\')
        .replace(/"/g, '\\"')
        .replace(/\n/g, '\\n')
        .replace(/\r/g, '\\r')
        .replace(/\t/g, '\\t');
}

// Convert to PascalCase (handles names starting with numbers)
function toPascalCase(str) {
    let result = str
        .replace(/[^a-zA-Z0-9]+(.)/g, (m, chr) => chr.toUpperCase())
        .replace(/^./, chr => chr.toUpperCase());

    // If it starts with a number, prepend "Lang"
    if (/^\d/.test(result)) {
        result = 'Lang' + result;
    }

    return result;
}

// Get safe Swift function name
function toSwiftFunctionName(str) {
    let name = str.toLowerCase().replace(/[^a-z0-9]+/g, '_');
    // If it starts with a number, prepend "lang"
    if (/^\d/.test(name)) {
        name = 'lang' + name;
    }
    return name;
}

// Load a language definition
async function loadLanguage(name) {
    const filePath = path.join(HLJS_SRC, 'languages', `${name}.js`);

    if (!fs.existsSync(filePath)) {
        throw new Error(`Language file not found: ${filePath}`);
    }

    const code = fs.readFileSync(filePath, 'utf-8');

    // Create mock hljs
    const hljs = createMockHljs();

    // Handle imports - we need to mock them
    const imports = {};

    // Check for CSS-shared import (used by less, scss, stylus)
    if (code.includes('css-shared') || code.includes('./lib/css-shared')) {
        imports.css = createCssSharedMock(hljs);
    }

    // Check for ECMAScript import
    if (code.includes('ecmascript')) {
        // ECMAScript library values
        imports.IDENT_RE = '[A-Za-z$_][0-9A-Za-z$_]*';
        imports.EXTENDED_NUMBER_RE = '([-+]?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)|NaN|[-+]?Infinity';
        imports.EXTENDED_NUMBER_MODE = {
            scope: 'number',
            match: imports.EXTENDED_NUMBER_RE,
            relevance: 0
        };
        imports.KEYWORDS = 'as in of if for while finally var new function do return void else break catch instanceof with throw case default try switch continue typeof delete let yield const class debugger async await static import from export extends using';
        imports.LITERALS = 'true false null undefined NaN Infinity';
        imports.TYPES = ['Object', 'Function', 'Boolean', 'Symbol', 'Math', 'Date', 'Number', 'BigInt', 'String', 'RegExp', 'Array', 'Float32Array', 'Float64Array', 'Int8Array', 'Uint8Array', 'Uint8ClampedArray', 'Int16Array', 'Int32Array', 'Uint16Array', 'Uint32Array', 'BigInt64Array', 'BigUint64Array', 'Set', 'Map', 'WeakSet', 'WeakMap', 'ArrayBuffer', 'SharedArrayBuffer', 'Atomics', 'DataView', 'JSON', 'Promise', 'Generator', 'GeneratorFunction', 'AsyncFunction', 'Reflect', 'Proxy', 'Intl', 'WebAssembly'];
        imports.ERROR_TYPES = ['Error', 'EvalError', 'InternalError', 'RangeError', 'ReferenceError', 'SyntaxError', 'TypeError', 'URIError'];
        imports.BUILT_IN_GLOBALS = ['setInterval', 'setTimeout', 'clearInterval', 'clearTimeout', 'require', 'exports', 'eval', 'isFinite', 'isNaN', 'parseFloat', 'parseInt', 'decodeURI', 'decodeURIComponent', 'encodeURI', 'encodeURIComponent', 'escape', 'unescape'];
        imports.BUILT_IN_VARIABLES = ['arguments', 'this', 'super', 'console', 'window', 'document', 'localStorage', 'sessionStorage', 'module', 'global'];
        imports.BUILT_INS = [...imports.BUILT_IN_GLOBALS, ...imports.TYPES, ...imports.ERROR_TYPES].join(' ');
    }

    // Build import declarations - handle css specially since it has functions
    const importDeclarations = Object.entries(imports)
        .filter(([k]) => k !== 'css') // Handle css separately
        .map(([k, v]) => `const ${k} = ${JSON.stringify(v)};`)
        .join('\n');

    // Create a wrapper that extracts the default export
    const wrappedCode = `
        (function(hljs, ECMAScript, imports, css) {
            const regex = hljs.regex;
            ${importDeclarations}

            // The original function body
            ${code
                .replace(/^import.*$/gm, '// import removed')
                .replace(/export\s+default\s+function/, 'return function')
            }
        })
    `;

    try {
        const factory = vm.runInNewContext(wrappedCode, { console });
        const langFn = factory(hljs, imports, imports, imports.css);
        const lang = langFn(hljs);
        return lang;
    } catch (e) {
        console.error(`Error loading ${name}: ${e.message}`);
        throw e;
    }
}

// Main conversion function
async function convertLanguage(name) {
    console.log(`Converting ${name}...`);

    try {
        const lang = await loadLanguage(name);
        const serialized = serializeLanguage(lang, name);
        const swift = generateSwift(serialized);

        const outputPath = path.join(OUTPUT_DIR, `${toPascalCase(name)}.swift`);
        fs.writeFileSync(outputPath, swift);

        console.log(`  -> ${outputPath}`);
        return true;
    } catch (e) {
        console.error(`  Error: ${e.message}`);
        return false;
    }
}

// List all available languages
function listLanguages() {
    const langDir = path.join(HLJS_SRC, 'languages');
    return fs.readdirSync(langDir)
        .filter(f => f.endsWith('.js') && !f.startsWith('_'))
        .map(f => f.replace('.js', ''))
        .filter(f => f !== 'lib'); // Exclude lib directory marker
}

// Main entry point
async function main() {
    const args = process.argv.slice(2);

    // Ensure output directory exists
    if (!fs.existsSync(OUTPUT_DIR)) {
        fs.mkdirSync(OUTPUT_DIR, { recursive: true });
    }

    if (args.length === 0 || args[0] === '--help') {
        console.log('Usage: node convert-languages.js [language-name]');
        console.log('       node convert-languages.js --all');
        console.log('       node convert-languages.js --list');
        console.log('');
        console.log('Available languages:');
        const languages = listLanguages();
        console.log(languages.join(', '));
        return;
    }

    if (args[0] === '--list') {
        const languages = listLanguages();
        console.log(languages.join('\n'));
        return;
    }

    if (args[0] === '--all') {
        const languages = listLanguages();
        let success = 0;
        let failed = 0;

        for (const lang of languages) {
            if (await convertLanguage(lang)) {
                success++;
            } else {
                failed++;
            }
        }

        console.log('');
        console.log(`Converted ${success} languages, ${failed} failed`);
        return;
    }

    // Convert specific language(s)
    for (const lang of args) {
        await convertLanguage(lang);
    }
}

main().catch(console.error);
