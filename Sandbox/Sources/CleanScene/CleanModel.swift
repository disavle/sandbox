//
//  CleanModel.swift
//  Sandbox
//
//  Created by Dima Disavle on 23.07.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import Foundation

/// Модель сцены Пример.
enum CleanModel {
	/// Входная модель сцены Пример.
	struct InputModel {
		let name: String
		let age: Int
	}

	/// Выходная модель сцены Пример.
	struct OutputModel {
		let showSecondView: () -> Void
	}

	/// Модели данных VIP цикла.
	enum Main {
		/// Данные получаемые из View.
		struct Request { }

		/// Данные получаемые из Interactor.
		struct Response {
			let name: String
			let age: Int
		}

		/// Данные получаемые из Presenter.
		struct ViewModel {
			let name: String
			let age: String
		}
	}
}

// TODO: Как избавиться от копирования?
final class CleanViewModel: ObservableObject {
	@Published var name: String = ""
	@Published var age: String = ""
}