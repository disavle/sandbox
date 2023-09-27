//
//  AuthModel.swift
//  Sandbox
//
//  Created by Dima Disavle on 26.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

/// Модель сцены Сцена авторизации.
enum AuthModel {
	/// Входная модель сцены Сцена авторизации.
	struct InputModel { }

	/// Выходная модель сцены Сцена авторизации.
	struct OutputModel {
		let showRecurse: () -> Void
	}

	/// Модели данных VIP цикла.
	enum Main {
		/// Данные получаемые из View.
		struct Request { }

		/// Данные получаемые из Interactor.
		struct Response { }

		/// Данные получаемые из Presenter.
		struct Props {
			let example: String
		}
	}
}
