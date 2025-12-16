// Auto-generated from highlight.js
// Language: jboss-cli

import Foundation

/// jboss-cli language definition
public func jboss_cliLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "JBoss CLI"

    lang.aliases = ["wildfly-cli"]
    lang.keywords = .grouped([
        "keyword": "alias batch cd clear command connect connection-factory connection-info data-source deploy deployment-info deployment-overlay echo echo-dmr help history if jdbc-driver-info jms-queue|20 jms-topic|20 ls patch pwd quit read-attribute read-operation reload rollout-plan run-batch set shutdown try unalias undeploy unset version xa-data-source" as Any,
        "literal": "true false" as Any,
    ])
    lang.contains = [
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("--[\\w\\-=\\/]+")
            mode.scope = .single("params")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(":[\\w\\-.]+")
            mode.scope = .single("function")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\B([\\/.])[\\w\\-.\\/=]+")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\(")
            mode.end = .regex("\\)")
            mode.scope = .single("params")
            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("[\\w-]+ *=")
                    mode.relevance = 0
                    mode.returnBegin = true
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[\\w-]+")
                            mode.scope = .single("attr")
                            return mode
                        }()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register jboss-cli language
public extension HighlightJS {
    func registerJbossCli() {
        registerLanguage("jboss-cli", definition: jboss_cliLanguage)
    }
}
