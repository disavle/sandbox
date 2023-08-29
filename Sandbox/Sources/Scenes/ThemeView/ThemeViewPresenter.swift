//
//  ThemeViewPresenter.swift
//  Sandbox
//
//  Created by Dima Disavle on 29.08.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

// MARK: - IThemeViewPresenter.
/// Протокол презентера сцены Сцена с настройкой темы приложения..
protocol IThemeViewPresenter {
	/// Отобразить на View.
	/// - Parameter response: Модель данных для презентера.
	func present(_ response: ThemeViewModel.Main.Response)
}

// MARK: - ThemeViewPresenter.
/// Презентер сцены Сцена с настройкой темы приложения..
final class ThemeViewPresenter {
	// MARK: Dependencies.
	/// Отображение.
	private var view: IThemeViewView

	// MARK: Lifecycle.
	init(view: IThemeViewView) {
		self.view = view
	}
}

// MARK: - IThemeViewPresenter implementation
extension ThemeViewPresenter: IThemeViewPresenter {
	/// Отобразить на View.
	/// - Parameter response: Модель данных для презентера.
	func present(_ response: ThemeViewModel.Main.Response) {
		let props: ThemeViewModel.Main.Props = .init(title: response.title)
		view.render(props)
	}
}
