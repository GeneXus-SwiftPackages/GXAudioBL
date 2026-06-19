// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXAudioBL",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXAudioBL",
			targets: ["GXAudioBLWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "4.2.0-beta.23")
	],
	targets: [
		.target(name: "GXAudioBLWrapper",
				dependencies: [
					"GXAudioBL",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXAudioBL",
			url: "https://pkgs.genexus.dev/iOS/beta/GXAudioBL-4.2.0-beta.23.xcframework.zip",
			checksum: "0bb102e27730e4ab67ea6589aa07a0e716f79c45029fadfd8464bc62af56c6c5"
		)
	]
)