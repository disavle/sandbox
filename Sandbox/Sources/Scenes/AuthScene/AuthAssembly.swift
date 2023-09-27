//
//  AuthAssembly.swift
//  Sandbox
//
//  Created by Dima Disavle on 26.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

extension AuthView {
	/// Собрать сцену Сцена авторизации.
	/// - Parameters:
	///   - inputModel: Входная модель данных.
	///   - outputModel: Выходная модель данных.
	/// - Returns: AuthView.
	func assembly(inputModel: AuthModel.InputModel, outputModel: AuthModel.OutputModel) -> Self {
		var view = self

		let presenter: IAuthPresenter = AuthPresenter(view: view)

		let interactor: IAuthInteractor = AuthInteractor(
			presenter: presenter,
			inputModel: inputModel,
			outputModel: outputModel
		)

		view.interactor = interactor

		return view
	}
}
