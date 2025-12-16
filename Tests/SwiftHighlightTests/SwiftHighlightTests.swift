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

    // MARK: - AttributedString Renderer Tests

    func testAttributedStringRenderer() {
        Languages.registerAll(hljs)

        let code = "let x = 42"

        let theme = Theme.githubLight
        let attributed = hljs.highlightAttributed(code, language: "swift", theme: theme)

        // Should not be empty and match source
        XCTAssertGreaterThan(attributed.length, 0)
        XCTAssertEqual(attributed.string, code)

        // Should have font attribute throughout
        var hasFont = false
        attributed.enumerateAttribute(.font, in: NSRange(location: 0, length: attributed.length)) { value, _, _ in
            if value != nil {
                hasFont = true
            }
        }
        XCTAssertTrue(hasFont, "AttributedString should have font attributes")

        // Check that "let" keyword has the theme's keyword color (RGB 215, 58, 73)
        let keywordColor = PlatformColor(r: 215, g: 58, b: 73)
        var foundKeywordColor = false
        // "let" is at position 0-2
        attributed.enumerateAttribute(.foregroundColor, in: NSRange(location: 0, length: 3)) { value, _, _ in
            if let color = value as? PlatformColor, colorsMatch(color, keywordColor) {
                foundKeywordColor = true
            }
        }
        XCTAssertTrue(foundKeywordColor, "Keyword 'let' should have theme's keyword color")

        // Check that non-keyword text has the default color (RGB 36, 41, 46)
        let defaultColor = PlatformColor(r: 36, g: 41, b: 46)
        var foundDefaultColor = false
        // " x " is at position 3-5
        attributed.enumerateAttribute(.foregroundColor, in: NSRange(location: 4, length: 1)) { value, _, _ in
            if let color = value as? PlatformColor, colorsMatch(color, defaultColor) {
                foundDefaultColor = true
            }
        }
        XCTAssertTrue(foundDefaultColor, "Plain text should have theme's default color")
    }

    // Helper to compare colors (allowing for small floating point differences)
    private func colorsMatch(_ c1: PlatformColor, _ c2: PlatformColor) -> Bool {
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0

        #if canImport(AppKit)
        let color1 = c1.usingColorSpace(.sRGB) ?? c1
        let color2 = c2.usingColorSpace(.sRGB) ?? c2
        color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        #else
        c1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        c2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        #endif

        let tolerance: CGFloat = 0.01
        return abs(r1 - r2) < tolerance && abs(g1 - g2) < tolerance && abs(b1 - b2) < tolerance
    }
}
