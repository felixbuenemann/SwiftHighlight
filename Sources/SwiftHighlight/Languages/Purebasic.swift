// Auto-generated from highlight.js
// Language: purebasic

import Foundation

/// purebasic language definition
public func purebasicLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "PureBASIC"

    lang.aliases = ["pb", "pbi"]
    lang.keywords = .simple("Align And Array As Break CallDebugger Case CompilerCase CompilerDefault CompilerElse CompilerElseIf CompilerEndIf CompilerEndSelect CompilerError CompilerIf CompilerSelect CompilerWarning Continue Data DataSection Debug DebugLevel Declare DeclareC DeclareCDLL DeclareDLL DeclareModule Default Define Dim DisableASM DisableDebugger DisableExplicit Else ElseIf EnableASM EnableDebugger EnableExplicit End EndDataSection EndDeclareModule EndEnumeration EndIf EndImport EndInterface EndMacro EndModule EndProcedure EndSelect EndStructure EndStructureUnion EndWith Enumeration EnumerationBinary Extends FakeReturn For ForEach ForEver Global Gosub Goto If Import ImportC IncludeBinary IncludeFile IncludePath Interface List Macro MacroExpandedCount Map Module NewList NewMap Next Not Or Procedure ProcedureC ProcedureCDLL ProcedureDLL ProcedureReturn Protected Prototype PrototypeC ReDim Read Repeat Restore Return Runtime Select Shared Static Step Structure StructureUnion Swap Threaded To UndefineMacro Until Until  UnuseModule UseModule Wend While With XIncludeFile XOr")
    lang.contains = [
        .mode(CommonModes.COMMENT(";", "$")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\b(Procedure|Declare)(C|CDLL|DLL)?\\b")
            mode.end = .regex("\\(")
            mode.scope = .single("function")
            mode.excludeEnd = true
            mode.returnBegin = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("(Procedure|Declare)(C|CDLL|DLL)?")
                    mode.scope = .single("keyword")
                    mode.excludeEnd = true
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\.\\w*")
                    mode.scope = .single("type")
                    return mode
                }()),
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(~)?\"")
            mode.end = .regex("\"")
            mode.scope = .single("string")
            mode.illegal = .regex("\\n")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#[a-zA-Z_]\\w*\\$?")
            mode.scope = .single("symbol")
            return mode
        }()),
    ]

    return lang
}

/// Register purebasic language
public extension HighlightJS {
    func registerPurebasic() {
        registerLanguage("purebasic", definition: purebasicLanguage)
    }
}
