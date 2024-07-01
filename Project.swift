import ProjectDescription

enum ProjectSettings {
	public static var organizationName: String { "leonovka.SwiftBook" }
	public static var projectName: String { "MdEditor" }
	public static var appVersionName: String { "1.0.0" }
	public static var appVersionBuild: Int { 1}
	public static var developmentTeam: String { "" }
	public static var targetVersioh: String { "15.0" }
	public static var bundleId: String { "\(organizationName). \(projectName)" }
}

// внутри доп настройки info.plist для отказа от сториборда
let infoPlist: [String: Plist.Value] = [
	"UIApplicationSceneManifest": [
		"UIApplicationSupportsMultipleScenes": false,
		"UISceneConfigurations": [
			"UIWindowSceneSessionRoleApplication": [
				[
					"UISceneConfigurationName": "Default Configuration",
					"UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
				]
			]
		]
	],
	"UILaunchScreen": [:]
]

// внутри текст скрипта из первого урока
// + создание скрипта с необходимыми настройками: имя, позиция, выключение опции

var swiftLintTargetScript: TargetScript {
	let swiftLintScriptString = """
		 export PATH="$PATH:/opt/homebrew/bin"
		 if which swiftlint > /dev/null; then
		 swiftlint
		 else
		 echo "warning: Swiftlint not installed, download from https://github.com/realm/SwiftLint"
		 fi
	"""
	
	return TargetScript.pre(
		script: swiftLintScriptString,
		name: "Run SwiftLint",
		basedOnDependencyAnalysis: false
	)
}

let target = Target(
	name: "mdEditor",
	destinations: [.iPhone],
	product: .app,
	bundleId: "ru.liliyaAndreeva.mdEditor",
	infoPlist: .extendingDefault(with: infoPlist),
	sources: ["Sources/Scenes/LoginScene**",
			  "Sources/Scenes/TodoListScene/**",
			 "Sources/Coordinators/**",
			  "Sources/Entities/**",
			  "Sources/Theme/**"],
	scripts: [swiftLintTargetScript],
	dependencies: [
		.package(product: "TaskManagerPackage"),
		.package(product: "DataStructures")
	]
)


let project = Project(
	name: "mdEditor",
	options: .options(
		defaultKnownRegions: ["Eng", "Rus"],
		developmentRegion: "Eng"
	),
	packages: [
		.local(path: ("/Users/liliaandreeva/Desktop/MdEditor/packges/TaskManagerPackage")),
		.local(path: ("/Users/liliaandreeva/Desktop/MdEditor/packges/DataStructures"))
	],
	targets: [
		target
	]
)



