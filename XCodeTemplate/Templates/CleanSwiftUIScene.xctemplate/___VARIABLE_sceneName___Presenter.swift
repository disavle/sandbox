//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

// MARK: - I___FILEBASENAMEASIDENTIFIER___.
/// Протокол презентера сцены ___VARIABLE_documentationSceneName___.
protocol I___FILEBASENAMEASIDENTIFIER___ {
	/// Отобразить на View.
	/// - Parameter response: Модель данных для презентера.
	func present(_ response: ___VARIABLE_sceneName___Model.Main.Response)
}

// MARK: - ___FILEBASENAMEASIDENTIFIER___.
/// Презентер сцены ___VARIABLE_documentationSceneName___.
final class ___FILEBASENAMEASIDENTIFIER___ {
	// MARK: Dependencies.
	/// Отображение.
	private var view: I___VARIABLE_sceneName___View
	
	// MARK: Lifecycle.
	init(view: I___VARIABLE_sceneName___View) {
		self.view = view
	}
}

// MARK: - I___FILEBASENAMEASIDENTIFIER___ implementation
extension ___FILEBASENAMEASIDENTIFIER___: I___FILEBASENAMEASIDENTIFIER___ {
	/// Отобразить на View.
	/// - Parameter response: Модель данных для презентера.
	func present(_ response: ___VARIABLE_sceneName___Model.Main.Response) {
		let viewModel: ___VARIABLE_sceneName___Model.Main.Props = .init(name: response.name, age: String(response.age))
		view.render(viewModel)
	}
}
