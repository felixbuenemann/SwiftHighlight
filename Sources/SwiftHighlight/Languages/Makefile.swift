// Auto-generated from highlight.js
// Language: makefile

import Foundation

/// makefile language definition
public func makefileLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Makefile"

    lang.aliases = ["mk", "mak", "make"]
    lang.keywords = .grouped([
        "keyword": "define endef undefine ifdef ifndef ifeq ifneq else endif include -include sinclude override export unexport private vpath" as Any,
    ])
    lang.contains = [
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.scope = .single("variable")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\$\\([a-zA-Z_]\\w*\\)")
                    mode.contains = [
                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\$[@%<?\\^\\+\\*]")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.contains = [
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$\\([\\w-]+\\s")
            mode.end = .regex("\\)")
            mode.scope = .single("variable")
            mode.keywords = .grouped([
                "built_in": "subst patsubst strip findstring filter filter-out sort word wordlist firstword lastword dir notdir suffix basename addsuffix addprefix join wildcard realpath abspath error warning shell origin flavor foreach if or and call eval file value" as Any,
            ])

            mode.contains = [
                /* circular ref: __ref_1 */ .mode(Mode()),
                /* circular ref: __ref_2 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[a-zA-Z_]\\w*\\s*(?=[:+?]?=)")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^\\.PHONY:")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            mode.keywords = .grouped([
                "keyword": ".PHONY" as Any,
            ])

            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^[^\\s]+:")
            mode.end = .regex("$")
            mode.scope = .single("section")
            mode.contains = [
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register makefile language
public extension HighlightJS {
    func registerMakefile() {
        registerLanguage("makefile", definition: makefileLanguage)
    }
}
