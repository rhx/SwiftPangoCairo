// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "PangoCairo",
    products: [ .library(name: "PangoCairo", targets: ["PangoCairo"]) ],
    dependencies: [
        .package(name: "Cairo", url: "https://github.com/rhx/SwiftCairo.git", .branch("master")),
        .package(name: "Pango", url: "https://github.com/rhx/SwiftPango.git", .branch("master"))
    ],
    targets: [
        .target(name: "PangoCairo", dependencies: ["Cairo", "Pango"]),
        .testTarget(name: "PangoCairoTests", dependencies: ["PangoCairo"]),
    ]
)
