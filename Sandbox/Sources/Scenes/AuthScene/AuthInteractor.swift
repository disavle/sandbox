//
//  AuthInteractor.swift
//  Sandbox
//
//  Created by Dima Disavle on 26.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import HTTPTypes
import HTTPTypesFoundation
import Foundation

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

	/// Проверка работы пакета для сетевого слоя от Apple.
	private func checkSwiftHTTPTypes() async {
		let request = HTTPRequest(method: .post, scheme: "https", authority: "postman-echo.com", path: "/post")
		let json: [String: Any] = ["INPUT": "abc"]
		do {
			let requestBody = try JSONSerialization.data(withJSONObject: json)
			// URLSession.shared.upload для передачи данных. Для GET нужен data.
			let (responseBody, response) = try await URLSession.shared.upload(for: request, from: requestBody)
			// Нужен еще кастомный декодер для ответов.
			let json = try JSONSerialization.jsonObject(with: responseBody)
			print("🔥\(json)")
			print("ℹ️\(response)")
		} catch {
			print("🥲\(error)")
		}
	}
}

// MARK: - IAuthInteractor implementation
extension AuthInteractor: IAuthInteractor {
	/// Передать для подготовки отображения.
	/// - Parameter request: Модель данных для интерактора.
	func start() {
		Task {
			await checkSwiftHTTPTypes()
		}
		let response: AuthModel.Main.Response = .init()
		presenter.present(response)
	}
	func showRecurse() {
		outputModel.showRecurse()
	}
}
