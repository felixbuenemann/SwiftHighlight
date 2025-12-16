# SwiftHighlight

A Swift port of [highlight.js](https://highlightjs.org/) for syntax highlighting in Swift applications.

## Features

- **192 languages** supported out of the box
- Pure Swift implementation with no dependencies
- Cross-platform: macOS, iOS, tvOS, watchOS
- Auto-detection of language
- HTML and NSAttributedString output
- Built-in themes with light/dark mode support
- Compatible with highlight.js CSS themes

## Installation

### Swift Package Manager

Add SwiftHighlight to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/user/SwiftHighlight.git", from: "1.0.0")
]
```

Or add it in Xcode via File → Add Package Dependencies.

## Usage

### Basic Highlighting

```swift
import SwiftHighlight

let hljs = HighlightJS()
Languages.registerAll(hljs)

// Highlight with explicit language
let result = try hljs.highlight("let x = 42", language: "swift")
print(result.value)
// <span class="hljs-keyword">let</span> x = <span class="hljs-number">42</span>

// Auto-detect language
let auto = hljs.highlightAuto("function hello() { return 'world'; }")
print(auto.language) // "javascript"
print(auto.value)
```

### Register Specific Languages

For smaller bundle size, register only the languages you need:

```swift
let hljs = HighlightJS()
hljs.registerLanguage("swift", definition: swiftLanguage)
hljs.registerLanguage("python", definition: pythonLanguage)
hljs.registerLanguage("javascript", definition: javascriptLanguage)
```

### Custom Class Prefix

```swift
let hljs = HighlightJS()
hljs.configure(options: HighlightOptions(classPrefix: "code-"))
```

### HTML Output

```swift
let hljs = HighlightJS()
Languages.registerAll(hljs)

let result = hljs.highlight("let x = 42", language: "swift", ignoreIllegals: true)
print(result.value)
// <span class="hljs-keyword">let</span> x = <span class="hljs-number">42</span>
```

### AttributedString Output

```swift
let hljs = HighlightJS()
Languages.registerAll(hljs)

// Use a built-in theme (supports light/dark mode)
let theme = ThemePair.github.theme(for: appearance)

let attributed = hljs.highlightAttributed(
    "let x = 42",
    language: "swift",
    theme: theme
)
// Returns NSAttributedString ready for display
```

### SwiftUI Integration

```swift
import SwiftUI
import SwiftHighlight

struct CodeView: View {
    let code: String
    let language: String
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        let hljs = HighlightJS()
        Languages.registerAll(hljs)

        let theme = colorScheme == .dark ? Theme.githubDark : Theme.githubLight
        let attributed = hljs.highlightAttributed(code, language: language, theme: theme)

        Text(AttributedString(attributed))
            .textSelection(.enabled)
    }
}
```

## Supported Languages

SwiftHighlight supports 192 languages including:

- **Popular**: JavaScript, TypeScript, Python, Ruby, Java, C, C++, C#, Go, Rust, Swift, Kotlin, PHP
- **Web**: HTML, CSS, SCSS, Less, JSON, XML, Markdown
- **Shell**: Bash, PowerShell, Shell
- **Data**: SQL, YAML, TOML/INI
- **And many more**: See `Languages.all` for the complete list

## Themes

### Built-in Themes

SwiftHighlight includes themes with light/dark mode support:

- `ThemePair.github` - GitHub style
- `ThemePair.xcode` - Xcode style
- `ThemePair.vs` - Visual Studio style

### CSS Themes (HTML output)

HTML output uses CSS classes compatible with highlight.js themes. You can use any [highlight.js theme](https://highlightjs.org/demo) by including the CSS.

Example classes:
- `.hljs-keyword` - language keywords
- `.hljs-string` - string literals
- `.hljs-number` - numeric literals
- `.hljs-comment` - comments
- `.hljs-function` - function names

## Credits

This is a Swift port of [highlight.js](https://github.com/highlightjs/highlight.js) by Ivan Sagalaev and contributors. The language definitions were converted from the original JavaScript implementations.

## License

MIT License - see [LICENSE](LICENSE) for details.
