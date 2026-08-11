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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "5.0.0-rc.1")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXAudioBL-5.0.0-rc.1.xcframework.zip",
			checksum: "f903f1ca4d5622ddcdbb2ec7edc35012c9753fe947a6d414e9779b9e93226867"
		)
	]
)