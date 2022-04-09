// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "PangoCairo",
    products: [ .library(name: "PangoCairo", targets: ["PangoCairo"]) ],
    dependencies: [
        .package(url: "https://github.com/rhx/gir2swift.git",  branch: "development"),
        .package(url: "https://github.com/rhx/SwiftCairo.git", branch: "development"),
        .package(url: "https://github.com/rhx/SwiftPango.git", branch: "development")
    ],
    targets: [
        .systemLibrary(
            name: "CPangoCairo",
            pkgConfig: "pangocairo",
            providers: [
                .brew(["pango", "glib", "glib-networking", "gobject-introspection"]),
                .apt(["libpango1.0-dev", "libglib2.0-dev", "glib-networking", "gobject-introspection", "libgirepository1.0-dev"])
            ]),
        .target(
            name: "PangoCairo",
            dependencies: [
                "CPangoCairo",
                .product(name: "gir2swift", package: "gir2swift"),
                .product(name: "Cairo", package: "SwiftCairo"),
                .product(name: "Pango", package: "SwiftPango"),
            ],
            swiftSettings: [.unsafeFlags(["-Xfrontend", "-serialize-debugging-options"], .when(configuration: .debug))],
            plugins: [
                .plugin(name: "gir2swift-plugin", package: "gir2swift")
            ]),
        .testTarget(name: "PangoCairoTests", dependencies: ["PangoCairo"]),
    ]
)
