// Auto-generated from highlight.js
// Language: matlab

import Foundation

/// matlab language definition
public func matlabLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Matlab"

    lang.keywords = .grouped([
        "keyword": "arguments break case catch classdef continue else elseif end enumeration events for function global if methods otherwise parfor persistent properties return spmd switch try while" as Any,
        "built_in": "sin sind sinh asin asind asinh cos cosd cosh acos acosd acosh tan tand tanh atan atand atan2 atanh sec secd sech asec asecd asech csc cscd csch acsc acscd acsch cot cotd coth acot acotd acoth hypot exp expm1 log log1p log10 log2 pow2 realpow reallog realsqrt sqrt nthroot nextpow2 abs angle complex conj imag real unwrap isreal cplxpair fix floor ceil round mod rem sign airy besselj bessely besselh besseli besselk beta betainc betaln ellipj ellipke erf erfc erfcx erfinv expint gamma gammainc gammaln psi legendre cross dot factor isprime primes gcd lcm rat rats perms nchoosek factorial cart2sph cart2pol pol2cart sph2cart hsv2rgb rgb2hsv zeros ones eye repmat rand randn linspace logspace freqspace meshgrid accumarray size length ndims numel disp isempty isequal isequalwithequalnans cat reshape diag blkdiag tril triu fliplr flipud flipdim rot90 find sub2ind ind2sub bsxfun ndgrid permute ipermute shiftdim circshift squeeze isscalar isvector ans eps realmax realmin pi i|0 inf nan isnan isinf isfinite j|0 why compan gallery hadamard hankel hilb invhilb magic pascal rosser toeplitz vander wilkinson max min nanmax nanmin mean nanmean type table readtable writetable sortrows sort figure plot plot3 scatter scatter3 cellfun legend intersect ismember procrustes hold num2cell " as Any,
    ])
    lang.illegal = .regex("(//|\"|#|/\\*|\\s+/\\w+)")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.end = .regex("$")
            mode.scope = .single("function")
            mode.beginKeywords = "function"
            mode.contains = [
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.scope = .single("params")
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
        .mode({
            let mode = Mode()
            mode.begin = .regex("true|false")
            mode.scope = .single("built_in")
            mode.relevance = 0
            mode.starts = {
                {
                    let mode = Mode()
                    mode.relevance = 0
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("('|\\.')+")
                            return mode
                        }()),
                    ]
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("[a-zA-Z][a-zA-Z_0-9]*('|\\.')+")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)")
            mode.scope = .single("number")
            mode.relevance = 0
            mode.starts = {
                {
                    let mode = Mode()
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'")
            mode.end = .regex("'")
            mode.scope = .single("string")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("''")
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\]|\\}|\\)")
            mode.relevance = 0
            mode.starts = {
                {
                    let mode = Mode()
                    return mode
                }()
            }()
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\"\"")
                    return mode
                }()),
            ]
            mode.starts = {
                {
                    let mode = Mode()
                    return mode
                }()
            }()
            return mode
        }()),
        .mode(CommonModes.COMMENT("^\\s*%\\{\\s*$", "^\\s*%\\}\\s*$")),
        .mode(CommonModes.COMMENT("%", "$")),
    ]

    return lang
}

/// Register matlab language
public extension HighlightJS {
    func registerMatlab() {
        registerLanguage("matlab", definition: matlabLanguage)
    }
}
