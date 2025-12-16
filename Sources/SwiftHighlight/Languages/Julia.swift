// Auto-generated from highlight.js
// Language: julia

import Foundation

/// julia language definition
public func juliaLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "Julia"

    lang.keywords = .grouped([
        "keyword": ["baremodule", "begin", "break", "catch", "ccall", "const", "continue", "do", "else", "elseif", "end", "export", "false", "finally", "for", "function", "global", "if", "import", "in", "isa", "let", "local", "macro", "module", "quote", "return", "true", "try", "using", "where", "while"] as Any,
        "literal": ["ARGS", "C_NULL", "DEPOT_PATH", "ENDIAN_BOM", "ENV", "Inf", "Inf16", "Inf32", "Inf64", "InsertionSort", "LOAD_PATH", "MergeSort", "NaN", "NaN16", "NaN32", "NaN64", "PROGRAM_FILE", "QuickSort", "RoundDown", "RoundFromZero", "RoundNearest", "RoundNearestTiesAway", "RoundNearestTiesUp", "RoundToZero", "RoundUp", "VERSION|0", "devnull", "false", "im", "missing", "nothing", "pi", "stderr", "stdin", "stdout", "true", "undef", "π", "ℯ"] as Any,
        "built_in": ["AbstractArray", "AbstractChannel", "AbstractChar", "AbstractDict", "AbstractDisplay", "AbstractFloat", "AbstractIrrational", "AbstractMatrix", "AbstractRange", "AbstractSet", "AbstractString", "AbstractUnitRange", "AbstractVecOrMat", "AbstractVector", "Any", "ArgumentError", "Array", "AssertionError", "BigFloat", "BigInt", "BitArray", "BitMatrix", "BitSet", "BitVector", "Bool", "BoundsError", "CapturedException", "CartesianIndex", "CartesianIndices", "Cchar", "Cdouble", "Cfloat", "Channel", "Char", "Cint", "Cintmax_t", "Clong", "Clonglong", "Cmd", "Colon", "Complex", "ComplexF16", "ComplexF32", "ComplexF64", "CompositeException", "Condition", "Cptrdiff_t", "Cshort", "Csize_t", "Cssize_t", "Cstring", "Cuchar", "Cuint", "Cuintmax_t", "Culong", "Culonglong", "Cushort", "Cvoid", "Cwchar_t", "Cwstring", "DataType", "DenseArray", "DenseMatrix", "DenseVecOrMat", "DenseVector", "Dict", "DimensionMismatch", "Dims", "DivideError", "DomainError", "EOFError", "Enum", "ErrorException", "Exception", "ExponentialBackOff", "Expr", "Float16", "Float32", "Float64", "Function", "GlobalRef", "HTML", "IO", "IOBuffer", "IOContext", "IOStream", "IdDict", "IndexCartesian", "IndexLinear", "IndexStyle", "InexactError", "InitError", "Int", "Int128", "Int16", "Int32", "Int64", "Int8", "Integer", "InterruptException", "InvalidStateException", "Irrational", "KeyError", "LinRange", "LineNumberNode", "LinearIndices", "LoadError", "MIME", "Matrix", "Method", "MethodError", "Missing", "MissingException", "Module", "NTuple", "NamedTuple", "Nothing", "Number", "OrdinalRange", "OutOfMemoryError", "OverflowError", "Pair", "PartialQuickSort", "PermutedDimsArray", "Pipe", "ProcessFailedException", "Ptr", "QuoteNode", "Rational", "RawFD", "ReadOnlyMemoryError", "Real", "ReentrantLock", "Ref", "Regex", "RegexMatch", "RoundingMode", "SegmentationFault", "Set", "Signed", "Some", "StackOverflowError", "StepRange", "StepRangeLen", "StridedArray", "StridedMatrix", "StridedVecOrMat", "StridedVector", "String", "StringIndexError", "SubArray", "SubString", "SubstitutionString", "Symbol", "SystemError", "Task", "TaskFailedException", "Text", "TextDisplay", "Timer", "Tuple", "Type", "TypeError", "TypeVar", "UInt", "UInt128", "UInt16", "UInt32", "UInt64", "UInt8", "UndefInitializer", "UndefKeywordError", "UndefRefError", "UndefVarError", "Union", "UnionAll", "UnitRange", "Unsigned", "Val", "Vararg", "VecElement", "VecOrMat", "Vector", "VersionNumber", "WeakKeyDict", "WeakRef"] as Any,
    ])
    lang.illegal = .regex("<\\/")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("(\\b0x[\\d_]*(\\.[\\d_]*)?|0x\\.\\d[\\d_]*)p[-+]?\\d+|\\b0[box][a-fA-F0-9][a-fA-F0-9_]*|(\\b\\d[\\d_]*(\\.[\\d_]*)?|\\.\\d[\\d_]*)([eEfF][-+]?\\d+)?")
            mode.scope = .single("number")
            mode.relevance = 0
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("'(.|\\\\[xXuU][a-zA-Z0-9]+)'")
            mode.scope = .single("string")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.contains = [
                .mode(CommonModes.BACKSLASH_ESCAPE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\$\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("subst")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_0" as Any,
                    ])

                    mode.contains = [
                        /* circular ref: __ref_1 */ .mode(Mode()),
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("`")
                            mode.end = .regex("`")
                            mode.scope = .single("string")
                            mode.contains = [
                                /* circular ref: __ref_4 */ .mode(Mode()),
                                /* circular ref: __ref_5 */ .mode(Mode()),
                                .mode({
                                    let mode = Mode()
                                    mode.begin = .regex("\\$[A-Za-z_\\u00A1-\\uFFFF][A-Za-z_0-9\\u00A1-\\uFFFF]*")
                                    mode.scope = .single("variable")
                                    return mode
                                }()),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("@[A-Za-z_\\u00A1-\\uFFFF][A-Za-z_0-9\\u00A1-\\uFFFF]*")
                            mode.scope = .single("meta")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("comment")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("#=")
                                    mode.end = .regex("=#")
                                    mode.relevance = 10
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("#")
                                    mode.end = .regex("$")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode(CommonModes.HASH_COMMENT_MODE()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\b(((abstract|primitive)\\s+)type|(mutable\\s+)?struct)\\b")
                            mode.scope = .single("keyword")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("<:")
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_6 */ .mode(Mode()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\w*\"\"\"")
                    mode.end = .regex("\"\"\"\\w*")
                    mode.relevance = 10
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\w*\"")
                    mode.end = .regex("\"\\w*")
                    return mode
                }(),
            ]
            return mode
        }()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
        /* circular ref: __ref_9 */ .mode(Mode()),
        /* circular ref: __ref_10 */ .mode(Mode()),
        /* circular ref: __ref_11 */ .mode(Mode()),
        /* circular ref: __ref_12 */ .mode(Mode()),
    ]

    return lang
}

/// Register julia language
public extension HighlightJS {
    func registerJulia() {
        registerLanguage("julia", definition: juliaLanguage)
    }
}
