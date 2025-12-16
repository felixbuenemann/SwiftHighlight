// Auto-generated from highlight.js
// Language: nix

import Foundation

/// nix language definition
public func nixLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Nix"

    lang.aliases = ["nixos"]
    lang.keywords = .grouped([
        "keyword": ["assert", "else", "if", "in", "inherit", "let", "or", "rec", "then", "with"] as Any,
        "literal": ["true", "false", "null"] as Any,
        "built_in": ["abort", "baseNameOf", "builtins", "derivation", "derivationStrict", "dirOf", "fetchGit", "fetchMercurial", "fetchTarball", "fetchTree", "fromTOML", "import", "isNull", "map", "placeholder", "removeAttrs", "scopedImport", "throw", "toString"] as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b\\d+(\\.\\d+)?(?!-)")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.COMMENT("\\/\\*\\*(?!\\/)", "\\*\\/")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(?:builtins\\.abort|builtins\\.add|builtins\\.addDrvOutputDependencies|builtins\\.addErrorContext|builtins\\.all|builtins\\.any|builtins\\.appendContext|builtins\\.attrNames|builtins\\.attrValues|builtins\\.baseNameOf|builtins\\.bitAnd|builtins\\.bitOr|builtins\\.bitXor|builtins\\.break|builtins\\.builtins|builtins\\.catAttrs|builtins\\.ceil|builtins\\.compareVersions|builtins\\.concatLists|builtins\\.concatMap|builtins\\.concatStringsSep|builtins\\.convertHash|builtins\\.currentSystem|builtins\\.currentTime|builtins\\.deepSeq|builtins\\.derivation|builtins\\.derivationStrict|builtins\\.dirOf|builtins\\.div|builtins\\.elem|builtins\\.elemAt|builtins\\.false|builtins\\.fetchGit|builtins\\.fetchMercurial|builtins\\.fetchTarball|builtins\\.fetchTree|builtins\\.fetchurl|builtins\\.filter|builtins\\.filterSource|builtins\\.findFile|builtins\\.flakeRefToString|builtins\\.floor|builtins\\.foldl'|builtins\\.fromJSON|builtins\\.fromTOML|builtins\\.functionArgs|builtins\\.genList|builtins\\.genericClosure|builtins\\.getAttr|builtins\\.getContext|builtins\\.getEnv|builtins\\.getFlake|builtins\\.groupBy|builtins\\.hasAttr|builtins\\.hasContext|builtins\\.hashFile|builtins\\.hashString|builtins\\.head|builtins\\.import|builtins\\.intersectAttrs|builtins\\.isAttrs|builtins\\.isBool|builtins\\.isFloat|builtins\\.isFunction|builtins\\.isInt|builtins\\.isList|builtins\\.isNull|builtins\\.isPath|builtins\\.isString|builtins\\.langVersion|builtins\\.length|builtins\\.lessThan|builtins\\.listToAttrs|builtins\\.map|builtins\\.mapAttrs|builtins\\.match|builtins\\.mul|builtins\\.nixPath|builtins\\.nixVersion|builtins\\.null|builtins\\.parseDrvName|builtins\\.parseFlakeRef|builtins\\.partition|builtins\\.path|builtins\\.pathExists|builtins\\.placeholder|builtins\\.readDir|builtins\\.readFile|builtins\\.readFileType|builtins\\.removeAttrs|builtins\\.replaceStrings|builtins\\.scopedImport|builtins\\.seq|builtins\\.sort|builtins\\.split|builtins\\.splitVersion|builtins\\.storeDir|builtins\\.storePath|builtins\\.stringLength|builtins\\.sub|builtins\\.substring|builtins\\.tail|builtins\\.throw|builtins\\.toFile|builtins\\.toJSON|builtins\\.toPath|builtins\\.toString|builtins\\.toXML|builtins\\.trace|builtins\\.traceVerbose|builtins\\.true|builtins\\.tryEval|builtins\\.typeOf|builtins\\.unsafeDiscardOutputDependency|builtins\\.unsafeDiscardStringContext|builtins\\.unsafeGetAttrPos|builtins\\.warn|builtins\\.zipAttrsWith)")
            mode.scope = .single("built_in")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("''")
                    mode.end = .regex("''")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("''\\$")
                            mode.scope = .single("char.escape")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\$\\{")
                            mode.end = .regex("\\}")
                            mode.scope = .single("subst")
                            mode.keywords = .grouped([
                                "__circularRef": "__ref_0" as Any,
                            ])

                            mode.contains = [
                                /* circular ref: __ref_1 */ .mode(Mode()),
                                /* circular ref: __ref_2 */ .mode(Mode()),
                                /* circular ref: __ref_3 */ .mode(Mode()),
                                /* circular ref: __ref_4 */ .mode(Mode()),
                                /* circular ref: __ref_5 */ .mode(Mode()),
                                /* circular ref: __ref_6 */ .mode(Mode()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("<[A-Za-z_][A-Za-z0-9_'-]*(\\/[A-Za-z_][A-Za-z0-9_'-]*)*>")
                                    mode.scope = .single("symbol")
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("(\\.\\.|\\.|~)?\\/([A-Za-z0-9_\\+\\.-]+)?(\\/[A-Za-z0-9_\\+\\.-]+)*(?=[\\s;])")
                                    mode.scope = .single("symbol")
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("[A-Za-z_][A-Za-z0-9_'-]*\\s*:(?=\\s)")
                                    mode.scope = .single("params")
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("[A-Za-z_][A-Za-z0-9_'-]*(\\.[A-Za-z_][A-Za-z0-9_'-]*)*\\s*=(?!=)")
                                    mode.relevance = 0
                                    mode.returnBegin = true
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("[A-Za-z_][A-Za-z0-9_'-]*(\\.[A-Za-z_][A-Za-z0-9_'-]*)*(?=\\s*=)")
                                            mode.scope = .single("attr")
                                            mode.relevance = 0.2
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.relevance = 0
                                    mode.variants = [
                                        {
                                            let mode = Mode()
                                            mode.begin = .regex("-(?!>)")
                                            mode.scope = .single("operator")
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .array([.regex("\\b\\d+(\\.\\d+)?"), .regex("-"), .regex("(?!>)")])
                                            return mode
                                        }(),
                                        {
                                            let mode = Mode()
                                            mode.begin = .array([.regex("(?:==|=|\\+\\+|\\+|<=|<\\||<|>=|>|->|//|/|!=|!|\\|\\||\\|>|\\?|\\*|&&)"), .regex("-"), .regex("(?!>)")])
                                            return mode
                                        }(),
                                    ]
                                    return mode
                                }()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("(?:==|=|\\+\\+|\\+|<=|<\\||<|>=|>|->|//|/|!=|!|\\|\\||\\|>|\\?|\\*|&&)/(?!-)/")
                                    mode.scope = .single("operator")
                                    mode.relevance = 0
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("'''")
                            mode.scope = .single("char.escape")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\\\(?!\\$).")
                            mode.scope = .single("char.escape")
                            return mode
                        }()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\\\\\$")
                            mode.scope = .single("char.escape")
                            return mode
                        }()),
                        /* circular ref: __ref_7 */ .mode(Mode()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        /* circular ref: __ref_9 */ .mode(Mode()),
        /* circular ref: __ref_10 */ .mode(Mode()),
        /* circular ref: __ref_11 */ .mode(Mode()),
        /* circular ref: __ref_12 */ .mode(Mode()),
        /* circular ref: __ref_13 */ .mode(Mode()),
        /* circular ref: __ref_14 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("^nix-repl>(?=\\s)")
            mode.scope = .single("meta.prompt")
            mode.relevance = 10
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(":([a-z]+|\\?)")
            mode.scope = .single("meta")
            return mode
        }()),
    ]

    return lang
}

/// Register nix language
public extension HighlightJS {
    func registerNix() {
        registerLanguage("nix", definition: nixLanguage)
    }
}
