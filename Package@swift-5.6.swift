// swift-tools-version:5.6
//===----------------------------------------------------------*- swift -*-===//
//
// This source file is part of the Swift Argument Parser open source project
//
// Copyright (c) 2020 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import PackageDescription

var package = Package(
    name: "atl-swift-argument-parser",
    products: [
        .library(
            name: "AtlArgumentParser",
            targets: ["AtlArgumentParser"]),
        .plugin(
            name: "GenerateManual",
            targets: ["GenerateManual"]),
    ],
    dependencies: [],
    targets: [
        // Core Library
        .target(
            name: "AtlArgumentParser",
            dependencies: ["AtlArgumentParserToolInfo"],
            exclude: ["CMakeLists.txt"]),
        .target(
            name: "AtlArgumentParserTestHelpers",
            dependencies: ["AtlArgumentParser", "AtlArgumentParserToolInfo"],
            exclude: ["CMakeLists.txt"]),
        .target(
            name: "AtlArgumentParserToolInfo",
            dependencies: [ ],
            exclude: ["CMakeLists.txt"]),

        // Plugins
        .plugin(
            name: "GenerateManual",
            capability: .command(
                intent: .custom(
                    verb: "generate-manual",
                    description: "Generate a manual entry for a specified target.")),
            dependencies: ["generate-manual"]),

        // Examples
        .executableTarget(
            name: "roll",
            dependencies: ["AtlArgumentParser"],
            path: "Examples/roll"),
        .executableTarget(
            name: "math",
            dependencies: ["AtlArgumentParser"],
            path: "Examples/math"),
        .executableTarget(
            name: "repeat",
            dependencies: ["AtlArgumentParser"],
            path: "Examples/repeat"),

        // Tools
        .executableTarget(
            name: "generate-manual",
            dependencies: ["AtlArgumentParser", "AtlArgumentParserToolInfo"],
            path: "Tools/generate-manual"),
    
        // Tests
        .testTarget(
            name: "AtlArgumentParserEndToEndTests",
            dependencies: ["AtlArgumentParser", "AtlArgumentParserTestHelpers"],
            exclude: ["CMakeLists.txt"]),
        .testTarget(
            name: "AtlArgumentParserExampleTests",
            dependencies: ["AtlArgumentParserTestHelpers"],
            resources: [.copy("CountLinesTest.txt")]),
        .testTarget(
            name: "AtlArgumentParserGenerateManualTests",
            dependencies: ["AtlArgumentParserTestHelpers"]),
        .testTarget(
            name: "AtlArgumentParserPackageManagerTests",
            dependencies: ["AtlArgumentParser", "AtlArgumentParserTestHelpers"],
            exclude: ["CMakeLists.txt"]),
        .testTarget(
            name: "AtlArgumentParserUnitTests",
            dependencies: ["AtlArgumentParser", "AtlArgumentParserTestHelpers"],
            exclude: ["CMakeLists.txt"]),
    ]
)

#if os(macOS)
package.targets.append(contentsOf: [
    // Examples
    .executableTarget(
        name: "count-lines",
        dependencies: ["AtlArgumentParser"],
        path: "Examples/count-lines"),

    // Tools
    .executableTarget(
        name: "changelog-authors",
        dependencies: ["AtlArgumentParser"],
        path: "Tools/changelog-authors"),
    ])
#endif
