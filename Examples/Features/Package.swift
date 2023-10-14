// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(name: "Common", targets: ["Common"]),
        .library(name: "Feature", targets: ["Feature"])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", .upToNextMinor(from: "1.2.0")),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", .upToNextMinor(from: "1.0.0")),
        .package(url: "https://github.com/pointfreeco/swift-overture", from: "0.5.0"),
        // .package(path: "../")
    ],
    targets: [
        .target(
            name: "Common",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "Overture", package: "swift-overture"),
            ]
        ),
        .target(
            name: "Feature",
            dependencies: [
                "Common",
            ]
        ),
        .testTarget(
            name: "FeaturesTests",
            dependencies: [
                "Common",
                "Feature"
            ]
        )
    ]
)
