// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "tree-sitter-xcframework",
    platforms: [.macOS(.v10_13), .iOS(.v11)],
    products: [
        .library(
            name: "TreeSitterParsers",
            targets: ["TreeSitterParsers", "TreeSitterParserResources"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "TreeSitterParsers",
            path: "TreeSitterParsers.xcframework.zip"
        ),
        .target(
            name: "TreeSitterParserResources",
            dependencies: ["TreeSitterParsers"],
            resources: [
                .copy("ParserResources")
            ],
            linkerSettings: [.linkedLibrary("c++")]
        ),
    ]
)
