//
//  CleanPresenter.swift
//  Sandbox
//
//  Created by Dima Disavle on 23.07.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

/// Протокол презентера сцены Пример.
protocol ICleanPresenter {
	/// Отобразить на View.
	/// - Parameter response: Модель данных для презентера.
	func present(_ response: CleanModel.Main.Response)
}

// MARK: - CleanPresenter.
/// Презентер сцены Пример.
final class CleanPresenter {
	// MARK: Dependencies.
	/// Отображение.
	private var view: ICleanView

	// MARK: Lifecycle.
	init(view: ICleanView) {
		self.view = view
	}
}

// MARK: - ICleanPresenter implementation
extension CleanPresenter: ICleanPresenter {
	/// Отобразить на View.
	/// - Parameter response: Модель данных для презентера.
	func present(_ response: CleanModel.Main.Response) {
		let viewModel: CleanModel.Main.Props = .init(name: response.name, age: String(response.age))
		view.render(viewModel)
	}
}
