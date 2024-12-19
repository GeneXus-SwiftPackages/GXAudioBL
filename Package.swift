// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXAudioBL",
	platforms: [.iOS("13.0"), .watchOS("9.0"), .tvOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXAudioBL",
			targets: ["GXAudioBLWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "2.2.0-beta.26")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXAudioBL-2.2.0-beta.26.xcframework.zip",
			checksum: "48ddad5d7bfe5581048a5ca39cac61f0700b1b45d08d8d7f442c49a352dd57ca"
		)
	]
)