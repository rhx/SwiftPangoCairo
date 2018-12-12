// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "PangoCairo",
    products: [
        .library(name: "PangoCairo", targets: ["PangoCairo"]),
    ],
    dependencies: [
        .package(url: "https://github.com/rhx/SwiftCairo.git", .branch("master")),
        .package(url: "https://github.com/rhx/SwiftPango.git", .branch("master"))
    ],
    targets: [
        .target(name: "PangoCairo", dependencies: ["Cairo", "Pango"]),
        .testTarget(name: "PangoCairoTests", dependencies: ["PangoCairo"]),
    ]
)
