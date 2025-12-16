// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftHighlight",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "SwiftHighlight",
            targets: ["SwiftHighlight"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftHighlight",
            dependencies: [],
            path: "Sources/SwiftHighlight"
        ),
        .testTarget(
            name: "SwiftHighlightTests",
            dependencies: ["SwiftHighlight"],
            path: "Tests/SwiftHighlightTests"
        ),
    ]
)
