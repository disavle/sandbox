//
//  CleanModel.swift
//  Sandbox
//
//  Created by Dima Disavle on 23.07.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import Foundation

/// Модель для обновления UI.
final class CleanViewModel: ObservableObject {
	@Published var props: CleanModel.Main.Props = .initial
}

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
		struct Props {
			let name: String
			let age: String

			static let initial = Props(name: "", age: "")
		}
	}
}
