// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "SwiftKORE",
    platforms: [.iOS(.v13)
    ],
    products: [
        .library(
        name: "SwiftKORE",
        targets: ["SwiftKORE"])
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "SwiftKORE",
            dependencies: ["SwiftyBeaver"],
            path: "Source",
            exclude: ["Info.plist"]),
        .testTarget(
            name: "SwiftKORETests",
            dependencies: ["SwiftKORE"],
            path: "Tests")
    ],
    swiftLanguageVersions: [.v5]
)
