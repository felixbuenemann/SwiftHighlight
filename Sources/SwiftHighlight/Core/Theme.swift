import Foundation

#if canImport(AppKit)
import AppKit
public typealias PlatformColor = NSColor
public typealias PlatformFont = NSFont
#elseif canImport(UIKit)
import UIKit
public typealias PlatformColor = UIColor
public typealias PlatformFont = UIFont
#endif

// MARK: - Theme Style

/// Style attributes for a syntax scope
public struct ThemeStyle {
    public var foregroundColor: PlatformColor?
    public var backgroundColor: PlatformColor?
    public var bold: Bool
    public var italic: Bool
    public var underline: Bool

    public init(
        foregroundColor: PlatformColor? = nil,
        backgroundColor: PlatformColor? = nil,
        bold: Bool = false,
        italic: Bool = false,
        underline: Bool = false
    ) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.bold = bold
        self.italic = italic
        self.underline = underline
    }

    /// Create a style with just a foreground color
    public static func color(_ color: PlatformColor) -> ThemeStyle {
        ThemeStyle(foregroundColor: color)
    }

    /// Create a bold style with a foreground color
    public static func bold(_ color: PlatformColor) -> ThemeStyle {
        ThemeStyle(foregroundColor: color, bold: true)
    }

    /// Create an italic style with a foreground color
    public static func italic(_ color: PlatformColor) -> ThemeStyle {
        ThemeStyle(foregroundColor: color, italic: true)
    }
}

// MARK: - Theme

/// A syntax highlighting theme that maps scopes to styles
public struct Theme {
    /// Theme name
    public var name: String

    /// Default text style (for unhighlighted code)
    public var defaultStyle: ThemeStyle

    /// Background color for the code block
    public var backgroundColor: PlatformColor?

    /// Scope-to-style mapping
    public var styles: [String: ThemeStyle]

    public init(
        name: String = "custom",
        defaultStyle: ThemeStyle = ThemeStyle(),
        backgroundColor: PlatformColor? = nil,
        styles: [String: ThemeStyle] = [:]
    ) {
        self.name = name
        self.defaultStyle = defaultStyle
        self.backgroundColor = backgroundColor
        self.styles = styles
    }

    /// Get the style for a scope, falling back through the hierarchy
    /// e.g., "comment.line" falls back to "comment" if not found
    public func style(for scope: String) -> ThemeStyle {
        // Direct match
        if let style = styles[scope] {
            return style
        }

        // Try parent scopes (e.g., "string.special" → "string")
        var parts = scope.split(separator: ".")
        while parts.count > 1 {
            parts.removeLast()
            let parentScope = parts.joined(separator: ".")
            if let style = styles[parentScope] {
                return style
            }
        }

        // Handle space-separated compound scopes (e.g., "title function")
        if scope.contains(" ") {
            let subScopes = scope.split(separator: " ")
            // Try the last scope first (most specific)
            if let last = subScopes.last, let style = styles[String(last)] {
                return style
            }
            // Try the first scope
            if let first = subScopes.first, let style = styles[String(first)] {
                return style
            }
        }

        return defaultStyle
    }
}

// MARK: - Theme Pair (Light/Dark)

/// A pair of themes for light and dark mode
public struct ThemePair {
    public var light: Theme
    public var dark: Theme

    public init(light: Theme, dark: Theme) {
        self.light = light
        self.dark = dark
    }

    /// Get the appropriate theme for the current color scheme
    #if canImport(AppKit)
    public func theme(for appearance: NSAppearance? = nil) -> Theme {
        let app = appearance ?? NSApp?.effectiveAppearance
        if app?.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua {
            return dark
        }
        return light
    }
    #elseif canImport(UIKit)
    public func theme(for userInterfaceStyle: UIUserInterfaceStyle) -> Theme {
        switch userInterfaceStyle {
        case .dark:
            return dark
        default:
            return light
        }
    }
    #endif
}

// MARK: - Built-in Themes

public extension Theme {

    // MARK: GitHub

    /// GitHub light theme
    static var githubLight: Theme {
        Theme(
            name: "github-light",
            defaultStyle: ThemeStyle(foregroundColor: PlatformColor(r: 36, g: 41, b: 46)),
            backgroundColor: PlatformColor(r: 255, g: 255, b: 255),
            styles: [
                "keyword": .bold(PlatformColor(r: 215, g: 58, b: 73)),
                "built_in": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "type": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "literal": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "number": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "operator": .color(PlatformColor(r: 215, g: 58, b: 73)),
                "punctuation": .color(PlatformColor(r: 36, g: 41, b: 46)),
                "property": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "regexp": .color(PlatformColor(r: 34, g: 134, b: 58)),
                "string": .color(PlatformColor(r: 3, g: 47, b: 98)),
                "char": .color(PlatformColor(r: 3, g: 47, b: 98)),
                "subst": .color(PlatformColor(r: 36, g: 41, b: 46)),
                "symbol": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "class": .bold(PlatformColor(r: 111, g: 66, b: 193)),
                "function": .bold(PlatformColor(r: 111, g: 66, b: 193)),
                "title": .bold(PlatformColor(r: 111, g: 66, b: 193)),
                "title.class": .bold(PlatformColor(r: 111, g: 66, b: 193)),
                "title.function": .bold(PlatformColor(r: 111, g: 66, b: 193)),
                "params": .color(PlatformColor(r: 36, g: 41, b: 46)),
                "comment": .italic(PlatformColor(r: 106, g: 115, b: 125)),
                "doctag": .bold(PlatformColor(r: 106, g: 115, b: 125)),
                "meta": .color(PlatformColor(r: 106, g: 115, b: 125)),
                "meta.prompt": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "attr": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "attribute": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "selector-tag": .color(PlatformColor(r: 34, g: 134, b: 58)),
                "selector-id": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "selector-class": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "selector-attr": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "selector-pseudo": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "variable": .color(PlatformColor(r: 227, g: 98, b: 9)),
                "template-variable": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "template-tag": .color(PlatformColor(r: 34, g: 134, b: 58)),
                "name": .color(PlatformColor(r: 34, g: 134, b: 58)),
                "tag": .color(PlatformColor(r: 34, g: 134, b: 58)),
                "deletion": .color(PlatformColor(r: 179, g: 29, b: 40)),
                "addition": .color(PlatformColor(r: 34, g: 134, b: 58)),
                "link": .color(PlatformColor(r: 0, g: 92, b: 197)),
                "emphasis": .italic(PlatformColor(r: 36, g: 41, b: 46)),
                "strong": .bold(PlatformColor(r: 36, g: 41, b: 46)),
            ]
        )
    }

    /// GitHub dark theme
    static var githubDark: Theme {
        Theme(
            name: "github-dark",
            defaultStyle: ThemeStyle(foregroundColor: PlatformColor(r: 201, g: 209, b: 217)),
            backgroundColor: PlatformColor(r: 13, g: 17, b: 23),
            styles: [
                "keyword": .bold(PlatformColor(r: 255, g: 123, b: 114)),
                "built_in": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "type": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "literal": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "number": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "operator": .color(PlatformColor(r: 255, g: 123, b: 114)),
                "punctuation": .color(PlatformColor(r: 201, g: 209, b: 217)),
                "property": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "regexp": .color(PlatformColor(r: 126, g: 231, b: 135)),
                "string": .color(PlatformColor(r: 165, g: 214, b: 255)),
                "char": .color(PlatformColor(r: 165, g: 214, b: 255)),
                "subst": .color(PlatformColor(r: 201, g: 209, b: 217)),
                "symbol": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "class": .bold(PlatformColor(r: 210, g: 168, b: 255)),
                "function": .bold(PlatformColor(r: 210, g: 168, b: 255)),
                "title": .bold(PlatformColor(r: 210, g: 168, b: 255)),
                "title.class": .bold(PlatformColor(r: 210, g: 168, b: 255)),
                "title.function": .bold(PlatformColor(r: 210, g: 168, b: 255)),
                "params": .color(PlatformColor(r: 201, g: 209, b: 217)),
                "comment": .italic(PlatformColor(r: 139, g: 148, b: 158)),
                "doctag": .bold(PlatformColor(r: 139, g: 148, b: 158)),
                "meta": .color(PlatformColor(r: 139, g: 148, b: 158)),
                "meta.prompt": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "attr": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "attribute": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "selector-tag": .color(PlatformColor(r: 126, g: 231, b: 135)),
                "selector-id": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "selector-class": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "selector-attr": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "selector-pseudo": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "variable": .color(PlatformColor(r: 255, g: 166, b: 87)),
                "template-variable": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "template-tag": .color(PlatformColor(r: 126, g: 231, b: 135)),
                "name": .color(PlatformColor(r: 126, g: 231, b: 135)),
                "tag": .color(PlatformColor(r: 126, g: 231, b: 135)),
                "deletion": .color(PlatformColor(r: 255, g: 123, b: 114)),
                "addition": .color(PlatformColor(r: 126, g: 231, b: 135)),
                "link": .color(PlatformColor(r: 121, g: 192, b: 255)),
                "emphasis": .italic(PlatformColor(r: 201, g: 209, b: 217)),
                "strong": .bold(PlatformColor(r: 201, g: 209, b: 217)),
            ]
        )
    }

    // MARK: Xcode

    /// Xcode light theme
    static var xcodeLight: Theme {
        Theme(
            name: "xcode-light",
            defaultStyle: ThemeStyle(foregroundColor: PlatformColor(r: 0, g: 0, b: 0)),
            backgroundColor: PlatformColor(r: 255, g: 255, b: 255),
            styles: [
                "keyword": .bold(PlatformColor(r: 173, g: 61, b: 164)),
                "built_in": .color(PlatformColor(r: 120, g: 73, b: 42)),
                "type": .color(PlatformColor(r: 112, g: 61, b: 170)),
                "literal": .color(PlatformColor(r: 173, g: 61, b: 164)),
                "number": .color(PlatformColor(r: 39, g: 42, b: 216)),
                "string": .color(PlatformColor(r: 196, g: 26, b: 22)),
                "char": .color(PlatformColor(r: 39, g: 42, b: 216)),
                "symbol": .color(PlatformColor(r: 120, g: 73, b: 42)),
                "class": .color(PlatformColor(r: 112, g: 61, b: 170)),
                "function": .color(PlatformColor(r: 50, g: 109, b: 116)),
                "title": .color(PlatformColor(r: 50, g: 109, b: 116)),
                "title.class": .color(PlatformColor(r: 112, g: 61, b: 170)),
                "title.function": .color(PlatformColor(r: 50, g: 109, b: 116)),
                "params": .color(PlatformColor(r: 0, g: 0, b: 0)),
                "comment": .italic(PlatformColor(r: 93, g: 108, b: 121)),
                "doctag": .bold(PlatformColor(r: 93, g: 108, b: 121)),
                "meta": .color(PlatformColor(r: 120, g: 73, b: 42)),
                "attr": .color(PlatformColor(r: 120, g: 73, b: 42)),
                "attribute": .color(PlatformColor(r: 80, g: 129, b: 135)),
                "variable": .color(PlatformColor(r: 50, g: 109, b: 116)),
                "regexp": .color(PlatformColor(r: 196, g: 26, b: 22)),
                "tag": .color(PlatformColor(r: 173, g: 61, b: 164)),
                "name": .color(PlatformColor(r: 173, g: 61, b: 164)),
                "selector-tag": .color(PlatformColor(r: 173, g: 61, b: 164)),
                "selector-id": .color(PlatformColor(r: 80, g: 129, b: 135)),
                "selector-class": .color(PlatformColor(r: 80, g: 129, b: 135)),
            ]
        )
    }

    /// Xcode dark theme
    static var xcodeDark: Theme {
        Theme(
            name: "xcode-dark",
            defaultStyle: ThemeStyle(foregroundColor: PlatformColor(r: 255, g: 255, b: 255)),
            backgroundColor: PlatformColor(r: 41, g: 42, b: 47),
            styles: [
                "keyword": .bold(PlatformColor(r: 252, g: 95, b: 163)),
                "built_in": .color(PlatformColor(r: 253, g: 143, b: 63)),
                "type": .color(PlatformColor(r: 218, g: 186, b: 255)),
                "literal": .color(PlatformColor(r: 252, g: 95, b: 163)),
                "number": .color(PlatformColor(r: 217, g: 201, b: 124)),
                "string": .color(PlatformColor(r: 252, g: 106, b: 93)),
                "char": .color(PlatformColor(r: 217, g: 201, b: 124)),
                "symbol": .color(PlatformColor(r: 253, g: 143, b: 63)),
                "class": .color(PlatformColor(r: 218, g: 186, b: 255)),
                "function": .color(PlatformColor(r: 103, g: 183, b: 164)),
                "title": .color(PlatformColor(r: 103, g: 183, b: 164)),
                "title.class": .color(PlatformColor(r: 218, g: 186, b: 255)),
                "title.function": .color(PlatformColor(r: 103, g: 183, b: 164)),
                "params": .color(PlatformColor(r: 255, g: 255, b: 255)),
                "comment": .italic(PlatformColor(r: 127, g: 140, b: 152)),
                "doctag": .bold(PlatformColor(r: 127, g: 140, b: 152)),
                "meta": .color(PlatformColor(r: 253, g: 143, b: 63)),
                "attr": .color(PlatformColor(r: 253, g: 143, b: 63)),
                "attribute": .color(PlatformColor(r: 103, g: 183, b: 164)),
                "variable": .color(PlatformColor(r: 103, g: 183, b: 164)),
                "regexp": .color(PlatformColor(r: 252, g: 106, b: 93)),
                "tag": .color(PlatformColor(r: 252, g: 95, b: 163)),
                "name": .color(PlatformColor(r: 252, g: 95, b: 163)),
                "selector-tag": .color(PlatformColor(r: 252, g: 95, b: 163)),
                "selector-id": .color(PlatformColor(r: 103, g: 183, b: 164)),
                "selector-class": .color(PlatformColor(r: 103, g: 183, b: 164)),
            ]
        )
    }

    // MARK: VS Code

    /// VS Code light theme
    static var vsLight: Theme {
        Theme(
            name: "vs-light",
            defaultStyle: ThemeStyle(foregroundColor: PlatformColor(r: 0, g: 0, b: 0)),
            backgroundColor: PlatformColor(r: 255, g: 255, b: 255),
            styles: [
                "keyword": .color(PlatformColor(r: 0, g: 0, b: 255)),
                "built_in": .color(PlatformColor(r: 0, g: 128, b: 128)),
                "type": .color(PlatformColor(r: 0, g: 128, b: 128)),
                "literal": .color(PlatformColor(r: 0, g: 0, b: 255)),
                "number": .color(PlatformColor(r: 9, g: 136, b: 90)),
                "string": .color(PlatformColor(r: 163, g: 21, b: 21)),
                "char": .color(PlatformColor(r: 163, g: 21, b: 21)),
                "symbol": .color(PlatformColor(r: 0, g: 128, b: 128)),
                "function": .color(PlatformColor(r: 121, g: 94, b: 38)),
                "title": .color(PlatformColor(r: 121, g: 94, b: 38)),
                "title.class": .color(PlatformColor(r: 0, g: 128, b: 128)),
                "title.function": .color(PlatformColor(r: 121, g: 94, b: 38)),
                "params": .color(PlatformColor(r: 0, g: 0, b: 0)),
                "comment": .italic(PlatformColor(r: 0, g: 128, b: 0)),
                "doctag": .color(PlatformColor(r: 0, g: 128, b: 0)),
                "meta": .color(PlatformColor(r: 0, g: 0, b: 128)),
                "attr": .color(PlatformColor(r: 255, g: 0, b: 0)),
                "attribute": .color(PlatformColor(r: 255, g: 0, b: 0)),
                "variable": .color(PlatformColor(r: 0, g: 0, b: 0)),
                "regexp": .color(PlatformColor(r: 163, g: 21, b: 21)),
                "tag": .color(PlatformColor(r: 128, g: 0, b: 0)),
                "name": .color(PlatformColor(r: 128, g: 0, b: 0)),
                "selector-tag": .color(PlatformColor(r: 128, g: 0, b: 0)),
                "selector-id": .color(PlatformColor(r: 0, g: 0, b: 128)),
                "selector-class": .color(PlatformColor(r: 0, g: 0, b: 128)),
            ]
        )
    }

    /// VS Code dark theme
    static var vsDark: Theme {
        Theme(
            name: "vs-dark",
            defaultStyle: ThemeStyle(foregroundColor: PlatformColor(r: 212, g: 212, b: 212)),
            backgroundColor: PlatformColor(r: 30, g: 30, b: 30),
            styles: [
                "keyword": .color(PlatformColor(r: 86, g: 156, b: 214)),
                "built_in": .color(PlatformColor(r: 78, g: 201, b: 176)),
                "type": .color(PlatformColor(r: 78, g: 201, b: 176)),
                "literal": .color(PlatformColor(r: 86, g: 156, b: 214)),
                "number": .color(PlatformColor(r: 181, g: 206, b: 168)),
                "operator": .color(PlatformColor(r: 212, g: 212, b: 212)),
                "punctuation": .color(PlatformColor(r: 212, g: 212, b: 212)),
                "property": .color(PlatformColor(r: 156, g: 220, b: 254)),
                "regexp": .color(PlatformColor(r: 209, g: 105, b: 105)),
                "string": .color(PlatformColor(r: 206, g: 145, b: 120)),
                "char": .color(PlatformColor(r: 206, g: 145, b: 120)),
                "subst": .color(PlatformColor(r: 212, g: 212, b: 212)),
                "symbol": .color(PlatformColor(r: 78, g: 201, b: 176)),
                "class": .color(PlatformColor(r: 78, g: 201, b: 176)),
                "function": .color(PlatformColor(r: 220, g: 220, b: 170)),
                "title": .color(PlatformColor(r: 220, g: 220, b: 170)),
                "title.class": .color(PlatformColor(r: 78, g: 201, b: 176)),
                "title.function": .color(PlatformColor(r: 220, g: 220, b: 170)),
                "params": .color(PlatformColor(r: 156, g: 220, b: 254)),
                "comment": .italic(PlatformColor(r: 106, g: 153, b: 85)),
                "doctag": .color(PlatformColor(r: 106, g: 153, b: 85)),
                "meta": .color(PlatformColor(r: 86, g: 156, b: 214)),
                "meta.prompt": .color(PlatformColor(r: 156, g: 220, b: 254)),
                "attr": .color(PlatformColor(r: 156, g: 220, b: 254)),
                "attribute": .color(PlatformColor(r: 156, g: 220, b: 254)),
                "selector-tag": .color(PlatformColor(r: 215, g: 186, b: 125)),
                "selector-id": .color(PlatformColor(r: 215, g: 186, b: 125)),
                "selector-class": .color(PlatformColor(r: 215, g: 186, b: 125)),
                "variable": .color(PlatformColor(r: 156, g: 220, b: 254)),
                "template-variable": .color(PlatformColor(r: 78, g: 201, b: 176)),
                "template-tag": .color(PlatformColor(r: 86, g: 156, b: 214)),
                "name": .color(PlatformColor(r: 86, g: 156, b: 214)),
                "tag": .color(PlatformColor(r: 86, g: 156, b: 214)),
                "deletion": .color(PlatformColor(r: 206, g: 145, b: 120)),
                "addition": .color(PlatformColor(r: 181, g: 206, b: 168)),
                "link": .color(PlatformColor(r: 206, g: 145, b: 120)),
                "emphasis": .italic(PlatformColor(r: 212, g: 212, b: 212)),
                "strong": .bold(PlatformColor(r: 212, g: 212, b: 212)),
            ]
        )
    }
}

// MARK: - Theme Pairs

public extension ThemePair {
    /// GitHub theme pair (light/dark)
    static var github: ThemePair {
        ThemePair(light: .githubLight, dark: .githubDark)
    }

    /// Xcode theme pair (light/dark)
    static var xcode: ThemePair {
        ThemePair(light: .xcodeLight, dark: .xcodeDark)
    }

    /// VS Code theme pair (light/dark)
    static var vs: ThemePair {
        ThemePair(light: .vsLight, dark: .vsDark)
    }
}

// MARK: - Color Helpers

extension PlatformColor {
    /// Create a color from RGB values (0-255)
    convenience init(r: Int, g: Int, b: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(r) / 255.0,
            green: CGFloat(g) / 255.0,
            blue: CGFloat(b) / 255.0,
            alpha: a
        )
    }

    /// Convert to hex string for CSS
    var hexString: String {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        #if canImport(AppKit)
        if let rgbColor = usingColorSpace(.sRGB) {
            r = rgbColor.redComponent
            g = rgbColor.greenComponent
            b = rgbColor.blueComponent
        }
        #else
        getRed(&r, green: &g, blue: &b, alpha: &a)
        #endif
        return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }
}
