// Auto-generated from highlight.js
// Language: scheme

import Foundation

/// scheme language definition
public func schemeLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Scheme"

    lang.aliases = ["scm"]
    lang.illegal = .regex("\\S")
    lang.contains = [
        .mode(CommonModes.SHEBANG()),
        .mode({
            let mode = Mode()
            mode.scope = .single("number")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("(-|\\+)?\\d+([./]\\d+)?")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(-|\\+)?\\d+([./]\\d+)?[+\\-](-|\\+)?\\d+([./]\\d+)?i")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#b[0-1]+(/[0-1]+)?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#o[0-7]+(/[0-7]+)?")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#x[0-9a-f]+(/[0-9a-f]+)?")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode(CommonModes.QUOTE_STRING_MODE()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'[^\\(\\)\\[\\]\\{\\}\",'`;#|\\\\\\s]+")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.contains = [
                        .selfReference,
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("(#t|#f|#\\\\[^\\(\\)\\[\\]\\{\\}\",'`;#|\\\\\\s]+|#\\\\.)")
                            mode.scope = .single("literal")
                            return mode
                        }()),
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[^\\(\\)\\[\\]\\{\\}\",'`;#|\\\\\\s]+")
                            mode.relevance = 0
                            return mode
                        }()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                    ]
                    return mode
                }()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("`")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("lambda")
                    mode.endsWithParent = true
                    mode.returnBegin = true
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("[^\\(\\)\\[\\]\\{\\}\",'`;#|\\\\\\s]+")
                            mode.scope = .single("name")
                            mode.keywords = .grouped([
                                "built_in": "case-lambda call/cc class define-class exit-handler field import inherit init-field interface let*-values let-values let/ec mixin opt-lambda override protect provide public rename require require-for-syntax syntax syntax-case syntax-error unit/sig unless when with-syntax and begin call-with-current-continuation call-with-input-file call-with-output-file case cond define define-syntax delay do dynamic-wind else for-each if lambda let let* let-syntax letrec letrec-syntax map or syntax-rules ' * + , ,@ - ... / ; < <= = => > >= ` abs acos angle append apply asin assoc assq assv atan boolean? caar cadr call-with-input-file call-with-output-file call-with-values car cdddar cddddr cdr ceiling char->integer char-alphabetic? char-ci<=? char-ci<? char-ci=? char-ci>=? char-ci>? char-downcase char-lower-case? char-numeric? char-ready? char-upcase char-upper-case? char-whitespace? char<=? char<? char=? char>=? char>? char? close-input-port close-output-port complex? cons cos current-input-port current-output-port denominator display eof-object? eq? equal? eqv? eval even? exact->inexact exact? exp expt floor force gcd imag-part inexact->exact inexact? input-port? integer->char integer? interaction-environment lcm length list list->string list->vector list-ref list-tail list? load log magnitude make-polar make-rectangular make-string make-vector max member memq memv min modulo negative? newline not null-environment null? number->string number? numerator odd? open-input-file open-output-file output-port? pair? peek-char port? positive? procedure? quasiquote quote quotient rational? rationalize read read-char real-part real? remainder reverse round scheme-report-environment set! set-car! set-cdr! sin sqrt string string->list string->number string->symbol string-append string-ci<=? string-ci<? string-ci=? string-ci>=? string-ci>? string-copy string-fill! string-length string-ref string-set! string<=? string<? string=? string>=? string>? string? substring symbol->string symbol? tan transcript-off transcript-on truncate values vector vector->list vector-fill! vector-length vector-ref vector-set! with-input-from-file with-output-to-file write write-char zero?" as Any,
                            ])

                            mode.relevance = 0
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.endsParent = true
                            mode.contains = [
                                /* circular ref: __ref_3 */ .mode(Mode()),
                            ]
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\(")
                                    mode.end = .regex("\\)")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\[")
                                    mode.end = .regex("\\]")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_4 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.relevance = 0
                    mode.endsWithParent = true
                    mode.contains = [
                        /* circular ref: __ref_5 */ .mode(Mode()),
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                        /* circular ref: __ref_7 */ .mode(Mode()),
                        .mode(CommonModes.COMMENT(";", "$")),
                        .mode(CommonModes.COMMENT("#\\|", "\\|#")),
                    ]
                    return mode
                }()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\[")
                    mode.end = .regex("\\]")
                    return mode
                }(),
            ]
            return mode
        }()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_9 */ .mode(Mode()),
    ]

    return lang
}

/// Register scheme language
public extension HighlightJS {
    func registerScheme() {
        registerLanguage("scheme", definition: schemeLanguage)
    }
}
