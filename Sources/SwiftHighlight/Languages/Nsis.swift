// Auto-generated from highlight.js
// Language: nsis

import Foundation

/// nsis language definition
public func nsisLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "NSIS"

    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": ["Abort", "AddBrandingImage", "AddSize", "AllowRootDirInstall", "AllowSkipFiles", "AutoCloseWindow", "BGFont", "BGGradient", "BrandingText", "BringToFront", "Call", "CallInstDLL", "Caption", "ChangeUI", "CheckBitmap", "ClearErrors", "CompletedText", "ComponentText", "CopyFiles", "CRCCheck", "CreateDirectory", "CreateFont", "CreateShortCut", "Delete", "DeleteINISec", "DeleteINIStr", "DeleteRegKey", "DeleteRegValue", "DetailPrint", "DetailsButtonText", "DirText", "DirVar", "DirVerify", "EnableWindow", "EnumRegKey", "EnumRegValue", "Exch", "Exec", "ExecShell", "ExecShellWait", "ExecWait", "ExpandEnvStrings", "File", "FileBufSize", "FileClose", "FileErrorText", "FileOpen", "FileRead", "FileReadByte", "FileReadUTF16LE", "FileReadWord", "FileWriteUTF16LE", "FileSeek", "FileWrite", "FileWriteByte", "FileWriteWord", "FindClose", "FindFirst", "FindNext", "FindWindow", "FlushINI", "GetCurInstType", "GetCurrentAddress", "GetDlgItem", "GetDLLVersion", "GetDLLVersionLocal", "GetErrorLevel", "GetFileTime", "GetFileTimeLocal", "GetFullPathName", "GetFunctionAddress", "GetInstDirError", "GetKnownFolderPath", "GetLabelAddress", "GetTempFileName", "GetWinVer", "Goto", "HideWindow", "Icon", "IfAbort", "IfErrors", "IfFileExists", "IfRebootFlag", "IfRtlLanguage", "IfShellVarContextAll", "IfSilent", "InitPluginsDir", "InstallButtonText", "InstallColors", "InstallDir", "InstallDirRegKey", "InstProgressFlags", "InstType", "InstTypeGetText", "InstTypeSetText", "Int64Cmp", "Int64CmpU", "Int64Fmt", "IntCmp", "IntCmpU", "IntFmt", "IntOp", "IntPtrCmp", "IntPtrCmpU", "IntPtrOp", "IsWindow", "LangString", "LicenseBkColor", "LicenseData", "LicenseForceSelection", "LicenseLangString", "LicenseText", "LoadAndSetImage", "LoadLanguageFile", "LockWindow", "LogSet", "LogText", "ManifestDPIAware", "ManifestLongPathAware", "ManifestMaxVersionTested", "ManifestSupportedOS", "MessageBox", "MiscButtonText", "Name|0", "Nop", "OutFile", "Page", "PageCallbacks", "PEAddResource", "PEDllCharacteristics", "PERemoveResource", "PESubsysVer", "Pop", "Push", "Quit", "ReadEnvStr", "ReadINIStr", "ReadRegDWORD", "ReadRegStr", "Reboot", "RegDLL", "Rename", "RequestExecutionLevel", "ReserveFile", "Return", "RMDir", "SearchPath", "SectionGetFlags", "SectionGetInstTypes", "SectionGetSize", "SectionGetText", "SectionIn", "SectionSetFlags", "SectionSetInstTypes", "SectionSetSize", "SectionSetText", "SendMessage", "SetAutoClose", "SetBrandingImage", "SetCompress", "SetCompressor", "SetCompressorDictSize", "SetCtlColors", "SetCurInstType", "SetDatablockOptimize", "SetDateSave", "SetDetailsPrint", "SetDetailsView", "SetErrorLevel", "SetErrors", "SetFileAttributes", "SetFont", "SetOutPath", "SetOverwrite", "SetRebootFlag", "SetRegView", "SetShellVarContext", "SetSilent", "ShowInstDetails", "ShowUninstDetails", "ShowWindow", "SilentInstall", "SilentUnInstall", "Sleep", "SpaceTexts", "StrCmp", "StrCmpS", "StrCpy", "StrLen", "SubCaption", "Unicode", "UninstallButtonText", "UninstallCaption", "UninstallIcon", "UninstallSubCaption", "UninstallText", "UninstPage", "UnRegDLL", "Var", "VIAddVersionKey", "VIFileVersion", "VIProductVersion", "WindowIcon", "WriteINIStr", "WriteRegBin", "WriteRegDWORD", "WriteRegExpandStr", "WriteRegMultiStr", "WriteRegNone", "WriteRegStr", "WriteUninstaller", "XPStyle"] as Any,
        "literal": ["admin", "all", "auto", "both", "bottom", "bzip2", "colored", "components", "current", "custom", "directory", "false", "force", "hide", "highest", "ifdiff", "ifnewer", "instfiles", "lastused", "leave", "left", "license", "listonly", "lzma", "nevershow", "none", "normal", "notset", "off", "on", "open", "print", "right", "show", "silent", "silentlog", "smooth", "textonly", "top", "true", "try", "un.components", "un.custom", "un.directory", "un.instfiles", "un.license", "uninstConfirm", "user", "Win10", "Win7", "Win8", "WinVista", "zlib"] as Any,
    ])
    lang.contains = [
        .mode(CommonModes.HASH_COMMENT_MODE()),
        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
        .mode(CommonModes.COMMENT(";", "$")),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("Var"), .regex("\\s+"), .regex("(?:\\/GLOBAL\\s+)?"), .regex("[A-Za-z][\\w.]*")])
            mode.scope = .multi([1: "keyword", 3: "params", 4: "variable"])
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("Function"), .regex("\\s+"), .regex("/(\\.)?/[a-zA-Z]\\w*")])
            mode.scope = .multi([1: "keyword", 3: "title.function"])
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.beginKeywords = "Function PageEx Section SectionGroup FunctionEnd SectionEnd"
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.illegal = .regex("\\n")
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\$(\\\\[nrt]|\\$)")
                    mode.scope = .single("char.escape")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("/\\$/(?:ADMINTOOLS|APPDATA|CDBURN_AREA|CMDLINE|COMMONFILES32|COMMONFILES64|COMMONFILES|COOKIES|DESKTOP|DOCUMENTS|EXEDIR|EXEFILE|EXEPATH|FAVORITES|FONTS|HISTORY|HWNDPARENT|INSTDIR|INTERNET_CACHE|LANGUAGE|LOCALAPPDATA|MUSIC|NETHOOD|OUTDIR|PICTURES|PLUGINSDIR|PRINTHOOD|PROFILE|PROGRAMFILES32|PROGRAMFILES64|PROGRAMFILES|QUICKLAUNCH|RECENT|RESOURCES_LOCALIZED|RESOURCES|SENDTO|SMPROGRAMS|SMSTARTUP|STARTMENU|SYSDIR|TEMP|TEMPLATES|VIDEOS|WINDIR)")
                    mode.scope = .single("variable.constant")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\$+\\{[\\!\\w.:-]+\\}")
                    mode.scope = .single("variable")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\$+\\w[\\w\\.]*")
                    mode.scope = .single("variable")
                    mode.illegal = .regex("\\(\\)\\{\\}")
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\$+\\([\\w^.:!-]+\\)")
                    mode.scope = .single("variable")
                    return mode
                }()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("`")
                    mode.end = .regex("`")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("/!/(?:addincludedir|addplugindir|appendfile|assert|cd|define|delfile|echo|else|endif|error|execute|finalize|getdllversion|gettlbversion|if|ifdef|ifmacrodef|ifmacrondef|ifndef|include|insertmacro|macro|macroend|makensis|packhdr|searchparse|searchreplace|system|tempfile|undef|uninstfinalize|verbose|warning)")
            mode.scope = .single("keyword")
            return mode
        }()),
        /* circular ref: __ref_0 */ .mode(Mode()),
        /* circular ref: __ref_1 */ .mode(Mode()),
        /* circular ref: __ref_2 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("(?:ARCHIVE|FILE_ATTRIBUTE_ARCHIVE|FILE_ATTRIBUTE_NORMAL|FILE_ATTRIBUTE_OFFLINE|FILE_ATTRIBUTE_READONLY|FILE_ATTRIBUTE_SYSTEM|FILE_ATTRIBUTE_TEMPORARY|HKCR|HKCU|HKDD|HKEY_CLASSES_ROOT|HKEY_CURRENT_CONFIG|HKEY_CURRENT_USER|HKEY_DYN_DATA|HKEY_LOCAL_MACHINE|HKEY_PERFORMANCE_DATA|HKEY_USERS|HKLM|HKPD|HKU|IDABORT|IDCANCEL|IDIGNORE|IDNO|IDOK|IDRETRY|IDYES|MB_ABORTRETRYIGNORE|MB_DEFBUTTON1|MB_DEFBUTTON2|MB_DEFBUTTON3|MB_DEFBUTTON4|MB_ICONEXCLAMATION|MB_ICONINFORMATION|MB_ICONQUESTION|MB_ICONSTOP|MB_OK|MB_OKCANCEL|MB_RETRYCANCEL|MB_RIGHT|MB_RTLREADING|MB_SETFOREGROUND|MB_TOPMOST|MB_USERICON|MB_YESNO|NORMAL|OFFLINE|READONLY|SHCTX|SHELL_CONTEXT|SYSTEM|TEMPORARY)")
            mode.scope = .single("params")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\w+::\\w+")
            mode.scope = .single("title.function")
            return mode
        }()),
        .mode(CommonModes.NUMBER_MODE()),
    ]

    return lang
}

/// Register nsis language
public extension HighlightJS {
    func registerNsis() {
        registerLanguage("nsis", definition: nsisLanguage)
    }
}
