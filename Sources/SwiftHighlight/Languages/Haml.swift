// Language: HAML
// Author: Dan Allen <dan.j.allen@gmail.com>
// Requires: ruby.js
// Category: template

import Foundation

/// HAML language definition
public func hamlLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "HAML"
    lang.caseInsensitive = true

    // Doctype
    let DOCTYPE = Mode()
    DOCTYPE.scope = .single("meta")
    DOCTYPE.begin = .regex("^!!!( (5|1\\\\.1|Strict|Frameset|Basic|Mobile|RDFa|XML\\\\b.*))?$")
    DOCTYPE.relevance = 10

    // Comment
    let COMMENT = Mode()
    COMMENT.scope = .single("comment")
    COMMENT.begin = .regex("^\\\\s*(!=#|=#|-#|/).*$")
    COMMENT.relevance = 0

    // Ruby code
    let RUBY_CODE = Mode()
    RUBY_CODE.begin = .regex("^\\\\s*(-|=|!=)(?!#)")
    RUBY_CODE.end = .regex("$")
    RUBY_CODE.subLanguage = .single("ruby")
    RUBY_CODE.excludeBegin = true
    RUBY_CODE.excludeEnd = true

    // Attribute value
    let ATTR = Mode()
    ATTR.scope = .single("attr")
    ATTR.begin = .regex(":\\\\w+")

    let HASH_VALUE = Mode()
    HASH_VALUE.begin = .regex(":\\\\w+\\\\s*=>")
    HASH_VALUE.end = .regex(",\\\\s+")
    HASH_VALUE.returnBegin = true
    HASH_VALUE.endsWithParent = true
    HASH_VALUE.contains = [
        .mode(ATTR),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE())
    ]

    // Hash attributes
    let HASH_ATTRS = Mode()
    HASH_ATTRS.begin = .regex("\\\\{\\\\s*")
    HASH_ATTRS.end = .regex("\\\\s*\\\\}")
    HASH_ATTRS.contains = [.mode(HASH_VALUE)]

    // HTML-style attribute
    let HTML_ATTR_NAME = Mode()
    HTML_ATTR_NAME.scope = .single("attr")
    HTML_ATTR_NAME.begin = .regex("\\\\w+")
    HTML_ATTR_NAME.relevance = 0

    let HTML_ATTR_VALUE = Mode()
    HTML_ATTR_VALUE.begin = .regex("\\\\w+\\\\s*=")
    HTML_ATTR_VALUE.end = .regex("\\\\s+")
    HTML_ATTR_VALUE.returnBegin = true
    HTML_ATTR_VALUE.endsWithParent = true
    HTML_ATTR_VALUE.contains = [
        .mode(HTML_ATTR_NAME),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE())
    ]

    // Paren attributes
    let PAREN_ATTRS = Mode()
    PAREN_ATTRS.begin = .regex("\\\\(\\\\s*")
    PAREN_ATTRS.end = .regex("\\\\s*\\\\)")
    PAREN_ATTRS.excludeEnd = true
    PAREN_ATTRS.contains = [.mode(HTML_ATTR_VALUE)]

    // Tag selector parts
    let SELECTOR_TAG = Mode()
    SELECTOR_TAG.scope = .single("selector-tag")
    SELECTOR_TAG.begin = .regex("\\\\w+")

    let SELECTOR_ID = Mode()
    SELECTOR_ID.scope = .single("selector-id")
    SELECTOR_ID.begin = .regex("#[\\\\w-]+")

    let SELECTOR_CLASS = Mode()
    SELECTOR_CLASS.scope = .single("selector-class")
    SELECTOR_CLASS.begin = .regex("\\\\.[\\\\w-]+")

    // Tag
    let TAG = Mode()
    TAG.scope = .single("tag")
    TAG.begin = .regex("^\\\\s*%")
    TAG.contains = [
        .mode(SELECTOR_TAG),
        .mode(SELECTOR_ID),
        .mode(SELECTOR_CLASS),
        .mode(HASH_ATTRS),
        .mode(PAREN_ATTRS)
    ]

    // Expression start
    let EXPRESSION = Mode()
    EXPRESSION.begin = .regex("^\\\\s*[=~]\\\\s*")

    // Ruby interpolation
    let INTERPOLATION = Mode()
    INTERPOLATION.begin = .regex("#\\\\{")
    INTERPOLATION.end = .regex("\\\\}")
    INTERPOLATION.subLanguage = .single("ruby")
    INTERPOLATION.excludeBegin = true
    INTERPOLATION.excludeEnd = true

    lang.contains = [
        .mode(DOCTYPE),
        .mode(COMMENT),
        .mode(RUBY_CODE),
        .mode(TAG),
        .mode(EXPRESSION),
        .mode(INTERPOLATION)
    ]

    return lang
}

/// Register HAML language
public extension HighlightJS {
    func registerHaml() {
        registerLanguage("haml", definition: hamlLanguage)
    }
}
