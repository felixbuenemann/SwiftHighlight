// Auto-generated from highlight.js
// Language: mercury

import Foundation

/// mercury language definition
public func mercuryLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Mercury"

    lang.aliases = ["m", "moo"]
    lang.keywords = .grouped([
        "keyword": "module use_module import_module include_module end_module initialise mutable initialize finalize finalise interface implementation pred mode func type inst solver any_pred any_func is semidet det nondet multi erroneous failure cc_nondet cc_multi typeclass instance where pragma promise external trace atomic or_else require_complete_switch require_det require_semidet require_multi require_nondet require_cc_multi require_cc_nondet require_erroneous require_failure" as Any,
        "meta": "inline no_inline type_spec source_file fact_table obsolete memo loop_check minimal_model terminates does_not_terminate check_termination promise_equivalent_clauses foreign_proc foreign_decl foreign_code foreign_type foreign_import_module foreign_export_enum foreign_export foreign_enum may_call_mercury will_not_call_mercury thread_safe not_thread_safe maybe_thread_safe promise_pure promise_semipure tabled_for_io local untrailed trailed attach_to_io_state can_pass_as_mercury_type stable will_not_throw_exception may_modify_trail will_not_modify_trail may_duplicate may_not_duplicate affects_liveness does_not_affect_liveness doesnt_affect_liveness no_sharing unknown_sharing sharing" as Any,
        "built_in": "some all not if then else true fail false try catch catch_any semidet_true semidet_false semidet_fail impure_true impure semipure" as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.scope = .single("built_in")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("<=>")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("<=")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("=>")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("/\\\\")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\\\/")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("built_in")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex(":-\\|-->")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("=")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode(CommonModes.COMMENT("%", "$")),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("0'.\\|0[box][0-9a-fA-F]*")
            mode.scope = .single("number")
            return mode
        }()),
        .mode(CommonModes.NUMBER_MODE()),
        .mode(CommonModes.APOS_STRING_MODE()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex(":-")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\.$")
            return mode
        }()),
    ]

    return lang
}

/// Register mercury language
public extension HighlightJS {
    func registerMercury() {
        registerLanguage("mercury", definition: mercuryLanguage)
    }
}
