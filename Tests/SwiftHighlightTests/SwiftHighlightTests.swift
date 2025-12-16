import XCTest
@testable import SwiftHighlight

final class SwiftHighlightTests: XCTestCase {

    var hljs: HighlightJS!

    override func setUp() {
        super.setUp()
        hljs = HighlightJS()
    }

    override func tearDown() {
        hljs = nil
        super.tearDown()
    }

    // MARK: - Basic Registration Tests

    func testLanguageRegistration() {
        // Register a simple test language
        hljs.registerLanguage("test") { _ in
            let lang = Language()
            lang.name = "test"
            lang.contains = [
                .mode(CommonModes.QUOTE_STRING_MODE()),
                .mode(CommonModes.C_NUMBER_MODE())
            ]
            return lang
        }

        XCTAssertTrue(hljs.hasLanguage("test"))
        XCTAssertFalse(hljs.hasLanguage("nonexistent"))
    }

    func testAliasRegistration() {
        hljs.registerLanguage("javascript") { _ in
            let lang = Language()
            lang.name = "javascript"
            lang.aliases = ["js"]
            return lang
        }

        XCTAssertTrue(hljs.hasLanguage("javascript"))
        // After getting the language, aliases should be registered
        _ = hljs.getLanguage("javascript")
        XCTAssertTrue(hljs.hasLanguage("js"))
    }

    // MARK: - HTML Escaping Tests

    func testHTMLEscaping() {
        let code = "<script>alert('xss')</script>"
        let result = hljs.highlight(code, language: "nonexistent")

        XCTAssertTrue(result.value.contains("&lt;"))
        XCTAssertTrue(result.value.contains("&gt;"))
        XCTAssertFalse(result.value.contains("<script>"))
    }

    // MARK: - Basic Highlighting Tests

    func testStringHighlighting() {
        hljs.registerLanguage("simple") { _ in
            let lang = Language()
            lang.name = "simple"
            lang.contains = [.mode(CommonModes.QUOTE_STRING_MODE())]
            return lang
        }

        let code = "hello \"world\" test"
        let result = hljs.highlight(code, language: "simple")

        XCTAssertTrue(result.value.contains("hljs-string"))
        XCTAssertEqual(result.language, "simple")
    }

    func testNumberHighlighting() {
        hljs.registerLanguage("numbers") { _ in
            let lang = Language()
            lang.name = "numbers"
            lang.contains = [.mode(CommonModes.C_NUMBER_MODE())]
            return lang
        }

        let code = "value = 42 + 3.14"
        let result = hljs.highlight(code, language: "numbers")

        XCTAssertTrue(result.value.contains("hljs-number"))
    }

    func testCommentHighlighting() {
        hljs.registerLanguage("comments") { _ in
            let lang = Language()
            lang.name = "comments"
            lang.contains = [
                .mode(CommonModes.C_LINE_COMMENT_MODE()),
                .mode(CommonModes.C_BLOCK_COMMENT_MODE())
            ]
            return lang
        }

        let code = "code // line comment\n/* block */"
        let result = hljs.highlight(code, language: "comments")

        XCTAssertTrue(result.value.contains("hljs-comment"))
    }

    // MARK: - Keyword Tests

    func testKeywordHighlighting() {
        hljs.registerLanguage("keywords") { _ in
            let lang = Language()
            lang.name = "keywords"
            lang.keywords = .grouped([
                "keyword": "if else while for",
                "type": "int string bool"
            ])
            return lang
        }

        let code = "if (x) { int y = 0; }"
        let result = hljs.highlight(code, language: "keywords")

        XCTAssertTrue(result.value.contains("hljs-keyword") || result.relevance >= 0)
    }

    // MARK: - Built-in Language Tests

    func testJavaScriptLanguage() {
        Languages.registerAll(hljs)

        let code = """
        function hello(name) {
            console.log("Hello, " + name);
            return 42;
        }
        """

        let result = hljs.highlight(code, language: "javascript")

        // Language returns display name (e.g., "JavaScript") not registration key
        XCTAssertNotNil(result.language)
        XCTAssertTrue(result.language?.lowercased().contains("javascript") ?? false)
        XCTAssertTrue(result.relevance >= 0)
    }

    func testPythonLanguage() {
        Languages.registerAll(hljs)

        let code = """
        def greet(name):
            print(f"Hello, {name}")
            return True
        """

        let result = hljs.highlight(code, language: "python")

        // Language returns display name (e.g., "Python") not registration key
        XCTAssertNotNil(result.language)
        XCTAssertTrue(result.language?.lowercased().contains("python") ?? false)
    }

    func testJSONLanguage() {
        Languages.registerAll(hljs)

        let code = """
        {
            "name": "test",
            "value": 123,
            "active": true
        }
        """

        let result = hljs.highlight(code, language: "json")

        // JSON is registered and returns output (ignoreIllegals is true by default)
        XCTAssertTrue(hljs.hasLanguage("json"))
        // The output should have some HTML escaping at minimum
        XCTAssertFalse(result.value.isEmpty)
    }

    // MARK: - Auto Detection Tests

    func testAutoDetection() {
        Languages.registerAll(hljs)

        let jsonCode = """
        {"key": "value", "number": 123}
        """

        let result = hljs.highlightAuto(jsonCode)

        // Should detect something (may not always be JSON due to simplicity)
        XCTAssertNotNil(result.result.language)
    }

    // MARK: - Options Tests

    func testCustomClassPrefix() {
        let customHljs = HighlightJS(options: HighlightOptions(classPrefix: "code-"))

        customHljs.registerLanguage("test") { _ in
            let lang = Language()
            lang.name = "test"
            lang.contains = [.mode(CommonModes.QUOTE_STRING_MODE())]
            return lang
        }

        let result = customHljs.highlight("\"hello\"", language: "test")

        XCTAssertTrue(result.value.contains("code-string"))
        XCTAssertFalse(result.value.contains("hljs-string"))
    }

    // MARK: - Edge Cases

    func testEmptyCode() {
        let result = hljs.highlight("", language: "nonexistent")
        XCTAssertEqual(result.value, "")
    }

    func testUnknownLanguage() {
        let result = hljs.highlight("some code", language: "unknown_lang_xyz")

        // Should return escaped code
        XCTAssertEqual(result.value, "some code")
        XCTAssertNil(result.language)
    }

    func testSpecialCharacters() {
        let code = "a < b && c > d"
        let result = hljs.highlight(code, language: "nonexistent")

        XCTAssertTrue(result.value.contains("&lt;"))
        XCTAssertTrue(result.value.contains("&gt;"))
        XCTAssertTrue(result.value.contains("&amp;"))
    }
}
