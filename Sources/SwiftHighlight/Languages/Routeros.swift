// Auto-generated from highlight.js
// Language: routeros

import Foundation

/// routeros language definition
public func routerosLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "MikroTik RouterOS script"

    lang.aliases = ["mikrotik"]
    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "literal": "true false yes no nothing nil null" as Any,
        "keyword": "foreach do while for if from to step else on-error and or not in :foreach :do :while :for :if :from :to :step :else :on-error :and :or :not :in :global :local :beep :delay :put :len :typeof :pick :log :time :set :find :environment :terminal :error :execute :parse :resolve :toarray :tobool :toid :toip :toip6 :tonum :tostr :totime" as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.illegal = .regex(".")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\/\\*")
                    mode.end = .regex("\\*\\/")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\/\\/")
                    mode.end = .regex("$")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("<\\/")
                    mode.end = .regex(">")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode(CommonModes.COMMENT("^#", "$")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
                .mode({
                    let mode = Mode()
                    mode.scope = .single("variable")
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\$[\\w\\d#@][\\w\\d_]*")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("\\$\\{(.*?)\\}")
                            return mode
                        }(),
                    ]
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\$\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("variable")
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            return mode
        }()),
        /* circular ref: __ref_1 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[\\w-]+=([^\\s{}[\\]()>]+)")
            mode.relevance = 0
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[^=]+")
                    mode.scope = .single("attribute")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("=")
                    mode.relevance = 0
                    mode.endsWithParent = true
                    mode.contains = [
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\b(true|false|yes|no|nothing|nil|null)\\b")
                            mode.scope = .single("literal")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("(\"[^\"]*\"|[^\\s{}[\\]]+)")
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\*[0-9a-fA-F]+")
            mode.scope = .single("number")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(add|remove|enable|disable|set|get|print|export|edit|find|run|debug|error|info|warning)([\\s[(\\]|])")
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\w+")
                    mode.scope = .single("built_in")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("built_in")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("(\\.\\./|/|\\s)((traffic-flow|traffic-generator|firewall|scheduler|aaa|accounting|address-list|address|align|area|bandwidth-server|bfd|bgp|bridge|client|clock|community|config|connection|console|customer|default|dhcp-client|dhcp-server|discovery|dns|e-mail|ethernet|filter|firmware|gps|graphing|group|hardware|health|hotspot|identity|igmp-proxy|incoming|instance|interface|ip|ipsec|ipv6|irq|l2tp-server|lcd|ldp|logging|mac-server|mac-winbox|mangle|manual|mirror|mme|mpls|nat|nd|neighbor|network|note|ntp|ospf|ospf-v3|ovpn-server|page|peer|pim|ping|policy|pool|port|ppp|pppoe-client|pptp-server|prefix|profile|proposal|proxy|queue|radius|resource|rip|ripng|route|routing|screen|script|security-profiles|server|service|service-port|settings|shares|smb|sms|sniffer|snmp|snooper|socks|sstp-server|system|tool|tracking|type|upgrade|upnp|user-manager|users|user|vlan|secret|vrrp|watchdog|web-access|wireless|pptp|pppoe|lan|wan|layer7-protocol|lease|simple|raw);?\\s)+")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\.\\.")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register routeros language
public extension HighlightJS {
    func registerRouteros() {
        registerLanguage("routeros", definition: routerosLanguage)
    }
}
