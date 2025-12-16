// Language: LLVM IR
// Author: Michael Rodler <contact@f0rki.at>
// Description: LLVM intermediate representation
// Category: assembler

import Foundation

/// LLVM IR language definition
public func llvmLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "LLVM IR"

    lang.keywords = .grouped([
        "keyword": "begin end true false declare define global constant private linker_private internal available_externally linkonce linkonce_odr weak weak_odr appending dllimport dllexport common default hidden protected extern_weak external thread_local zeroinitializer undef null to tail target triple datalayout volatile nuw nsw nnan ninf nsz arcp fast exact inbounds align addrspace section alias module asm sideeffect gc dbg linker_private_weak attributes blockaddress initialexec localdynamic localexec prefix unnamed_addr ccc fastcc coldcc x86_stdcallcc x86_fastcallcc arm_apcscc arm_aapcscc arm_aapcs_vfpcc ptx_device ptx_kernel intel_ocl_bicc msp430_intrcc spir_func spir_kernel x86_64_sysvcc x86_64_win64cc x86_thiscallcc cc c signext zeroext inreg sret nounwind noreturn noalias nocapture byval nest readnone readonly inlinehint noinline alwaysinline optsize ssp sspreq noredzone noimplicitfloat naked builtin cold nobuiltin noduplicate nonlazybind optnone returns_twice sanitize_address sanitize_memory sanitize_thread sspstrong uwtable returned type opaque eq ne slt sgt sle sge ult ugt ule uge oeq one olt ogt ole oge ord uno ueq une x acq_rel acquire alignstack atomic catch cleanup filter inteldialect max min monotonic nand personality release seq_cst singlethread umax umin unordered xchg add fadd sub fsub mul fmul udiv sdiv fdiv urem srem frem shl lshr ashr and or xor icmp fcmp phi call trunc zext sext fptrunc fpext uitofp sitofp fptoui fptosi inttoptr ptrtoint bitcast addrspacecast select va_arg ret br switch invoke unwind unreachable indirectbr landingpad resume malloc alloca free load store getelementptr extractelement insertelement shufflevector getresult extractvalue insertvalue atomicrmw cmpxchg fence argmemonly" as Any,
        "type": "void half bfloat float double fp128 x86_fp80 ppc_fp128 x86_amx x86_mmx ptr label token metadata opaque" as Any
    ])

    let IDENT_RE = "[-a-zA-Z$._][\\w$.-]*"

    // Integer type (i32, i64, etc.)
    let INT_TYPE = Mode()
    INT_TYPE.scope = .single("type")
    INT_TYPE.begin = .regex("\\bi\\d+(?=\\s|\\b)")

    // Operator
    let OPERATOR = Mode()
    OPERATOR.scope = .single("operator")
    OPERATOR.begin = .regex("=")
    OPERATOR.relevance = 0

    // Punctuation
    let PUNCTUATION = Mode()
    PUNCTUATION.scope = .single("punctuation")
    PUNCTUATION.begin = .regex(",")
    PUNCTUATION.relevance = 0

    // Numbers
    let HEX_NUMBER = Mode()
    HEX_NUMBER.scope = .single("number")
    HEX_NUMBER.begin = .regex("[su]?0[xX][KMLHR]?[a-fA-F0-9]+")
    HEX_NUMBER.relevance = 0

    let DECIMAL_NUMBER = Mode()
    DECIMAL_NUMBER.scope = .single("number")
    DECIMAL_NUMBER.begin = .regex("[-+]?\\d+(?:[.]\\d+)?(?:[eE][-+]?\\d+(?:[.]\\d+)?)?")
    DECIMAL_NUMBER.relevance = 0

    let NUMBER = Mode()
    NUMBER.variants = [HEX_NUMBER, DECIMAL_NUMBER]

    // Label
    let LABEL = Mode()
    LABEL.scope = .single("symbol")
    LABEL.begin = .regex("^\\s*[a-z]+:")
    LABEL.relevance = 0

    // Variable (%name, %0, #0)
    let VAR_NAMED = Mode()
    VAR_NAMED.scope = .single("variable")
    VAR_NAMED.begin = .regex("%" + IDENT_RE)

    let VAR_NUMBERED = Mode()
    VAR_NUMBERED.scope = .single("variable")
    VAR_NUMBERED.begin = .regex("%\\d+")

    let VAR_HASH = Mode()
    VAR_HASH.scope = .single("variable")
    VAR_HASH.begin = .regex("#\\d+")

    let VARIABLE = Mode()
    VARIABLE.variants = [VAR_NAMED, VAR_NUMBERED, VAR_HASH]

    // Function (@name, @0, !name, !0)
    let FUNC_NAMED = Mode()
    FUNC_NAMED.scope = .single("title")
    FUNC_NAMED.begin = .regex("@" + IDENT_RE)

    let FUNC_NUMBERED = Mode()
    FUNC_NUMBERED.scope = .single("title")
    FUNC_NUMBERED.begin = .regex("@\\d+")

    let META_NAMED = Mode()
    META_NAMED.scope = .single("title")
    META_NAMED.begin = .regex("!" + IDENT_RE)

    let META_NUMBERED_NAMED = Mode()
    META_NUMBERED_NAMED.scope = .single("title")
    META_NUMBERED_NAMED.begin = .regex("!\\d+" + IDENT_RE)

    let META_NUMBERED = Mode()
    META_NUMBERED.scope = .single("title")
    META_NUMBERED.begin = .regex("!\\d+")

    let FUNCTION = Mode()
    FUNCTION.variants = [FUNC_NAMED, FUNC_NUMBERED, META_NAMED, META_NUMBERED_NAMED, META_NUMBERED]

    // Empty comment check (statement terminator in other languages)
    let EMPTY_COMMENT = Mode()
    EMPTY_COMMENT.scope = .single("comment")
    EMPTY_COMMENT.begin = .regex(";\\s*$")
    EMPTY_COMMENT.relevance = 0

    // Regular comment
    let COMMENT = Mode()
    COMMENT.scope = .single("comment")
    COMMENT.begin = .regex(";")
    COMMENT.end = .regex("$")

    // Escape in strings
    let CHAR_ESCAPE = Mode()
    CHAR_ESCAPE.scope = .single("char.escape")
    CHAR_ESCAPE.begin = .regex("\\\\\\d\\d")

    // String
    let STRING = Mode()
    STRING.scope = .single("string")
    STRING.begin = .regex("\"")
    STRING.end = .regex("\"")
    STRING.contains = [.mode(CHAR_ESCAPE)]

    lang.contains = [
        .mode(INT_TYPE),
        .mode(EMPTY_COMMENT),
        .mode(COMMENT),
        .mode(STRING),
        .mode(FUNCTION),
        .mode(PUNCTUATION),
        .mode(OPERATOR),
        .mode(VARIABLE),
        .mode(LABEL),
        .mode(NUMBER)
    ]

    return lang
}

/// Register LLVM language
public extension HighlightJS {
    func registerLlvm() {
        registerLanguage("llvm", definition: llvmLanguage)
    }
}
