// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXAudioBL",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXAudioBL",
			targets: ["GXAudioBLWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", branch: "beta")
	],
	targets: [
		.target(name: "GXAudioBLWrapper",
				dependencies: [
					"GXAudioBL",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .tvOS, .watchOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXAudioBL",
			url: "https://pkgs.genexus.dev/iOS/beta/GXAudioBL-1.0.0-beta+20230428202437.xcframework.zip",
			checksum: "de088aa14040e112a9c958ddca60da71296f20b4c77fb549880400f9d0388402"
		)
	]
)