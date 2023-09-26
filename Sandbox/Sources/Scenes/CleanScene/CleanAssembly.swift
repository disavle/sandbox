//
//  CleanAssembly.swift
//  Sandbox
//
//  Created by Dima Disavle on 23.07.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

extension CleanView {
	/// Собрать сцену Пример.
	/// - Parameters:
	///   - inputModel: Входная модель данных.
	///   - outputModel: Выходная модель данных.
	/// - Returns: CleanView.
	func assembly(inputModel: CleanModel.InputModel, outputModel: CleanModel.OutputModel) -> Self {
		var view = self

		let presenter: ICleanPresenter = CleanPresenter(view: view)

		let interactor: ICleanInteractor = CleanInteractor(
			presenter: presenter,
			inputModel: inputModel,
			outputModel: outputModel
		)

		view.interactor = interactor

		return view
	}
}
