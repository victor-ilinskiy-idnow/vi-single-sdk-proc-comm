// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IDnowPlatform",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ModuleCore",
            targets: ["ModuleCore"]),
        .library(
            name: "ModuleA",
            targets: ["ModuleA"]),
        .library(
            name: "ModuleB",
            targets: ["ModuleB"]),
        .library(
            name: "CommunicationModule",
            targets: ["CommunicationModule"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
                    name: "ModuleCore",
                    path: "Frameworks/ModuleCore.xcframework"
                ),
        .binaryTarget(
                    name: "ModuleA",
                    path: "Frameworks/ModuleA.xcframework"
                ),
        .binaryTarget(
                    name: "ModuleB",
                    path: "Frameworks/ModuleB.xcframework"
                ),
        .binaryTarget(
                    name: "CommunicationModule",
                    path: "Frameworks/CommunicationModule.xcframework"
                ),
    ]
)
