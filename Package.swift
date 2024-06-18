// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXAudioBL",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXAudioBL",
			targets: ["GXAudioBLWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "2.1.0-beta.25")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXAudioBL-2.1.0-beta.25.xcframework.zip",
			checksum: "c4a238c16d5a63b021765b9b76e43b0b3556856986453046752ea55329a39cb5"
		)
	]
)