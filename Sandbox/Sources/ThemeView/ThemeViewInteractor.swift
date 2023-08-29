//
//  ThemeViewInteractor.swift
//  Sandbox
//
//  Created by Dima Disavle on 29.08.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

// MARK: - IThemeViewInteractor.
/// Протокол интерактора сцены Сцена с настройкой темы приложения..
protocol IThemeViewInteractor {
	/// Передать для подготовки отображения.
	/// - Parameter request: Модель данных для интерактора.
	func start(_ request: ThemeViewModel.Main.Request)
}

// MARK: - ThemeViewInteractor.
/// Интерактор сцены Сцена с настройкой темы приложения..
final class ThemeViewInteractor {
	// MARK: Dependencies.
	/// Презентер.
	private let presenter: IThemeViewPresenter
	/// Входная модель данных.
	private let inputModel: ThemeViewModel.InputModel
	/// Выходная модель данных.
	private let outputModel: ThemeViewModel.OutputModel

	// MARK: Lifecycle.
	init(presenter: IThemeViewPresenter, inputModel: ThemeViewModel.InputModel, outputModel: ThemeViewModel.OutputModel) {
		self.presenter = presenter
		self.inputModel = inputModel
		self.outputModel = outputModel
	}
}

// MARK: - IThemeViewInteractor implementation
extension ThemeViewInteractor: IThemeViewInteractor {
	/// Передать для подготовки отображения.
	/// - Parameter request: Модель данных для интерактора.
	func start(_ request: ThemeViewModel.Main.Request) {
		let response: ThemeViewModel.Main.Response = .init(title: inputModel.title)
		presenter.present(response)
	}
}
