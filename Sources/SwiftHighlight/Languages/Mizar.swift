// Auto-generated from highlight.js
// Language: mizar

import Foundation

/// mizar language definition
public func mizarLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Mizar"

    lang.keywords = .simple("environ vocabularies notations constructors definitions registrations theorems schemes requirements begin end definition registration cluster existence pred func defpred deffunc theorem proof let take assume then thus hence ex for st holds consider reconsider such that and in provided of as from be being by means equals implies iff redefine define now not or attr is mode suppose per cases set thesis contradiction scheme reserve struct correctness compatibility coherence symmetry assymetry reflexivity irreflexivity connectedness uniqueness commutativity idempotence involutiveness projectivity")
    lang.contains = [
        .mode(CommonModes.COMMENT("::", "$")),
    ]

    return lang
}

/// Register mizar language
public extension HighlightJS {
    func registerMizar() {
        registerLanguage("mizar", definition: mizarLanguage)
    }
}
