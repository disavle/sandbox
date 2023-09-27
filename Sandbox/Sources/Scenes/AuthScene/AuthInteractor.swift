//
//  AuthInteractor.swift
//  Sandbox
//
//  Created by Dima Disavle on 26.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

// MARK: - IAuthInteractor.
/// Протокол интерактора сцены Сцена авторизации.
protocol IAuthInteractor {
	/// Передать для подготовки отображения.
	/// - Parameter request: Модель данных для интерактора.
	func start()
	func showRecurse()
}

// MARK: - AuthInteractor.
/// Интерактор сцены Сцена авторизации.
final class AuthInteractor {
	// MARK: Dependencies.
	/// Презентер.
	private let presenter: IAuthPresenter
	/// Входная модель данных.
	private let inputModel: AuthModel.InputModel
	/// Выходная модель данных.
	private let outputModel: AuthModel.OutputModel

	// MARK: Lifecycle.
	init(presenter: IAuthPresenter, inputModel: AuthModel.InputModel, outputModel: AuthModel.OutputModel) {
		self.presenter = presenter
		self.inputModel = inputModel
		self.outputModel = outputModel
	}
}

// MARK: - IAuthInteractor implementation
extension AuthInteractor: IAuthInteractor {
	/// Передать для подготовки отображения.
	/// - Parameter request: Модель данных для интерактора.
	func start() {
		let response: AuthModel.Main.Response = .init()
		presenter.present(response)
	}
	func showRecurse() {
		outputModel.showRecurse()
	}
}
