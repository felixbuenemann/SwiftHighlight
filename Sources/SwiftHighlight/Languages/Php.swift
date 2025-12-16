// Auto-generated from highlight.js
// Language: php

import Foundation

/// php language definition
public func phpLanguage(_ hljs: HighlightJS) -> Language {
    let lang = Language()
    lang.name = "php"

    lang.keywords = .grouped([
        "keyword": ["__CLASS__", "__DIR__", "__FILE__", "__FUNCTION__", "__COMPILER_HALT_OFFSET__", "__LINE__", "__METHOD__", "__NAMESPACE__", "__TRAIT__", "die", "echo", "exit", "include", "include_once", "print", "require", "require_once", "array", "abstract", "and", "as", "binary", "bool", "boolean", "break", "callable", "case", "catch", "class", "clone", "const", "continue", "declare", "default", "do", "double", "else", "elseif", "empty", "enddeclare", "endfor", "endforeach", "endif", "endswitch", "endwhile", "enum", "eval", "extends", "final", "finally", "float", "for", "foreach", "from", "global", "goto", "if", "implements", "instanceof", "insteadof", "int", "integer", "interface", "isset", "iterable", "list", "match|0", "mixed", "new", "never", "object", "or", "private", "protected", "public", "readonly", "real", "return", "string", "switch", "throw", "trait", "try", "unset", "use", "var", "void", "while", "xor", "yield"] as Any,
        "literal": ["false", "FALSE", "null", "NULL", "true", "TRUE"] as Any,
        "built_in": ["Error|0", "AppendIterator", "ArgumentCountError", "ArithmeticError", "ArrayIterator", "ArrayObject", "AssertionError", "BadFunctionCallException", "BadMethodCallException", "CachingIterator", "CallbackFilterIterator", "CompileError", "Countable", "DirectoryIterator", "DivisionByZeroError", "DomainException", "EmptyIterator", "ErrorException", "Exception", "FilesystemIterator", "FilterIterator", "GlobIterator", "InfiniteIterator", "InvalidArgumentException", "IteratorIterator", "LengthException", "LimitIterator", "LogicException", "MultipleIterator", "NoRewindIterator", "OutOfBoundsException", "OutOfRangeException", "OuterIterator", "OverflowException", "ParentIterator", "ParseError", "RangeException", "RecursiveArrayIterator", "RecursiveCachingIterator", "RecursiveCallbackFilterIterator", "RecursiveDirectoryIterator", "RecursiveFilterIterator", "RecursiveIterator", "RecursiveIteratorIterator", "RecursiveRegexIterator", "RecursiveTreeIterator", "RegexIterator", "RuntimeException", "SeekableIterator", "SplDoublyLinkedList", "SplFileInfo", "SplFileObject", "SplFixedArray", "SplHeap", "SplMaxHeap", "SplMinHeap", "SplObjectStorage", "SplObserver", "SplPriorityQueue", "SplQueue", "SplStack", "SplSubject", "SplTempFileObject", "TypeError", "UnderflowException", "UnexpectedValueException", "UnhandledMatchError", "ArrayAccess", "BackedEnum", "Closure", "Fiber", "Generator", "Iterator", "IteratorAggregate", "Serializable", "Stringable", "Throwable", "Traversable", "UnitEnum", "WeakReference", "WeakMap", "Directory", "__PHP_Incomplete_Class", "parent", "php_user_filter", "[object Object]", "static", "stdClass"] as Any,
    ])
    lang.contains = [
        .mode({
            let mode = Mode()
            mode.begin = .regex("/#\\[\\s*\\\\?/(?:/(\\\\?[A-Z][a-z0-9_\\x7f-\\xff]+|\\\\?[A-Z]+(?=[A-Z][a-z0-9_\\x7f-\\xff])){1,}//(?![A-Za-z0-9])(?![$])/|/[A-Z]+//(?![A-Za-z0-9])(?![$])/)")
            mode.end = .regex("]")
            mode.beginScope = .single("meta")
            mode.endScope = .single("meta")
            mode.keywords = .grouped([
                "literal": ["false", "null", "true"] as Any,
                "keyword": ["new", "array"] as Any,
            ])

            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\[")
                    mode.end = .regex("]")
                    mode.keywords = .grouped([
                        "literal": ["false", "null", "true"] as Any,
                        "keyword": ["new", "array"] as Any,
                    ])

                    mode.contains = [
                        .selfReference,
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("/[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff]*//(?![A-Za-z0-9])(?![$])/(?=:)(?=(?!::))")
                            mode.scope = .single("attr")
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .array([.regex("/::/(?=(?!class\\b))"), .regex("/[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff]*//(?![A-Za-z0-9])(?![$])/\\b(?!\\()")])
                                    mode.scope = .multi([2: "variable.constant"])
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .array([.regex("::"), .regex("class")])
                                    mode.scope = .multi([2: "variable.language"])
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .array([.regex("/(\\\\?[A-Z][a-z0-9_\\x7f-\\xff]+|\\\\?[A-Z]+(?=[A-Z][a-z0-9_\\x7f-\\xff])){1,}//(?![A-Za-z0-9])(?![$])/"), .regex("/::/(?=(?!class\\b))"), .regex("/[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff]*//(?![A-Za-z0-9])(?![$])/\\b(?!\\()")])
                                    mode.scope = .multi([1: "title.class", 3: "variable.constant"])
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .array([.regex("/(\\\\?[A-Z][a-z0-9_\\x7f-\\xff]+|\\\\?[A-Z]+(?=[A-Z][a-z0-9_\\x7f-\\xff])){1,}//(?![A-Za-z0-9])(?![$])/"), .regex("::(?=(?!class\\b))")])
                                    mode.scope = .multi([1: "title.class"])
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .array([.regex("/(\\\\?[A-Z][a-z0-9_\\x7f-\\xff]+|\\\\?[A-Z]+(?=[A-Z][a-z0-9_\\x7f-\\xff])){1,}//(?![A-Za-z0-9])(?![$])/"), .regex("::"), .regex("class")])
                                    mode.scope = .multi([1: "title.class", 3: "variable.language"])
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode(CommonModes.C_BLOCK_COMMENT_MODE()),
                        .mode(CommonModes.C_LINE_COMMENT_MODE()),
                        .mode(CommonModes.HASH_COMMENT_MODE()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("string")
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\"")
                                    mode.end = .regex("\"")
                                    mode.scope = .single("string")
                                    mode.contains = [
                                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                                        .mode({
                                            let mode = Mode()
                                            mode.scope = .single("subst")
                                            mode.variants = [
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\$\\w+")
                                                    return mode
                                                }(),
                                                {
                                                    let mode = Mode()
                                                    mode.begin = .regex("\\{\\$")
                                                    mode.end = .regex("\\}")
                                                    return mode
                                                }(),
                                            ]
                                            return mode
                                        }()),
                                    ]
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("'")
                                    mode.end = .regex("'")
                                    mode.scope = .single("string")
                                    mode.contains = [
                                        .mode(CommonModes.BACKSLASH_ESCAPE()),
                                    ]
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("<<<[ \\t]*(?:(\\w+)|\"(\\w+)\")\\n")
                                    mode.end = .regex("[ \\t]*(\\w+)\\b")
                                    mode.contains = [
                                        /* circular ref: __ref_0 */ .mode(Mode()),
                                        /* circular ref: __ref_1 */ .mode(Mode()),
                                    ]
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("<<<[ \\t]*'(\\w+)'\\n")
                                    mode.end = .regex("[ \\t]*(\\w+)\\b")
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                        .mode({
                            let mode = Mode()
                            mode.scope = .single("number")
                            mode.relevance = 0
                            mode.variants = [
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\b0[bB][01]+(?:_[01]+)*\\b")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\b0[oO][0-7]+(?:_[0-7]+)*\\b")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("\\b0[xX][\\da-fA-F]+(?:_[\\da-fA-F]+)*\\b")
                                    return mode
                                }(),
                                {
                                    let mode = Mode()
                                    mode.begin = .regex("(?:\\b\\d+(?:_\\d+)*(\\.(?:\\d+(?:_\\d+)*))?|\\B\\.\\d+)(?:[eE][+-]?\\d+)?")
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
                                    mode.begin = .array([.regex("new"), .regex("[ \t\n]+"), .regex("(?!Error\\b|AppendIterator\\b|ArgumentCountError\\b|ArithmeticError\\b|ArrayIterator\\b|ArrayObject\\b|AssertionError\\b|BadFunctionCallException\\b|BadMethodCallException\\b|CachingIterator\\b|CallbackFilterIterator\\b|CompileError\\b|Countable\\b|DirectoryIterator\\b|DivisionByZeroError\\b|DomainException\\b|EmptyIterator\\b|ErrorException\\b|Exception\\b|FilesystemIterator\\b|FilterIterator\\b|GlobIterator\\b|InfiniteIterator\\b|InvalidArgumentException\\b|IteratorIterator\\b|LengthException\\b|LimitIterator\\b|LogicException\\b|MultipleIterator\\b|NoRewindIterator\\b|OutOfBoundsException\\b|OutOfRangeException\\b|OuterIterator\\b|OverflowException\\b|ParentIterator\\b|ParseError\\b|RangeException\\b|RecursiveArrayIterator\\b|RecursiveCachingIterator\\b|RecursiveCallbackFilterIterator\\b|RecursiveDirectoryIterator\\b|RecursiveFilterIterator\\b|RecursiveIterator\\b|RecursiveIteratorIterator\\b|RecursiveRegexIterator\\b|RecursiveTreeIterator\\b|RegexIterator\\b|RuntimeException\\b|SeekableIterator\\b|SplDoublyLinkedList\\b|SplFileInfo\\b|SplFileObject\\b|SplFixedArray\\b|SplHeap\\b|SplMaxHeap\\b|SplMinHeap\\b|SplObjectStorage\\b|SplObserver\\b|SplPriorityQueue\\b|SplQueue\\b|SplStack\\b|SplSubject\\b|SplTempFileObject\\b|TypeError\\b|UnderflowException\\b|UnexpectedValueException\\b|UnhandledMatchError\\b|ArrayAccess\\b|BackedEnum\\b|Closure\\b|Fiber\\b|Generator\\b|Iterator\\b|IteratorAggregate\\b|Serializable\\b|Stringable\\b|Throwable\\b|Traversable\\b|UnitEnum\\b|WeakReference\\b|WeakMap\\b|Directory\\b|__PHP_Incomplete_Class\\b|parent\\b|php_user_filter\\b|self\\b|static\\b|stdClass\\b)"), .regex("/(\\\\?[A-Z][a-z0-9_\\x7f-\\xff]+|\\\\?[A-Z]+(?=[A-Z][a-z0-9_\\x7f-\\xff])){1,}//(?![A-Za-z0-9])(?![$])/")])
                                    mode.scope = .multi([1: "keyword", 4: "title.class"])
                                    return mode
                                }(),
                            ]
                            return mode
                        }()),
                    ]
                    return mode
                }()),
                /* circular ref: __ref_2 */ .mode(Mode()),
                /* circular ref: __ref_3 */ .mode(Mode()),
                /* circular ref: __ref_4 */ .mode(Mode()),
                /* circular ref: __ref_5 */ .mode(Mode()),
                /* circular ref: __ref_6 */ .mode(Mode()),
                /* circular ref: __ref_7 */ .mode(Mode()),
                /* circular ref: __ref_8 */ .mode(Mode()),
                /* circular ref: __ref_9 */ .mode(Mode()),
                .mode({
                    let mode = Mode()
                    mode.scope = .single("meta")
                    mode.variants = [
                        {
                            let mode = Mode()
                            mode.begin = .regex("/(\\\\?[A-Z][a-z0-9_\\x7f-\\xff]+|\\\\?[A-Z]+(?=[A-Z][a-z0-9_\\x7f-\\xff])){1,}//(?![A-Za-z0-9])(?![$])/")
                            return mode
                        }(),
                        {
                            let mode = Mode()
                            mode.begin = .regex("/[A-Z]+//(?![A-Za-z0-9])(?![$])/")
                            return mode
                        }(),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        /* circular ref: __ref_6 */ .mode(Mode()),
        .mode(CommonModes.COMMENT("//", "$")),
        .mode(CommonModes.COMMENT("/\\*", "\\*/")),
        .mode({
            let mode = Mode()
            mode.begin = .regex("__halt_compiler\\(\\);")
            mode.keywords = .simple("__halt_compiler")

            mode.starts = {
                {
                    let mode = Mode()
                    mode.scope = .single("comment")
                    mode.contains = [
                        .mode({
                            let mode = Mode()
                            mode.begin = .regex("\\?>")
                            mode.scope = .single("meta")
                            mode.endsParent = true
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
            mode.scope = .single("meta")
            mode.variants = [
                {
                    let mode = Mode()
                    mode.begin = .regex("<\\?php")
                    mode.relevance = 10
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("<\\?=")
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("<\\?")
                    mode.relevance = 0.1
                    return mode
                }(),
                {
                    let mode = Mode()
                    mode.begin = .regex("\\?>")
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$this\\b")
            mode.scope = .single("variable.language")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .regex("\\$+/[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff]*//(?![A-Za-z0-9])(?![$])/")
            mode.scope = .single("variable")
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("\\b"), .regex("(?!fn\\b|function\\b|__CLASS__\\b|__DIR__\\b|__FILE__\\b|__FUNCTION__\\b|__COMPILER_HALT_OFFSET__\\b|__LINE__\\b|__METHOD__\\b|__NAMESPACE__\\b|__TRAIT__\\b|die\\b|echo\\b|exit\\b|include\\b|include_once\\b|print\\b|require\\b|require_once\\b|array\\b|abstract\\b|and\\b|as\\b|binary\\b|bool\\b|boolean\\b|break\\b|callable\\b|case\\b|catch\\b|class\\b|clone\\b|const\\b|continue\\b|declare\\b|default\\b|do\\b|double\\b|else\\b|elseif\\b|empty\\b|enddeclare\\b|endfor\\b|endforeach\\b|endif\\b|endswitch\\b|endwhile\\b|enum\\b|eval\\b|extends\\b|final\\b|finally\\b|float\\b|for\\b|foreach\\b|from\\b|global\\b|goto\\b|if\\b|implements\\b|instanceof\\b|insteadof\\b|int\\b|integer\\b|interface\\b|isset\\b|iterable\\b|list\\b|match\\b|mixed\\b|new\\b|never\\b|object\\b|or\\b|private\\b|protected\\b|public\\b|readonly\\b|real\\b|return\\b|string\\b|switch\\b|throw\\b|trait\\b|try\\b|unset\\b|use\\b|var\\b|void\\b|while\\b|xor\\b|yield|Error\\b|AppendIterator\\b|ArgumentCountError\\b|ArithmeticError\\b|ArrayIterator\\b|ArrayObject\\b|AssertionError\\b|BadFunctionCallException\\b|BadMethodCallException\\b|CachingIterator\\b|CallbackFilterIterator\\b|CompileError\\b|Countable\\b|DirectoryIterator\\b|DivisionByZeroError\\b|DomainException\\b|EmptyIterator\\b|ErrorException\\b|Exception\\b|FilesystemIterator\\b|FilterIterator\\b|GlobIterator\\b|InfiniteIterator\\b|InvalidArgumentException\\b|IteratorIterator\\b|LengthException\\b|LimitIterator\\b|LogicException\\b|MultipleIterator\\b|NoRewindIterator\\b|OutOfBoundsException\\b|OutOfRangeException\\b|OuterIterator\\b|OverflowException\\b|ParentIterator\\b|ParseError\\b|RangeException\\b|RecursiveArrayIterator\\b|RecursiveCachingIterator\\b|RecursiveCallbackFilterIterator\\b|RecursiveDirectoryIterator\\b|RecursiveFilterIterator\\b|RecursiveIterator\\b|RecursiveIteratorIterator\\b|RecursiveRegexIterator\\b|RecursiveTreeIterator\\b|RegexIterator\\b|RuntimeException\\b|SeekableIterator\\b|SplDoublyLinkedList\\b|SplFileInfo\\b|SplFileObject\\b|SplFixedArray\\b|SplHeap\\b|SplMaxHeap\\b|SplMinHeap\\b|SplObjectStorage\\b|SplObserver\\b|SplPriorityQueue\\b|SplQueue\\b|SplStack\\b|SplSubject\\b|SplTempFileObject\\b|TypeError\\b|UnderflowException\\b|UnexpectedValueException\\b|UnhandledMatchError\\b|ArrayAccess\\b|BackedEnum\\b|Closure\\b|Fiber\\b|Generator\\b|Iterator\\b|IteratorAggregate\\b|Serializable\\b|Stringable\\b|Throwable\\b|Traversable\\b|UnitEnum\\b|WeakReference\\b|WeakMap\\b|Directory\\b|__PHP_Incomplete_Class\\b|parent\\b|php_user_filter\\b|self\\b|static\\b|stdClass\\b)"), .regex("/[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff]*//(?![A-Za-z0-9])(?![$])/"), .regex("[ \t\n]*"), .regex("(?=(?=\\())")])
            mode.scope = .multi([3: "title.function.invoke"])
            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_10" as Any,
                    ])

                    mode.relevance = 0
                    mode.contains = [
                        /* circular ref: __ref_2 */ .mode(Mode()),
                        /* circular ref: __ref_11 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        /* circular ref: __ref_4 */ .mode(Mode()),
                        /* circular ref: __ref_5 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                        /* circular ref: __ref_7 */ .mode(Mode()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                        /* circular ref: __ref_9 */ .mode(Mode()),
                        /* circular ref: __ref_12 */ .mode(Mode()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        /* circular ref: __ref_3 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.begin = .array([.regex("const"), .regex("\\s"), .regex("/[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff]*//(?![A-Za-z0-9])(?![$])/")])
            mode.scope = .multi([1: "keyword", 3: "variable.constant"])
            return mode
        }()),
        /* circular ref: __ref_9 */ .mode(Mode()),
        .mode({
            let mode = Mode()
            mode.end = .regex("[;{]")
            mode.scope = .single("function")
            mode.beginKeywords = "fn function"
            mode.illegal = .regex("[$%\\[]")
            mode.relevance = 0
            mode.excludeEnd = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.beginKeywords = "use"
                    return mode
                }()),
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("=>")
                    mode.endsParent = true
                    return mode
                }()),
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\(")
                    mode.end = .regex("\\)")
                    mode.scope = .single("params")
                    mode.keywords = .grouped([
                        "__circularRef": "__ref_10" as Any,
                    ])

                    mode.excludeBegin = true
                    mode.excludeEnd = true
                    mode.contains = [
                        .selfReference,
                        /* circular ref: __ref_13 */ .mode(Mode()),
                        /* circular ref: __ref_11 */ .mode(Mode()),
                        /* circular ref: __ref_3 */ .mode(Mode()),
                        /* circular ref: __ref_4 */ .mode(Mode()),
                        /* circular ref: __ref_5 */ .mode(Mode()),
                        /* circular ref: __ref_6 */ .mode(Mode()),
                        /* circular ref: __ref_7 */ .mode(Mode()),
                        /* circular ref: __ref_8 */ .mode(Mode()),
                    ]
                    return mode
                }()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex("\\{")
            mode.scope = .single("class")
            mode.relevance = 0
            mode.excludeEnd = true
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.beginKeywords = "extends implements"
                    return mode
                }()),
                /* circular ref: __ref_14 */ .mode(Mode()),
            ]
            mode.variants = [
                {
                    let mode = Mode()
                    return mode
                }(),
                {
                    let mode = Mode()
                    return mode
                }(),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex(";")
            mode.beginKeywords = "namespace"
            mode.illegal = .regex("[.']")
            mode.relevance = 0
            mode.contains = [
                .mode(CommonModes.UNDERSCORE_TITLE_MODE()),
            ]
            return mode
        }()),
        .mode({
            let mode = Mode()
            mode.end = .regex(";")
            mode.beginKeywords = "use"
            mode.relevance = 0
            mode.contains = [
                .mode({
                    let mode = Mode()
                    mode.begin = .regex("\\b(as|const|function)\\b")
                    mode.scope = .single("keyword")
                    return mode
                }()),
                /* circular ref: __ref_14 */ .mode(Mode()),
            ]
            return mode
        }()),
        /* circular ref: __ref_7 */ .mode(Mode()),
        /* circular ref: __ref_8 */ .mode(Mode()),
    ]

    return lang
}

/// Register php language
public extension HighlightJS {
    func registerPhp() {
        registerLanguage("php", definition: phpLanguage)
    }
}
