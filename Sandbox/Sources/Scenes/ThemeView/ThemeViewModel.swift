//
//  ThemeViewModel.swift
//  Sandbox
//
//  Created by Dima Disavle on 29.08.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import UIKit

/// Модель сцены Сцена с настройкой темы приложения..
enum ThemeViewModel {
	/// Входная модель сцены Сцена с настройкой темы приложения..
	struct InputModel {
		let title: String
	}

	/// Выходная модель сцены Сцена с настройкой темы приложения..
	struct OutputModel { }

	enum Theme: String {
		case light, dark, system

		var uiInterfaceStyle: UIUserInterfaceStyle {
			switch self {
			case .light:
				return .light
			case .dark:
				return .dark
			case .system:
				return .unspecified
			}
		}
	}

	enum AppIcon: String {
		case dark
		case light

		var buttonText: String {
			switch self {
			case .dark:
				return "Dark"
			case .light:
				return "Light"
			}
		}

		var rawValue: String? {
			switch self {
			case .dark:
				return nil
			case .light:
				return "AppIconLight"
			}
		}
	}

	/// Модели данных VIP цикла.
	enum Main {
		/// Данные получаемые из View.
		struct Request { }

		/// Данные получаемые из Interactor.
		struct Response {
			let title: String
		}

		/// Данные получаемые из Presenter.
		struct Props {
			let title: String
		}
	}
}
