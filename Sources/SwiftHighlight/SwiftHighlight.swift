// SwiftHighlight - A Swift port of highlight.js
// https://highlightjs.org/

/// Re-export all public API
@_exported import Foundation

// MARK: - Public API

/// The global highlighter instance
public let highlighter = HighlightJS.shared

/// Highlight code with a specific language
/// - Parameters:
///   - code: The source code to highlight
///   - language: The language identifier
///   - ignoreIllegals: Whether to ignore illegal patterns (default: true)
/// - Returns: The highlight result with HTML
public func highlight(_ code: String, language: String, ignoreIllegals: Bool = true) -> HighlightResult {
    return highlighter.highlight(code, language: language, ignoreIllegals: ignoreIllegals)
}

/// Auto-detect language and highlight
/// - Parameters:
///   - code: The source code to highlight
///   - languageSubset: Optional subset of languages to consider
/// - Returns: The auto-detection result
public func highlightAuto(_ code: String, languageSubset: [String]? = nil) -> AutoHighlightResult {
    return highlighter.highlightAuto(code, languageSubset: languageSubset)
}

/// Register a language definition
/// - Parameters:
///   - name: The language identifier
///   - definition: The language definition function
public func registerLanguage(_ name: String, definition: @escaping LanguageDefinition) {
    highlighter.registerLanguage(name, definition: definition)
}

/// Register a language with a Language object
/// - Parameters:
///   - name: The language identifier
///   - language: The Language object
public func registerLanguage(_ name: String, language: Language) {
    highlighter.registerLanguage(name, language: language)
}

/// List all registered languages
public func listLanguages() -> [String] {
    return highlighter.listLanguages()
}

/// Check if a language is registered
public func hasLanguage(_ name: String) -> Bool {
    return highlighter.hasLanguage(name)
}

// MARK: - Version

/// The version of SwiftHighlight
public let version = "1.0.0"

/// The highlight.js version this is based on
public let hljsVersion = "11.10.0"
