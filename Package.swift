// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MCUIViewLayout",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12)
    ],
    products: [
        .library(
            name: "MCUIViewLayout",
            targets: ["MCUIViewLayout"]
        )
    ],
    targets: [
        .target(
            name: "MCUIViewLayoutObjC",
            path: "Sources/MCUIViewLayoutObjC",
            publicHeadersPath: "include"
        ),
        .target(
            name: "MCUIViewLayout",
            dependencies: ["MCUIViewLayoutObjC"],
            path: "Sources/MCUIViewLayout"
        )
    ]
)
