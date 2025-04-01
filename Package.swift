// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "IndexStore",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "IndexStore",
            targets: ["IndexStore"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/indexstore-db.git", branch: "main"),
        .package(url: "https://github.com/apple/swift-tools-support-core.git", exact: "0.7.1"),
    ],
    targets: [
        .target(
            name: "IndexStore",
            dependencies: [
                .product(name: "SwiftToolsSupport-auto", package: "swift-tools-support-core"),
                .product(name: "IndexStoreDB", package: "indexstore-db"),
            ],
            resources: [
                .copy("Resources/PrivacyInfo.xcprivacy")
            ],
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        ),
        .testTarget(
            name: "IndexStoreTests",
            dependencies: [
                "IndexStore",
            ],
            resources: [
                .copy("Configurations"),
            ]
        ),
    ]
)
