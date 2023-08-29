//
//  ThemeViewAssembly.swift
//  Sandbox
//
//  Created by Dima Disavle on 29.08.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

extension ThemeViewView {
	/// Собрать сцену Сцена с настройкой темы приложения..
	/// - Parameters:
	///   - inputModel: Входная модель данных.
	///   - outputModel: Выходная модель данных.
	/// - Returns: ThemeViewView.
	func assembly(inputModel: ThemeViewModel.InputModel, outputModel: ThemeViewModel.OutputModel) -> some View {
		var view = self

		let presenter: IThemeViewPresenter = ThemeViewPresenter(view: view)

		let interactor: IThemeViewInteractor = ThemeViewInteractor(
			presenter: presenter,
			inputModel: inputModel,
			outputModel: outputModel
		)

		view.interactor = interactor

		return view
	}
}
