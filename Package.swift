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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", exact: "1.4.0-rc.5")
	],
	targets: [
		.target(name: "GXAudioBLWrapper",
				dependencies: [
					"GXAudioBL",
					.product(name: "GXCoreBL", package: "GXCoreBL", condition: .when(platforms: [.iOS, .watchOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXAudioBL",
			url: "https://pkgs.genexus.dev/iOS/preview/GXAudioBL-1.4.0-rc.5.xcframework.zip",
			checksum: "5967860b60d0614f619567f71b9db60139b8c8f4ce2bc366b4219250784dc527"
		)
	]
)