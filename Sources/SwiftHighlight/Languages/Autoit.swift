// Auto-generated from highlight.js
// Language: autoit

import Foundation

/// autoit language definition
public func autoitLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "AutoIt"

    lang.caseInsensitive = true
    lang.keywords = .grouped([
        "keyword": "ByRef Case Const ContinueCase ContinueLoop Dim Do Else ElseIf EndFunc EndIf EndSelect EndSwitch EndWith Enum Exit ExitLoop For Func Global If In Local Next ReDim Return Select Static Step Switch Then To Until Volatile WEnd While With" as Any,
        "built_in": "Abs ACos AdlibRegister AdlibUnRegister Asc AscW ASin Assign ATan AutoItSetOption AutoItWinGetTitle AutoItWinSetTitle Beep Binary BinaryLen BinaryMid BinaryToString BitAND BitNOT BitOR BitRotate BitShift BitXOR BlockInput Break Call CDTray Ceiling Chr ChrW ClipGet ClipPut ConsoleRead ConsoleWrite ConsoleWriteError ControlClick ControlCommand ControlDisable ControlEnable ControlFocus ControlGetFocus ControlGetHandle ControlGetPos ControlGetText ControlHide ControlListView ControlMove ControlSend ControlSetText ControlShow ControlTreeView Cos Dec DirCopy DirCreate DirGetSize DirMove DirRemove DllCall DllCallAddress DllCallbackFree DllCallbackGetPtr DllCallbackRegister DllClose DllOpen DllStructCreate DllStructGetData DllStructGetPtr DllStructGetSize DllStructSetData DriveGetDrive DriveGetFileSystem DriveGetLabel DriveGetSerial DriveGetType DriveMapAdd DriveMapDel DriveMapGet DriveSetLabel DriveSpaceFree DriveSpaceTotal DriveStatus EnvGet EnvSet EnvUpdate Eval Execute Exp FileChangeDir FileClose FileCopy FileCreateNTFSLink FileCreateShortcut FileDelete FileExists FileFindFirstFile FileFindNextFile FileFlush FileGetAttrib FileGetEncoding FileGetLongName FileGetPos FileGetShortcut FileGetShortName FileGetSize FileGetTime FileGetVersion FileInstall FileMove FileOpen FileOpenDialog FileRead FileReadLine FileReadToArray FileRecycle FileRecycleEmpty FileSaveDialog FileSelectFolder FileSetAttrib FileSetEnd FileSetPos FileSetTime FileWrite FileWriteLine Floor FtpSetProxy FuncName GUICreate GUICtrlCreateAvi GUICtrlCreateButton GUICtrlCreateCheckbox GUICtrlCreateCombo GUICtrlCreateContextMenu GUICtrlCreateDate GUICtrlCreateDummy GUICtrlCreateEdit GUICtrlCreateGraphic GUICtrlCreateGroup GUICtrlCreateIcon GUICtrlCreateInput GUICtrlCreateLabel GUICtrlCreateList GUICtrlCreateListView GUICtrlCreateListViewItem GUICtrlCreateMenu GUICtrlCreateMenuItem GUICtrlCreateMonthCal GUICtrlCreateObj GUICtrlCreatePic GUICtrlCreateProgress GUICtrlCreateRadio GUICtrlCreateSlider GUICtrlCreateTab GUICtrlCreateTabItem GUICtrlCreateTreeView GUICtrlCreateTreeViewItem GUICtrlCreateUpdown GUICtrlDelete GUICtrlGetHandle GUICtrlGetState GUICtrlRead GUICtrlRecvMsg GUICtrlRegisterListViewSort GUICtrlSendMsg GUICtrlSendToDummy GUICtrlSetBkColor GUICtrlSetColor GUICtrlSetCursor GUICtrlSetData GUICtrlSetDefBkColor GUICtrlSetDefColor GUICtrlSetFont GUICtrlSetGraphic GUICtrlSetImage GUICtrlSetLimit GUICtrlSetOnEvent GUICtrlSetPos GUICtrlSetResizing GUICtrlSetState GUICtrlSetStyle GUICtrlSetTip GUIDelete GUIGetCursorInfo GUIGetMsg GUIGetStyle GUIRegisterMsg GUISetAccelerators GUISetBkColor GUISetCoord GUISetCursor GUISetFont GUISetHelp GUISetIcon GUISetOnEvent GUISetState GUISetStyle GUIStartGroup GUISwitch Hex HotKeySet HttpSetProxy HttpSetUserAgent HWnd InetClose InetGet InetGetInfo InetGetSize InetRead IniDelete IniRead IniReadSection IniReadSectionNames IniRenameSection IniWrite IniWriteSection InputBox Int IsAdmin IsArray IsBinary IsBool IsDeclared IsDllStruct IsFloat IsFunc IsHWnd IsInt IsKeyword IsNumber IsObj IsPtr IsString Log MemGetStats Mod MouseClick MouseClickDrag MouseDown MouseGetCursor MouseGetPos MouseMove MouseUp MouseWheel MsgBox Number ObjCreate ObjCreateInterface ObjEvent ObjGet ObjName OnAutoItExitRegister OnAutoItExitUnRegister Ping PixelChecksum PixelGetColor PixelSearch ProcessClose ProcessExists ProcessGetStats ProcessList ProcessSetPriority ProcessWait ProcessWaitClose ProgressOff ProgressOn ProgressSet Ptr Random RegDelete RegEnumKey RegEnumVal RegRead RegWrite Round Run RunAs RunAsWait RunWait Send SendKeepActive SetError SetExtended ShellExecute ShellExecuteWait Shutdown Sin Sleep SoundPlay SoundSetWaveVolume SplashImageOn SplashOff SplashTextOn Sqrt SRandom StatusbarGetText StderrRead StdinWrite StdioClose StdoutRead String StringAddCR StringCompare StringFormat StringFromASCIIArray StringInStr StringIsAlNum StringIsAlpha StringIsASCII StringIsDigit StringIsFloat StringIsInt StringIsLower StringIsSpace StringIsUpper StringIsXDigit StringLeft StringLen StringLower StringMid StringRegExp StringRegExpReplace StringReplace StringReverse StringRight StringSplit StringStripCR StringStripWS StringToASCIIArray StringToBinary StringTrimLeft StringTrimRight StringUpper Tan TCPAccept TCPCloseSocket TCPConnect TCPListen TCPNameToIP TCPRecv TCPSend TCPShutdown, UDPShutdown TCPStartup, UDPStartup TimerDiff TimerInit ToolTip TrayCreateItem TrayCreateMenu TrayGetMsg TrayItemDelete TrayItemGetHandle TrayItemGetState TrayItemGetText TrayItemSetOnEvent TrayItemSetState TrayItemSetText TraySetClick TraySetIcon TraySetOnEvent TraySetPauseIcon TraySetState TraySetToolTip TrayTip UBound UDPBind UDPCloseSocket UDPOpen UDPRecv UDPSend VarGetType WinActivate WinActive WinClose WinExists WinFlash WinGetCaretPos WinGetClassList WinGetClientSize WinGetHandle WinGetPos WinGetProcess WinGetState WinGetText WinGetTitle WinKill WinList WinMenuSelectItem WinMinimizeAll WinMinimizeAllUndo WinMove WinSetOnTop WinSetState WinSetTitle WinSetTrans WinWait WinWaitActive WinWaitClose WinWaitNotActive" as Any,
        "literal": "True False And Null Not Or Default" as Any,
    ])
    lang.illegal = .regex("\\/\\*")
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex(";")
                    mode.end = .regex("$")
                    mode.scope = .single("comment")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#cs")
                    mode.end = .regex("#ce")
                    mode.scope = .single("comment")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("#comments-start")
                    mode.end = .regex("#comments-end")
                    mode.scope = .single("comment")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$[A-z0-9_]+")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.scope = .single("string")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\"")
                    mode.end = .regex("\"")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\"\"")
                            mode.relevance = 0
                            return mode
                        }()),
                    ]
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("'")
                    mode.end = .regex("'")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("''")
                            mode.relevance = 0
                            return mode
                        }()),
                    ]
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("\\b(0b[01]+)")
                    mode.scope = .single("number")
                    mode.relevance = 0
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)")
                    mode.scope = .single("number")
                    mode.relevance = 0
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("#")
            mode.end = .regex("$")
            mode.scope = .single("meta")
            mode.keywords = .grouped([
                "keyword": ["EndRegion", "forcedef", "forceref", "ignorefunc", "include", "include-once", "NoTrayIcon", "OnAutoItStartRegister", "pragma", "Region", "RequireAdmin", "Tidy_Off", "Tidy_On", "Tidy_Parameters"] as Any,
            ])

            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\\\\\n")
                    mode.relevance = 0
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.end = .regex("$")
                    mode.keywords = .grouped([
                        "keyword": "include" as Any,
                    ])

                    mode.beginKeywords = "include"
                    mode.contains = [
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("string")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("<")
                                    mode.end = .regex(">")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\"")
                                    mode.end = .regex("\"")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("\"\"")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("'")
                                    mode.end = .regex("'")
                                    mode.contains = [
                                        .mode({
                                            let mode = Mode()
                                            mode.begin = .regex("''")
                                            mode.relevance = 0
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_0 */ .mode(Mode()),
                /* circular ref: __ref_1 */ .mode(Mode()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("@[A-z0-9_]+")
            mode.scope = .single("symbol")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("$")
            mode.beginKeywords = "Func"
            mode.illegal = .regex("\\$|\\[|%")
            mode.contains = [
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.contains = [
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_0 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
    ]

    return lang
}

/// Register autoit language
public extension HighlightJS {
    func registerAutoit() {
        registerLanguage("autoit", definition: autoitLanguage)
    }
}
