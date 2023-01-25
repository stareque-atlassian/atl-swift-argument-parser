// swift-tools-version:5.5
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
            dependencies: [],
            exclude: ["CMakeLists.txt"]),

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

        // Tests
        .testTarget(
            name: "AtlArgumentParserEndToEndTests",
            dependencies: ["AtlArgumentParser", "AtlArgumentParserTestHelpers"],
            exclude: ["CMakeLists.txt"]),
        .testTarget(
            name: "AtlArgumentParserUnitTests",
            dependencies: ["AtlArgumentParser", "AtlArgumentParserTestHelpers"],
            exclude: ["CMakeLists.txt"]),
        .testTarget(
            name: "AtlArgumentParserPackageManagerTests",
            dependencies: ["AtlArgumentParser", "AtlArgumentParserTestHelpers"],
            exclude: ["CMakeLists.txt"]),
        .testTarget(
            name: "AtlArgumentParserExampleTests",
            dependencies: ["AtlArgumentParserTestHelpers"],
            resources: [.copy("CountLinesTest.txt")]),
    ]
)
