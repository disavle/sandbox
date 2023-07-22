import ProjectDescription

let dependencies = Dependencies(
	swiftPackageManager: [
		.remote(url: "https://github.com/pointfreeco/swift-snapshot-testing", requirement: .upToNextMajor(from: "1.11.1"))
	],
	platforms: [.iOS]
)
