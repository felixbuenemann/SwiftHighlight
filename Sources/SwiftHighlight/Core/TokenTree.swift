import Foundation

// MARK: - Token Node

/// A node in the token tree, representing either text or a scoped region
public class TokenNode {
    /// The scope/class name for this node (nil for root or text-only nodes)
    public var scope: String?

    /// Sub-language identifier if this is an embedded language
    public var language: String?

    /// Child nodes and text
    public var children: [TokenChild] = []

    public init(scope: String? = nil) {
        self.scope = scope
    }

    /// Add a child node or text
    public func add(_ child: TokenChild) {
        children.append(child)
    }

    /// Add text content
    public func addText(_ text: String) {
        guard !text.isEmpty else { return }

        // Try to merge with previous text node
        if case .text(let existing) = children.last {
            children[children.count - 1] = .text(existing + text)
        } else {
            children.append(.text(text))
        }
    }

    /// Add a child node
    public func addNode(_ node: TokenNode) {
        children.append(.node(node))
    }
}

/// A child in the token tree - either text or a nested node
public enum TokenChild {
    case text(String)
    case node(TokenNode)
}

// MARK: - Token Tree

/// Manages a tree of tokens with stack-based nesting
public class TokenTree {
    /// The root node of the tree
    public let root: TokenNode

    /// Stack of open nodes (current scope path)
    private var stack: [TokenNode]

    /// Current node we're adding to
    public var currentNode: TokenNode {
        return stack.last ?? root
    }

    public init() {
        self.root = TokenNode()
        self.stack = [root]
    }

    /// Open a new scope node
    public func openNode(_ scope: String) {
        let node = TokenNode(scope: scope)
        currentNode.addNode(node)
        stack.append(node)
    }

    /// Close the current scope node
    public func closeNode() {
        guard stack.count > 1 else { return }
        stack.removeLast()
    }

    /// Add text to the current node
    public func add(_ text: String) {
        currentNode.addText(text)
    }

    /// Get the current scope depth
    public var depth: Int {
        return stack.count - 1
    }
}

// MARK: - Token Tree Emitter

/// Emitter that builds a token tree during parsing
public class TokenTreeEmitter {
    private var tree: TokenTree
    private var classPrefix: String
    private var classNameAliases: [String: String]?

    /// The root node
    public var rootNode: TokenNode {
        return tree.root
    }

    public init(classPrefix: String = "hljs-", classNameAliases: [String: String]? = nil) {
        self.tree = TokenTree()
        self.classPrefix = classPrefix
        self.classNameAliases = classNameAliases
    }

    /// Start a new scope
    public func startScope(_ scope: String) {
        tree.openNode(scope)
    }

    /// End the current scope
    public func endScope() {
        tree.closeNode()
    }

    /// Add text to the current scope
    public func addText(_ text: String) {
        tree.add(text)
    }

    /// Add a sub-language result
    public func addSubLanguage(_ emitter: TokenTreeEmitter, language: String) {
        let node = TokenNode()
        node.language = language
        // Copy children from sub-emitter
        node.children = emitter.rootNode.children
        tree.currentNode.addNode(node)
    }

    /// Process keyword matches in the buffer
    public func processKeywords(_ buffer: String, keywords: CompiledKeywords?, keywordPattern: NSRegularExpression?) -> Double {
        guard let keywords = keywords, let pattern = keywordPattern, !buffer.isEmpty else {
            addText(buffer)
            return 0
        }

        var relevance: Double = 0
        var lastIndex = 0
        let nsBuffer = buffer as NSString

        let matches = pattern.matches(in: buffer, options: [], range: NSRange(location: 0, length: nsBuffer.length))

        for match in matches {
            // Add text before the keyword
            if match.range.location > lastIndex {
                let beforeRange = NSRange(location: lastIndex, length: match.range.location - lastIndex)
                addText(nsBuffer.substring(with: beforeRange))
            }

            let keyword = nsBuffer.substring(with: match.range)
            let lookupKey = keyword.lowercased()

            if let entry = keywords[lookupKey] {
                relevance += entry.relevance
                startScope(entry.scope)
                addText(keyword)
                endScope()
            } else {
                addText(keyword)
            }

            lastIndex = match.range.location + match.range.length
        }

        // Add remaining text
        if lastIndex < nsBuffer.length {
            addText(nsBuffer.substring(from: lastIndex))
        }

        return relevance
    }

    /// Convert the tree to HTML
    public func toHTML() -> String {
        let renderer = HTMLRenderer(classPrefix: classPrefix, classNameAliases: classNameAliases)
        return renderer.render(rootNode)
    }

    /// Get current scope depth
    public var depth: Int {
        return tree.depth
    }

    /// Reset the emitter
    public func reset() {
        tree = TokenTree()
    }
}
