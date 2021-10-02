// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "WeatherCore",
    defaultLocalization: "ru",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "WeatherCore", targets: ["WeatherCore"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "WeatherCore", dependencies: []),
        .testTarget(name: "WeatherCoreTests", dependencies: ["WeatherCore"]),
    ]
)
