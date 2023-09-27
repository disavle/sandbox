//
//  ThemeViewView.swift
//  Sandbox
//
//  Created by Dima Disavle on 29.08.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

// MARK: - IThemeViewView.
/// Протокол отображения сцены Сцена с настройкой темы приложения..
protocol IThemeViewView {
	/// Рендер отображения.
	/// - Parameter props: Модель данных для отображения.
	func render(_ props: ThemeViewModel.Main.Props)
}

// MARK: - ThemeViewView.
/// Отображение сцены Сцена с настройкой темы приложения..
struct ThemeViewView: View {
	// MARK: Dependencies.
	/// Модель данных для отображения.
	@ObservedObject var props: ThemeViewView.Props = .initial
	/// Интерактор.
	var interactor: IThemeViewInteractor!

	// MARK: View.
	@State var appIcon: ThemeViewModel.AppIcon = .light

	var body: some View {
		VStack {
			Text(props.title)
			HStack {
				Button(appIcon.buttonText) {
					changeTheme()
				}
				.padding(10)
				.foregroundColor(Color(UIColor.systemBackground))
				.background(Color(UIColor.label))
			}
			.clipShape(Capsule())
		}
		.modifier(NavigationBarHidden())
		.onAppear {
			interactor.start(ThemeViewModel.Main.Request())
		}
	}

	private func changeTheme() {
		UIApplication.shared.setAlternateIconName(appIcon.rawValue) { error in
			if let error = error {
				print(error.localizedDescription)
			} else {
				if appIcon == .dark {
					appIcon = .light
					guard let scene = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first else { return }
					scene.overrideUserInterfaceStyle = .dark
				} else {
					appIcon = .dark
					guard let scene = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first else { return }
					scene.overrideUserInterfaceStyle = .light
				}
				print("Success!")
			}
		}
	}
}

// MARK: - IThemeViewView implementation.
extension ThemeViewView: IThemeViewView {
	/// Рендер отображения.
	/// - Parameter props: Модель данных для отображения.
	func render(_ props: ThemeViewModel.Main.Props) {
		self.props.title = props.title
	}
}

// MARK: - IProps.
extension ThemeViewView: IProps {
	@MainActor
	final class Props: ObservableObject {
		@Published var title: String = ""

		static let initial = Props()
	}
}

// MARK: - Preview.
#if DEBUG
/// Вспомогательная функция для превью верстки.
struct ThemeViewView_Previews: PreviewProvider {
	static var previews: some View {
		ThemeViewView()
	}
}
#endif
