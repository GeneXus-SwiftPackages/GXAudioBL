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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "3.0.1")
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXAudioBL-3.0.1.xcframework.zip",
			checksum: "fd768c9b8e775c2ca9298a1f77591472ec18a2a48c57acc7821809d612c52ced"
		)
	]
)