// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "TestApp",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(path: ".."),
    ],
    targets: [
        .executableTarget(
            name: "TestApp",
            dependencies: [
                .product(name: "SwiftHighlight", package: "SwiftHighlight"),
            ],
            path: "Sources"
        ),
    ]
)
