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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.0.0-beta.20230706165352")
	],
	targets: [
		.target(name: "GXAudioBLWrapper",
				dependencies: [
					"GXAudioBL",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.watchOS, .iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXAudioBL",
			url: "https://pkgs.genexus.dev/iOS/beta/GXAudioBL-1.0.0-beta.20230706165352.xcframework.zip",
			checksum: "f7b1782f89020283c62108411a1a3dac471522d472ef05d3fbfb3603e5a113f0"
		)
	]
)