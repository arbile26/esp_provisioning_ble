// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "esp_provisioning_ble",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "esp-provisioning-ble", targets: ["esp_provisioning_ble"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        // Swift Package Manager does not allow Swift and Objective-C in one
        // target, so the Objective-C AES wrapper lives in a target of its own.
        .target(
            name: "esp_provisioning_ble_objc",
            publicHeadersPath: "include"
        ),
        .target(
            name: "esp_provisioning_ble",
            dependencies: [
                "esp_provisioning_ble_objc",
                .product(name: "FlutterFramework", package: "FlutterFramework"),
            ]
        ),
    ]
)
