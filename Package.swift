// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "swiftui-button-style-backport",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .visionOS(.v1),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "DefaultButtonStyleBackport",
            targets: ["DefaultButtonStyleBackport"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/inekipelov/swift-backport-pattern.git", from: "0.1.2"),
    ],
    targets: [
        .target(
            name: "DefaultButtonStyleBackport",
            dependencies: [
                .product(name: "Backport", package: "swift-backport-pattern"),
            ],
            path: "Sources/DefaultButtonStyleBackport"
        ),
        .testTarget(
            name: "DefaultButtonStyleBackportTests",
            dependencies: ["DefaultButtonStyleBackport"],
            path: "Tests/DefaultButtonStyleBackportTests"
        ),
    ]
)
