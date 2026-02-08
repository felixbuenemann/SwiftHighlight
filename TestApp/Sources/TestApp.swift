import SwiftUI
import SwiftHighlight
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    var fileFromArgs: URL?

    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.setActivationPolicy(.regular)
        NSApp.activate(ignoringOtherApps: true)

        // SwiftUI's WindowGroup won't create a window when NSApplication
        // intercepts file path arguments. Fall back to creating one manually.
        DispatchQueue.main.async { [self] in
            if NSApp.windows.isEmpty || NSApp.windows.allSatisfy({ !$0.isVisible }) {
                let view = ContentView(initialURL: fileFromArgs)
                let window = NSWindow(
                    contentRect: NSRect(x: 0, y: 0, width: 900, height: 700),
                    styleMask: [.titled, .closable, .resizable, .miniaturizable],
                    backing: .buffered,
                    defer: false
                )
                window.title = "TestApp"
                window.contentView = NSHostingView(rootView: view)
                window.center()
                window.makeKeyAndOrderFront(nil)
            }
        }
    }

    func application(_ sender: NSApplication, openFiles filenames: [String]) {
        if let path = filenames.first {
            fileFromArgs = URL(fileURLWithPath: path)
        }
        sender.reply(toOpenOrPrint: .success)
    }
}

@main
struct TestApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView(initialURL: nil)
        }
    }
}

struct ContentView: View {
    let initialURL: URL?
    @State private var code: AttributedString = AttributedString("Open a file to highlight...")
    @State private var fileName: String = "No file selected"
    @State private var detectedLanguage: String = "–"
    @State private var showFileImporter = false
    @Environment(\.colorScheme) private var colorScheme

    private let hljs: HighlightJS = {
        let h = HighlightJS()
        Languages.registerAll(h)
        return h
    }()

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            toolbar
            Divider()
            codeView
        }
        .frame(minWidth: 600, minHeight: 400)
        .fileImporter(
            isPresented: $showFileImporter,
            allowedContentTypes: [.item],
            allowsMultipleSelection: false
        ) { result in
            handleFile(result)
        }
        .task {
            if let url = initialURL {
                loadFile(at: url)
            }
        }
    }

    private var toolbar: some View {
        HStack {
            Button("Open File...") { showFileImporter = true }
                .keyboardShortcut("o")
            Spacer()
            Text(fileName).foregroundStyle(.secondary)
            Text("Language: \(detectedLanguage)")
                .foregroundStyle(.secondary)
                .padding(.leading, 8)
        }
        .padding(8)
    }

    private var codeView: some View {
        ScrollView([.horizontal, .vertical]) {
            Text(code)
                .textSelection(.enabled)
                .font(.system(.body, design: .monospaced))
                .padding(12)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .background(colorScheme == .dark ? Color.black : Color.white)
    }

    private func handleFile(_ result: Result<[URL], Error>) {
        guard case .success(let urls) = result, let url = urls.first else { return }
        guard url.startAccessingSecurityScopedResource() else { return }
        defer { url.stopAccessingSecurityScopedResource() }
        loadFile(at: url)
    }

    private func loadFile(at url: URL) {
        guard let data = try? Data(contentsOf: url),
              let source = String(data: data, encoding: .utf8) else {
            code = AttributedString("Failed to read file.")
            return
        }

        fileName = url.lastPathComponent
        let ext = url.pathExtension.lowercased()
        let theme = colorScheme == .dark ? Theme.githubDark : Theme.githubLight

        if !ext.isEmpty, let lang = hljs.getLanguage(ext) {
            let attr = hljs.highlightAttributedString(source, language: ext, theme: theme)
            detectedLanguage = lang.name ?? ext
            code = attr
        } else {
            let (attr, lang) = hljs.highlightAutoAttributedString(source, theme: theme)
            detectedLanguage = lang ?? "auto"
            code = attr
        }
    }
}
