// swift-tools-version: 6.0
import PackageDescription
let package = Package(name: "pikd-ios-sdk-distribution", platforms: [.iOS(.v18), .macOS(.v14)],
    products: [
        .library(name: "PikdIOSCore", targets: ["PikdIOSCoreDistribution"]),
        .library(name: "PikdIOSAR", targets: ["PikdIOSARDistribution"]),
        .library(name: "PikdIOSUI", targets: ["PikdIOSUIDistribution"]),
        .library(name: "PikdIOSExperience", targets: ["PikdIOSExperienceDistribution"]),
        .library(name: "PikdIOSPartnerExperience", targets: ["PikdIOSPartnerExperienceDistribution"]),
    ],
    dependencies: [
        .package(url: "https://github.com/googlemaps/ios-maps-sdk", exact: "11.2.0"),
        .package(url: "https://github.com/airbnb/lottie-spm.git", exact: "4.6.1")
    ],
    targets: [
        .binaryTarget(name: "PikdIOSCore", url: "https://storage.googleapis.com/pikd-staging-storage-pikd-staging/sdk/ios/0.8.0-beta.15/PikdIOSCore-0.8.0-beta.15.zip", checksum: "90220b72bc5ccb5248ea5f14d984b4b9002a0aeacaf269c737522f6740bafa66"),
        .binaryTarget(name: "PikdIOSAR", url: "https://storage.googleapis.com/pikd-staging-storage-pikd-staging/sdk/ios/0.8.0-beta.15/PikdIOSAR-0.8.0-beta.15.zip", checksum: "90a26ea2ee710f69355c8dbc2b596991241d593e905574cab03851afce2b48d9"),
        .binaryTarget(name: "PikdIOSUI", url: "https://storage.googleapis.com/pikd-staging-storage-pikd-staging/sdk/ios/0.8.0-beta.15/PikdIOSUI-0.8.0-beta.15.zip", checksum: "dd69de13f88e6b9886a456f20c0bbdfd23fb82cef6009c6179fb036f6a484470"),
        .binaryTarget(name: "PikdIOSExperience", url: "https://storage.googleapis.com/pikd-staging-storage-pikd-staging/sdk/ios/0.8.0-beta.15/PikdIOSExperience-0.8.0-beta.15.zip", checksum: "f02f7bb31d180731be56f31a17ae842ae67afd9b5a1e9de720d7bb2bfeb75268"),
        .binaryTarget(name: "PikdIOSPartnerExperience", url: "https://storage.googleapis.com/pikd-staging-storage-pikd-staging/sdk/ios/0.8.0-beta.15/PikdIOSPartnerExperience-0.8.0-beta.15.zip", checksum: "04d766521c81376032a37d802d5459dcc9f4df1b44d300017132cf60c59e2be2"),
        .binaryTarget(name: "PIKDImagePalette", url: "https://storage.googleapis.com/pikd-staging-storage-pikd-staging/sdk/ios/0.8.0-beta.15/PIKDImagePalette-0.8.0-beta.15.zip", checksum: "3f84e143739894dce903df0c59100bfde08a24dfad693748c4685d725d028726"),
        .binaryTarget(name: "PIKDARKit", url: "https://storage.googleapis.com/pikd-staging-storage-pikd-staging/sdk/PIKDARKit-0.8.0-beta.3.xcframework.zip", checksum: "89117ac060c76e93156236ed9b795cb810156c3789da14eeea61f2c6ad0466b3"),
        .target(name: "PikdIOSCoreDistribution", dependencies: ["PikdIOSCore"]),
        .target(name: "PikdIOSARDistribution", dependencies: ["PikdIOSAR", .target(name: "PIKDARKit", condition: .when(platforms: [.iOS]))]),
        .target(name: "PikdIOSUIDistribution", dependencies: ["PikdIOSUI", "PikdIOSCoreDistribution", .target(name: "PIKDImagePalette", condition: .when(platforms: [.iOS])), .product(name: "GoogleMaps", package: "ios-maps-sdk", condition: .when(platforms: [.iOS])), .product(name: "Lottie", package: "lottie-spm", condition: .when(platforms: [.iOS]))], resources: [.copy("PikdIOSUIResources.bundle")]),
        .target(name: "PikdIOSExperienceDistribution", dependencies: ["PikdIOSExperience", "PikdIOSCoreDistribution", "PikdIOSUIDistribution", "PikdIOSARDistribution"]),
        .target(name: "PikdIOSPartnerExperienceDistribution", dependencies: ["PikdIOSPartnerExperience", "PikdIOSCoreDistribution", "PikdIOSUIDistribution", "PikdIOSARDistribution", "PikdIOSExperienceDistribution"], resources: [.copy("PikdIOSPartnerExperienceResources.bundle")]),
    ])
