// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "PangoCairo",
    products: [ .library(name: "PangoCairo", targets: ["PangoCairo"]) ],
    dependencies: [
        .package(name: "gir2swift", url: "https://github.com/rhx/gir2swift.git", .branch("development")),
        .package(name: "Cairo", url: "https://github.com/rhx/SwiftCairo.git", .branch("development")),
        .package(name: "Pango", url: "https://github.com/rhx/SwiftPango.git", .branch("development"))
    ],
    targets: [
        .target(name: "PangoCairo", dependencies: ["Cairo", "Pango"]),
        .testTarget(name: "PangoCairoTests", dependencies: ["PangoCairo"]),
    ]
)
