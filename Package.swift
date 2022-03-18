//
//  Package.swift
//  SwiftKORE
//
//  Created by Leif Ashley on 3/18/22.
//

import PackageDescription

let package = Package(name: "SwiftKORE",
                      platforms: [.iOS(v14)],
                      products: [.library(name: "SwiftKORE", target: ["SwiftKORE"])],
                      targets: [.target(name: "SwiftKORE", path: "Source", exclude: ["Info.plist"])],
                      swiftLanguageVersions: [.v5]
)
