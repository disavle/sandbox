import ProjectDescription

let dependencies = Dependencies(
	swiftPackageManager: [
		.remote(url: "https://github.com/pointfreeco/swift-snapshot-testing", requirement: .upToNextMajor(from: "1.11.1")),
		.remote(url: "https://github.com/apple/swift-http-types", requirement: .upToNextMajor(from: "1.0.0"))
	],
	platforms: [.iOS]
)
