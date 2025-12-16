import Foundation

// MARK: - HTML Renderer

/// Converts a token tree to HTML output
public class HTMLRenderer {
    private let classPrefix: String
    private let classNameAliases: [String: String]?

    public init(classPrefix: String = "hljs-", classNameAliases: [String: String]? = nil) {
        self.classPrefix = classPrefix
        self.classNameAliases = classNameAliases
    }

    /// Render the token tree to HTML
    public func render(_ node: TokenNode) -> String {
        var output = ""
        renderNode(node, to: &output)
        return output
    }

    private func renderNode(_ node: TokenNode, to output: inout String) {
        // Handle language nodes (sub-languages)
        if let language = node.language {
            output += "<span class=\"language-\(escapeAttribute(language))\">"
            renderChildren(node.children, to: &output)
            output += "</span>"
            return
        }

        // Handle scoped nodes
        if let scope = node.scope, !scope.isEmpty {
            let cssClass = scopeToCSSClass(scope)
            output += "<span class=\"\(escapeAttribute(cssClass))\">"
            renderChildren(node.children, to: &output)
            output += "</span>"
            return
        }

        // Root or unscoped node - just render children
        renderChildren(node.children, to: &output)
    }

    private func renderChildren(_ children: [TokenChild], to output: inout String) {
        for child in children {
            switch child {
            case .text(let text):
                output += escapeHTML(text)
            case .node(let node):
                renderNode(node, to: &output)
            }
        }
    }

    /// Convert a scope name to CSS class(es)
    /// Handles tiered scopes like "comment.line" → "hljs-comment hljs-line_"
    /// And sub-scopes like "meta keyword" → "hljs-meta hljs-keyword"
    public func scopeToCSSClass(_ scope: String) -> String {
        // Apply any class name aliases
        let resolvedScope: String
        if let alias = classNameAliases?[scope] {
            resolvedScope = alias
        } else {
            resolvedScope = scope
        }

        // Handle space-separated scopes (e.g., "meta keyword")
        if resolvedScope.contains(" ") {
            return resolvedScope
                .split(separator: " ")
                .map { classPrefix + String($0).replacingOccurrences(of: ".", with: "_") }
                .joined(separator: " ")
        }

        // Handle dot-tiered scopes (e.g., "comment.line")
        if resolvedScope.contains(".") {
            let parts = resolvedScope.split(separator: ".")
            var classes: [String] = []

            // First part gets normal prefix
            if let first = parts.first {
                classes.append(classPrefix + String(first))
            }

            // Subsequent parts get underscore suffix treatment
            for i in 1..<parts.count {
                classes.append(classPrefix + String(parts[i]) + "_")
            }

            return classes.joined(separator: " ")
        }

        // Simple scope
        return classPrefix + resolvedScope
    }

    /// Escape HTML special characters
    public func escapeHTML(_ text: String) -> String {
        var result = ""
        result.reserveCapacity(text.count)

        for char in text {
            switch char {
            case "&":
                result += "&amp;"
            case "<":
                result += "&lt;"
            case ">":
                result += "&gt;"
            case "\"":
                result += "&quot;"
            case "'":
                result += "&#x27;"
            default:
                result.append(char)
            }
        }

        return result
    }

    /// Escape for use in HTML attributes
    private func escapeAttribute(_ text: String) -> String {
        return escapeHTML(text)
    }
}

// MARK: - Public HTML Escaping

/// Public utility function for HTML escaping
public func escapeHTML(_ value: String) -> String {
    let renderer = HTMLRenderer()
    return renderer.escapeHTML(value)
}
