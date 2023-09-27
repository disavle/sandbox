//
//  AuthPresenter.swift
//  Sandbox
//
//  Created by Dima Disavle on 26.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

// MARK: - IAuthPresenter.
/// Протокол презентера сцены Сцена авторизации.
protocol IAuthPresenter {
	/// Отобразить на View.
	/// - Parameter response: Модель данных для презентера.
	func present(_ response: AuthModel.Main.Response)
}

// MARK: - AuthPresenter.
/// Презентер сцены Сцена авторизации.
final class AuthPresenter {
	// MARK: Dependencies.
	/// Отображение.
	private var view: IAuthView

	// MARK: Lifecycle.
	init(view: IAuthView) {
		self.view = view
	}
}

// MARK: - IAuthPresenter implementation
extension AuthPresenter: IAuthPresenter {
	/// Отобразить на View.
	/// - Parameter response: Модель данных для презентера.
	func present(_ response: AuthModel.Main.Response) {
		let props: AuthModel.Main.Props = .init(example: "")
		view.render(props)
	}
}
