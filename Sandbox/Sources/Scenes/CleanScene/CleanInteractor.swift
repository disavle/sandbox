//
//  CleanInteractor.swift
//  Sandbox
//
//  Created by Dima Disavle on 23.07.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

/// Протокол интерактора сцены Пример.
protocol ICleanInteractor {
	/// Передать для подготовки отображения.
	/// - Parameter request: Модель данных для интерактора.
	func start(_ request: CleanModel.Main.Request)
	/// Перейти ко 2-й сцене
	func showSecondScene()
}

// MARK: - CleanInteractor.
/// Интерактор сцены Пример.
final class CleanInteractor {
	// MARK: Dependencies.
	/// Презентер.
	private let presenter: ICleanPresenter
	/// Входная модель данных.
	private let inputModel: CleanModel.InputModel
	/// Выходная модель данных.
	private let outputModel: CleanModel.OutputModel

	// MARK: Lifecycle.
	init(presenter: ICleanPresenter, inputModel: CleanModel.InputModel, outputModel: CleanModel.OutputModel) {
		self.presenter = presenter
		self.inputModel = inputModel
		self.outputModel = outputModel
	}
}

// MARK: - ICleanInteractor implementation
extension CleanInteractor: ICleanInteractor {
	/// Передать для подготовки отображения.
	/// - Parameter request: Модель данных для интерактора.
	func start(_ request: CleanModel.Main.Request) {
		let response: CleanModel.Main.Response = .init(name: inputModel.name, age: inputModel.age)
		presenter.present(response)
	}

	/// Перейти ко 2-й сцене
	func showSecondScene() {
		outputModel.showSecondView()
	}
}
