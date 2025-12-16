import Foundation

#if canImport(AppKit)
import AppKit
#elseif canImport(UIKit)
import UIKit
#endif

// MARK: - Attributed String Renderer

/// Converts a token tree to NSAttributedString/AttributedString
public class AttributedStringRenderer {
    private let theme: Theme
    private let font: PlatformFont

    public init(theme: Theme, font: PlatformFont? = nil) {
        self.theme = theme
        #if canImport(AppKit)
        self.font = font ?? NSFont.monospacedSystemFont(ofSize: NSFont.systemFontSize, weight: .regular)
        #else
        self.font = font ?? UIFont.monospacedSystemFont(ofSize: UIFont.systemFontSize, weight: .regular)
        #endif
    }

    /// Render the token tree to NSAttributedString
    public func render(_ node: TokenNode) -> NSAttributedString {
        let result = NSMutableAttributedString()
        renderNode(node, to: result, inheritedStyle: theme.defaultStyle)
        return result
    }

    private func renderNode(_ node: TokenNode, to result: NSMutableAttributedString, inheritedStyle: ThemeStyle) {
        // Determine the style for this node
        let style: ThemeStyle
        if let scope = node.scope, !scope.isEmpty {
            style = theme.style(for: scope)
        } else {
            style = inheritedStyle
        }

        // Render children with this style
        renderChildren(node.children, to: result, style: style)
    }

    private func renderChildren(_ children: [TokenChild], to result: NSMutableAttributedString, style: ThemeStyle) {
        for child in children {
            switch child {
            case .text(let text):
                let attributes = buildAttributes(for: style)
                result.append(NSAttributedString(string: text, attributes: attributes))
            case .node(let node):
                renderNode(node, to: result, inheritedStyle: style)
            }
        }
    }

    private func buildAttributes(for style: ThemeStyle) -> [NSAttributedString.Key: Any] {
        var attributes: [NSAttributedString.Key: Any] = [:]

        // Font with bold/italic
        var fontToUse = font
        if style.bold || style.italic {
            #if canImport(AppKit)
            var traits: NSFontDescriptor.SymbolicTraits = []
            if style.bold { traits.insert(.bold) }
            if style.italic { traits.insert(.italic) }
            let descriptor = font.fontDescriptor.withSymbolicTraits(traits)
            fontToUse = NSFont(descriptor: descriptor, size: font.pointSize) ?? font
            #else
            var traits: UIFontDescriptor.SymbolicTraits = []
            if style.bold { traits.insert(.traitBold) }
            if style.italic { traits.insert(.traitItalic) }
            if let descriptor = font.fontDescriptor.withSymbolicTraits(traits) {
                fontToUse = UIFont(descriptor: descriptor, size: font.pointSize)
            }
            #endif
        }
        attributes[.font] = fontToUse

        // Foreground color
        if let color = style.foregroundColor {
            attributes[.foregroundColor] = color
        } else if let defaultColor = theme.defaultStyle.foregroundColor {
            attributes[.foregroundColor] = defaultColor
        }

        // Background color
        if let bgColor = style.backgroundColor {
            attributes[.backgroundColor] = bgColor
        }

        // Underline
        if style.underline {
            attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        }

        return attributes
    }

    // MARK: - Swift 5.5+ AttributedString support

    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    public func renderAttributedString(_ node: TokenNode) -> AttributedString {
        return AttributedString(render(node))
    }
}

// MARK: - HighlightJS Extensions

public extension HighlightJS {

    /// Highlight code and return an NSAttributedString
    func highlightAttributed(
        _ code: String,
        language: String,
        theme: Theme,
        font: PlatformFont? = nil
    ) -> NSAttributedString {
        let result = highlight(code, language: language, ignoreIllegals: true)

        // Get the token tree from the result
        guard let tokenTree = result.tokenTree else {
            // Fallback: return plain text with default style
            let renderer = AttributedStringRenderer(theme: theme, font: font)
            let plainNode = TokenNode()
            plainNode.children = [.text(code)]
            return renderer.render(plainNode)
        }

        let renderer = AttributedStringRenderer(theme: theme, font: font)
        return renderer.render(tokenTree)
    }

    /// Highlight code with auto-detection and return an NSAttributedString
    func highlightAutoAttributed(
        _ code: String,
        theme: Theme,
        font: PlatformFont? = nil,
        languageSubset: [String]? = nil
    ) -> (attributedString: NSAttributedString, language: String?) {
        let result = highlightAuto(code, languageSubset: languageSubset)

        guard let tokenTree = result.tokenTree else {
            let renderer = AttributedStringRenderer(theme: theme, font: font)
            let plainNode = TokenNode()
            plainNode.children = [.text(code)]
            return (renderer.render(plainNode), result.language)
        }

        let renderer = AttributedStringRenderer(theme: theme, font: font)
        return (renderer.render(tokenTree), result.language)
    }

    // MARK: - Swift 5.5+ AttributedString support

    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    func highlightAttributedString(
        _ code: String,
        language: String,
        theme: Theme,
        font: PlatformFont? = nil
    ) -> AttributedString {
        return AttributedString(highlightAttributed(code, language: language, theme: theme, font: font))
    }

    @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
    func highlightAutoAttributedString(
        _ code: String,
        theme: Theme,
        font: PlatformFont? = nil,
        languageSubset: [String]? = nil
    ) -> (attributedString: AttributedString, language: String?) {
        let result = highlightAutoAttributed(code, theme: theme, font: font, languageSubset: languageSubset)
        return (AttributedString(result.attributedString), result.language)
    }
}
