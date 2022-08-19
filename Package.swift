// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "FeatherIDCoding",
    products: [
        .library(name: "FeatherIDCoding", targets: ["FeatherIDCoding"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "FeatherIDCoding"),
        .testTarget(name: "FeatherIDCodingTests", dependencies: ["FeatherIDCoding"]),
    ]
)
