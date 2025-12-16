// Auto-generated from highlight.js
// Language: crmsh

import Foundation

/// crmsh language definition
public func crmshLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "crmsh"

    lang.aliases = ["crm", "pcmk"]
    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": "params meta operations op rule attributes utilization read write deny defined not_defined in_range date spec in ref reference attribute type xpath version and or lt gt tag lte gte eq ne \\ number string" as Any,
        "literal": "Master Started Slave Stopped start promote demote stop monitor true false" as Any,
    ])
    lang.contains = [
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.beginKeywords = "node"
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("\\s*([\\w_-]+:)?")
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.beginKeywords = "primitive rsc_template"
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("\\s*[\\$\\w_][\\w_-]*")
                    mode.scope = .single("title")
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(group|clone|ms|master|location|colocation|order|fencing_topology|rsc_ticket|acl_target|acl_group|user|role|tag|xml)\\s+")
            mode.keywords = .simple("group clone ms master location colocation order fencing_topology rsc_ticket acl_target acl_group user role tag xml")

            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("[\\$\\w_][\\w_-]*")
                    mode.scope = .single("title")
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.beginKeywords = "property rsc_defaults op_defaults"
            mode.starts = {
                {
                    let mode = Mode()
                    mode.end = .regex("\\s*([\\w_-]+:)?")
                    mode.scope = .single("title")
                    return mode
                }()
            }()
            return mode
        }()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(ocf|systemd|service|lsb):[\\w_:-]+")
            mode.scope = .single("meta")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b\\d+(\\.\\d+)?(ms|s|h|m)?")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[-]?(infinity|inf)")
            mode.scope = .single("literal")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("([A-Za-z$_#][\\w_-]+)=")
            mode.scope = .single("attr")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("</?")
            mode.end = .regex("/?>")
            mode.scope = .single("tag")
            mode.relevance = 0
            return mode
        }()),
    ]

    return lang
}

/// Register crmsh language
public extension HighlightJS {
    func registerCrmsh() {
        registerLanguage("crmsh", definition: crmshLanguage)
    }
}
