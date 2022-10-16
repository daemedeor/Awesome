// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Awesome",
    platforms: [.iOS(.v13), .macOS(.v10_15), .watchOS(.v2), .tvOS(.v9)],
    products: [
        .library(
            name: "Awesome",
            targets: ["Awesome"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Awesome",
            dependencies: [],
            path: "Classes",
            resources: [
                .process("Assets"),
            ]
        )
    ]
)
