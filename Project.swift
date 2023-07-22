import ProjectDescription

public var scripts: [TargetScript] {
	var scripts = [TargetScript]()
	let swiftLintScriptString = "SwiftLint/swiftlint --fix && SwiftLint/swiftlint"
	let swiftLintScript = TargetScript.post(script: swiftLintScriptString, name: "SwiftLint")
	scripts.append(swiftLintScript)
	return scripts
}

let baseSettings: [String: SettingValue] = [
	"MARKETING_VERSION": "1.0", // Version
	"CURRENT_PROJECT_VERSION": "1", // Build
	"ASSETCATALOG_COMPILER_INCLUDE_ALL_APPICON_ASSETS": "YES" // App Icons Source
]

let target = Target(
	name: "Sandbox",
	platform: .iOS,
	product: .app,
	productName: "Sandbox",
	bundleId: "Disavle.Sandbox",
	deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
	infoPlist: "Sandbox/Configs/Info.plist",
	sources: ["Sandbox/Sources/**"],
	resources: ["Sandbox/Resources/**"],
	scripts: scripts,
	dependencies: [
		.external(name: "SnapshotTesting")
	],
	settings: .settings(
		base: baseSettings,
		configurations: [.debug(name: .debug), .release(name: .release)]
	)
)

let testTarget = Target(
	name: "SandboxTests",
	platform: .iOS,
	product: .unitTests,
	bundleId: "Disavle.SandboxTests",
	deploymentTarget: .iOS(targetVersion: "14.0", devices: .iphone),
	sources: "SandboxTests/Sources/**",
	dependencies: [
		.target(name: "Sandbox"),
	]
)

let project = Project(
	name: "Sandbox",
	organizationName: "Disavle",
	targets: [target, testTarget],
	schemes: [
		Scheme(
			name: "Sandbox",
			shared: true,
			buildAction: .buildAction(targets: ["Sandbox"]),
			testAction: .targets(["SandboxTests"]),
			runAction: .runAction(executable: "Sandbox")
		),
		Scheme(
			name: "SandboxTests",
			shared: true,
			buildAction: .buildAction(targets: ["SandboxTests"]),
			testAction: .targets(["SandboxTests"]),
			runAction: .runAction(executable: "SandboxTests")
		),
	]
)
