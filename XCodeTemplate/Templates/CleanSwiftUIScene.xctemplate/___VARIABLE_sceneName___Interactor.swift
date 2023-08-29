//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

// MARK: - I___FILEBASENAMEASIDENTIFIER___.
/// Протокол интерактора сцены ___VARIABLE_documentationSceneName___.
protocol I___FILEBASENAMEASIDENTIFIER___ {
	/// Передать для подготовки отображения.
	/// - Parameter request: Модель данных для интерактора.
	func start(_ request: ___VARIABLE_sceneName___Model.Main.Request)
}

// MARK: - ___FILEBASENAMEASIDENTIFIER___.
/// Интерактор сцены ___VARIABLE_documentationSceneName___.
final class ___FILEBASENAMEASIDENTIFIER___ {
	// MARK: Dependencies.
	/// Презентер.
	private let presenter: I___VARIABLE_sceneName___Presenter
	/// Входная модель данных.
	private let inputModel: ___VARIABLE_sceneName___Model.InputModel
	/// Выходная модель данных.
	private let outputModel: ___VARIABLE_sceneName___Model.OutputModel
	
	// MARK: Lifecycle.
	init(presenter: I___VARIABLE_sceneName___Presenter, inputModel: ___VARIABLE_sceneName___Model.InputModel, outputModel: ___VARIABLE_sceneName___Model.OutputModel) {
		self.presenter = presenter
		self.inputModel = inputModel
		self.outputModel = outputModel
	}
}

// MARK: - I___FILEBASENAMEASIDENTIFIER___ implementation
extension ___FILEBASENAMEASIDENTIFIER___: I___FILEBASENAMEASIDENTIFIER___ {
	/// Передать для подготовки отображения.
	/// - Parameter request: Модель данных для интерактора.
	func start(_ request: ___VARIABLE_sceneName___Model.Main.Request) {
		let response: ___VARIABLE_sceneName___Model.Main.Response = .init()
		presenter.present(response)
	}
}
