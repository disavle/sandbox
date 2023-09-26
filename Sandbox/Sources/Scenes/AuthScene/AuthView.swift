//
//  AuthView.swift
//  Sandbox
//
//  Created by Dima Disavle on 26.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

// MARK: - IAuthView.
/// Протокол отображения сцены Сцена авторизации.
protocol IAuthView {
	/// Рендер отображения.
	/// - Parameter props: Модель данных для отображения.
	func render(_ props: AuthModel.Main.Props)
}

// MARK: - AuthView.
/// Отображение сцены Сцена авторизации.
struct AuthView: View {
	// MARK: Dependencies.
	/// Модель данных для отображения.
	@ObservedObject var props: AuthView.Props = .initial
	/// Интерактор.
	var interactor: IAuthInteractor!

	// MARK: View.
	var body: some View {
		ZStack {
			Color(UIColor.white).ignoresSafeArea()
			VStack {
				Text("Log in!")
					.modifier(TitleStyle())

				Button("Tap") {
				}
				.buttonStyle(MyButtonStyle())
			}
		}
		.onAppear {
			interactor.start()
		}
	}
}

// MARK: - IAuthView implementation.
extension AuthView: IAuthView {
	/// Рендер отображения.
	/// - Parameter props: Модель данных для отображения.
	func render(_ props: AuthModel.Main.Props) {
		self.props.example = props.example
	}
}

// MARK: - IProps.
extension AuthView: IProps {
	@MainActor
	final class Props: ObservableObject {
		@Published var example: String = ""

		static let initial = Props()
	}
}

// MARK: - Preview.
#if DEBUG
/// Вспомогательная функция для превью верстки.
struct AuthView_Previews: PreviewProvider {
	static var previews: some View {
		AuthView()
	}
}
#endif

struct TitleStyle: ViewModifier {
	let titleFontBold = Font.title.weight(.bold)
	let navyBlue = Color(red: 0, green: 0, blue: 0.5)

	func body(content: Content) -> some View {
		content
			.font(titleFontBold)
			.foregroundColor(navyBlue)
			.padding()
	}
}

struct MyButtonStyle: ButtonStyle {
	let navyBlue = Color(red: 0, green: 0, blue: 0.5)

	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.padding()
			.background(navyBlue)
			.foregroundColor(.white)
			.clipShape(Capsule())
	}
}
