// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-cairo",
    products: [
        .library(
            name: "Cairo",
            targets: ["Cairo"]),
        .library(
            name: "SCCCairo",
            targets: ["SCCCairo"]
        )
    ],
    targets: [
        .target(
            name: "Cairo",
            dependencies: [
                "SCCCairo",
                "SCCFontConfig",
                "SCCFreeType"
            ]
        ),
        .testTarget(
            name: "CairoTests",
            dependencies: [
                "Cairo"
            ]
        ),
        .systemLibrary(
            name: "SCCCairo",
            pkgConfig: "cairo",
            providers: [
                .brew(["cairo"]),
                .apt(["libcairo2-dev"])
            ]),
        .systemLibrary(
            name: "SCCFontConfig",
            pkgConfig: "fontconfig",
            providers: [
                .brew(["fontconfig"]),
                .apt(["libfontconfig-dev"])
            ]),
        .systemLibrary(
            name: "SCCFreeType",
            pkgConfig: "freetype2",
            providers: [
                .brew(["freetype2"]),
                .apt(["libfreetype6-dev"])
            ])
    ],
    swiftLanguageVersions: [.v5]
)
