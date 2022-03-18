// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "SwiftKORE",
    products: [
        .library(
        name: "SwiftKORE",
        targets: ["SwiftKORE"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "SwiftKORE",
                    path: "Source",
                    exclude: ["Info.plist"]),
        .testTarget(
            name: "SwiftKORETests",
            dependencies: ["SwiftKORE"],
            path: "Tests")
    ],
    swiftLanguageVersions: [.v5]
)
