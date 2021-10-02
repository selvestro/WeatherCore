// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "WeatherCore",
    products: [
        .library(name: "WeatherCore", targets: ["WeatherCore"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "WeatherCore", dependencies: []),
        .testTarget(name: "WeatherCoreTests", dependencies: ["WeatherCore"]),
    ]
)
