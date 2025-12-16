// Language: PowerShell
// Author: David Mohundro <david@mohundro.com>
// Category: scripting

import Foundation

/// PowerShell language definition
public func powershellLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "PowerShell"
    lang.aliases = ["pwsh", "ps", "ps1"]
    lang.caseInsensitive = true

    lang.keywords = .grouped([
        "keyword": "if else foreach return do while until elseif begin for trap data dynamicparam end break throw param continue finally in switch exit filter try process catch hidden static parameter" as Any,
        "built_in": "ac asnp cat cd CFS chdir clc clear clhy cli clp cls clv cnsn compare copy cp cpi cpp curl cvpa dbp del diff dir dnsn ebp echo epal epcsv epsn erase etsn exsn fc fhx fl ft fw gal gbp gc gcb gci gcm gcs gdr gerr ghy gi gin gjb gl gm gmo gp gps gpv group gsn gsnp gsv gtz gu gv gwmi h history icm iex ihy ii ipal ipcsv ipmo ipsn irm ise iwmi iwr kill lp ls man md measure mi mount move mp mv nal ndr ni nmo npssc nsn nv ogv oh popd ps pushd pwd r rbp rcjb rcsn rd rdr ren ri rjb rm rmdir rmo rni rnp rp rsn rsnp rujb rv rvpa rwmi sajb sal saps sasv sbp sc scb select set shcm si sl sleep sls sort sp spjb spps spsv start stz sujb sv swmi tee trcm type wget where wjb write" as Any,
        "literal": "true false null" as Any
    ])

    // Backtick escape
    let BACKTICK_ESCAPE = Mode()
    BACKTICK_ESCAPE.begin = .regex("`[\\s\\S]")
    BACKTICK_ESCAPE.relevance = 0

    // Variables
    let VAR_SIMPLE = Mode()
    VAR_SIMPLE.scope = .single("variable")
    VAR_SIMPLE.begin = .regex("\\$\\B")

    let VAR_THIS = Mode()
    VAR_THIS.scope = .single("keyword")
    VAR_THIS.begin = .regex("\\$this")

    let VAR_NAMED = Mode()
    VAR_NAMED.scope = .single("variable")
    VAR_NAMED.begin = .regex("\\$[\\w\\d][\\w\\d_:]*")

    let VAR = Mode()
    VAR.variants = [VAR_SIMPLE, VAR_THIS, VAR_NAMED]

    // Literals
    let LITERAL = Mode()
    LITERAL.scope = .single("literal")
    LITERAL.begin = .regex("\\$(null|true|false)\\b")

    // Strings
    let VAR_IN_STRING = Mode()
    VAR_IN_STRING.scope = .single("variable")
    VAR_IN_STRING.begin = .regex("\\$[A-z]")
    VAR_IN_STRING.end = .regex("[^A-z]")

    let QUOTE_STRING = Mode()
    QUOTE_STRING.scope = .single("string")
    QUOTE_STRING.begin = .regex("\"")
    QUOTE_STRING.end = .regex("\"")
    QUOTE_STRING.contains = [.mode(BACKTICK_ESCAPE), .mode(VAR), .mode(VAR_IN_STRING)]

    let HERE_STRING = Mode()
    HERE_STRING.scope = .single("string")
    HERE_STRING.begin = .regex("@\"")
    HERE_STRING.end = .regex("^\"@")
    HERE_STRING.contains = [.mode(BACKTICK_ESCAPE), .mode(VAR), .mode(VAR_IN_STRING)]

    let APOS_STRING = Mode()
    APOS_STRING.scope = .single("string")
    APOS_STRING.begin = .regex("'")
    APOS_STRING.end = .regex("'")

    let HERE_APOS_STRING = Mode()
    HERE_APOS_STRING.scope = .single("string")
    HERE_APOS_STRING.begin = .regex("@'")
    HERE_APOS_STRING.end = .regex("^'@")

    // Comments
    let DOCTAG = Mode()
    DOCTAG.scope = .single("doctag")
    DOCTAG.begin = .regex("\\.(synopsis|description|example|inputs|outputs|notes|link|component|role|functionality|parameter|forwardhelptargetname|forwardhelpcategory|remotehelprunspace|externalhelp)(\\s+\\S+)?")

    let LINE_COMMENT = Mode()
    LINE_COMMENT.scope = .single("comment")
    LINE_COMMENT.begin = .regex("#")
    LINE_COMMENT.end = .regex("$")
    LINE_COMMENT.contains = [.mode(DOCTAG)]

    let BLOCK_COMMENT = Mode()
    BLOCK_COMMENT.scope = .single("comment")
    BLOCK_COMMENT.begin = .regex("<#")
    BLOCK_COMMENT.end = .regex("#>")
    BLOCK_COMMENT.contains = [.mode(DOCTAG)]

    let COMMENT = Mode()
    COMMENT.variants = [LINE_COMMENT, BLOCK_COMMENT]

    // Cmdlets
    let VALID_VERBS = "Add|Clear|Close|Copy|Enter|Exit|Find|Format|Get|Hide|Join|Lock|Move|New|Open|Optimize|Pop|Push|Redo|Remove|Rename|Reset|Resize|Search|Select|Set|Show|Skip|Split|Step|Switch|Undo|Unlock|Watch|Backup|Checkpoint|Compare|Compress|Convert|ConvertFrom|ConvertTo|Dismount|Edit|Expand|Export|Group|Import|Initialize|Limit|Merge|Mount|Out|Publish|Restore|Save|Sync|Unpublish|Update|Approve|Assert|Build|Complete|Confirm|Deny|Deploy|Disable|Enable|Install|Invoke|Register|Request|Restart|Resume|Start|Stop|Submit|Suspend|Uninstall|Unregister|Wait|Debug|Measure|Ping|Repair|Resolve|Test|Trace|Connect|Disconnect|Read|Receive|Send|Write|Block|Grant|Protect|Revoke|Unblock|Unprotect|Use|ForEach|Sort|Tee|Where"

    let CMDLETS = Mode()
    CMDLETS.scope = .single("built_in")
    CMDLETS.begin = .regex("(" + VALID_VERBS + ")+-[\\w\\d]+")

    // Class definition
    let CLASS_TITLE = Mode()
    CLASS_TITLE.scope = .single("title")
    CLASS_TITLE.begin = .regex("\\w[\\w\\d]*")
    CLASS_TITLE.relevance = 0

    let CLASS = Mode()
    CLASS.scope = .single("class")
    CLASS.beginKeywords = "class enum"
    CLASS.end = .regex("\\s*[{]")
    CLASS.excludeEnd = true
    CLASS.relevance = 0
    CLASS.contains = [.mode(CLASS_TITLE)]

    // Function definition
    let FUNC_KEYWORD = Mode()
    FUNC_KEYWORD.scope = .single("keyword")
    FUNC_KEYWORD.begin = .regex("function")
    FUNC_KEYWORD.relevance = 0

    let FUNC_TITLE = Mode()
    FUNC_TITLE.scope = .single("title")
    FUNC_TITLE.begin = .regex("\\w[\\w\\d]*((-)[\\w\\d]+)*")
    FUNC_TITLE.relevance = 0

    let FUNC_PARAMS = Mode()
    FUNC_PARAMS.scope = .single("params")
    FUNC_PARAMS.begin = .regex("\\(")
    FUNC_PARAMS.end = .regex("\\)")
    FUNC_PARAMS.relevance = 0
    FUNC_PARAMS.contains = [.mode(VAR)]

    let FUNCTION = Mode()
    FUNCTION.scope = .single("function")
    FUNCTION.begin = .regex("function\\s+")
    FUNCTION.end = .regex("\\s*\\{|$")
    FUNCTION.excludeEnd = true
    FUNCTION.returnBegin = true
    FUNCTION.relevance = 0
    FUNCTION.contains = [.mode(FUNC_KEYWORD), .mode(FUNC_TITLE), .mode(FUNC_PARAMS)]

    // Using statement
    let USING_KEYWORD = Mode()
    USING_KEYWORD.scope = .single("keyword")
    USING_KEYWORD.begin = .regex("(using|assembly|command|module|namespace|type)")

    let USING = Mode()
    USING.begin = .regex("using\\s")
    USING.end = .regex("$")
    USING.returnBegin = true
    USING.contains = [.mode(QUOTE_STRING), .mode(APOS_STRING), .mode(USING_KEYWORD)]

    // Comparison operators
    let COMPARISON_OPERATORS = "-and|-as|-band|-bnot|-bor|-bxor|-casesensitive|-ccontains|-ceq|-cge|-cgt|-cle|-clike|-clt|-cmatch|-cne|-cnotcontains|-cnotlike|-cnotmatch|-contains|-creplace|-csplit|-eq|-exact|-f|-file|-ge|-gt|-icontains|-ieq|-ige|-igt|-ile|-ilike|-ilt|-imatch|-in|-ine|-inotcontains|-inotlike|-inotmatch|-ireplace|-is|-isnot|-isplit|-join|-le|-like|-lt|-match|-ne|-not|-notcontains|-notin|-notlike|-notmatch|-or|-regex|-replace|-shl|-shr|-split|-wildcard|-xor"

    let OPERATOR = Mode()
    OPERATOR.scope = .single("operator")
    OPERATOR.begin = .regex("(" + COMPARISON_OPERATORS + ")\\b")

    let ARGUMENT = Mode()
    ARGUMENT.scope = .single("literal")
    ARGUMENT.begin = .regex("(-){1,2}[\\w\\d-]+")
    ARGUMENT.relevance = 0

    let PS_ARGUMENTS = Mode()
    PS_ARGUMENTS.variants = [OPERATOR, ARGUMENT]

    // Type
    let TYPE_NAME = Mode()
    TYPE_NAME.scope = .single("type")
    TYPE_NAME.begin = .regex("[.\\w\\d]+")
    TYPE_NAME.relevance = 0

    let TYPE = Mode()
    TYPE.begin = .regex("\\[")
    TYPE.end = .regex("\\]")
    TYPE.excludeBegin = true
    TYPE.excludeEnd = true
    TYPE.relevance = 0
    TYPE.contains = [.selfReference, .mode(COMMENT), .mode(BACKTICK_ESCAPE), .mode(CommonModes.NUMBER_MODE()), .mode(QUOTE_STRING), .mode(APOS_STRING), .mode(CMDLETS), .mode(VAR), .mode(LITERAL), .mode(TYPE_NAME)]

    // Hash signs
    let HASH_SIGNS = Mode()
    HASH_SIGNS.scope = .single("selector-tag")
    HASH_SIGNS.begin = .regex("@\\B")
    HASH_SIGNS.relevance = 0

    lang.contains = [
        .mode(COMMENT),
        .mode(BACKTICK_ESCAPE),
        .mode(CommonModes.NUMBER_MODE()),
        .mode(QUOTE_STRING),
        .mode(HERE_STRING),
        .mode(APOS_STRING),
        .mode(HERE_APOS_STRING),
        .mode(CMDLETS),
        .mode(VAR),
        .mode(LITERAL),
        .mode(HASH_SIGNS),
        .mode(CLASS),
        .mode(FUNCTION),
        .mode(USING),
        .mode(PS_ARGUMENTS),
        .mode(TYPE)
    ]

    return lang
}

/// Register PowerShell language
public extension HighlightJS {
    func registerPowershell() {
        registerLanguage("powershell", definition: powershellLanguage)
    }
}
