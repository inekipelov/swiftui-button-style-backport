// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "swiftui-button-style-backport",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "ButtonStyleBackport",
            targets: ["ButtonStyleBackport"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/inekipelov/swift-backport-pattern.git", from: "0.2.0"),
        .package(url: "https://github.com/inekipelov/swiftui-glass-type-backport.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "ButtonStyleBackport",
            dependencies: [
                .product(name: "Backport", package: "swift-backport-pattern"),
                .product(name: "GlassBackport", package: "swiftui-glass-type-backport"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "ButtonStyleBackportTests",
            dependencies: ["ButtonStyleBackport"],
            path: "Tests"
        ),
    ]
)
