//
//  CleanView.swift
//  Sandbox
//
//  Created by Dima Disavle on 23.07.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Протокол отображения сцены Пример.
protocol ICleanView {
	/// Рендер отображения.
	/// - Parameter props: Модель данных для отображения.
	func render(_ props: CleanModel.Main.Props)
}

// MARK: - CleanView.
/// Отображение сцены Пример.
struct CleanView: View {
	// MARK: Dependencies.
	/// Модель данных для отображения.
	@ObservedObject var props: CleanView.Props = .initial

	var interactor: ICleanInteractor!

	// MARK: View.
	var body: some View {
		ZStack {
			Color(UIColor.systemBackground)
				.edgesIgnoringSafeArea(.all)
			VStack {
				Text(props.name)
				Text(props.age)
				Button("Button") {
					self.interactor.showSecondScene()
				}
			}
		}
		.navigationTitle(SandboxStrings.Localizable.CleanScene.navBarTitle)
		.onAppear {
			interactor.start(CleanModel.Main.Request())
		}
	}
}

// MARK: - ICleanView implementation.
extension CleanView: ICleanView {
	/// Рендер отображения.
	/// - Parameter props: Модель данных для отображения.
	func render(_ props: CleanModel.Main.Props) {
		self.props.name = props.name
		self.props.age = props.age
	}
}

// MARK: - IProps.
extension CleanView: IProps {
	@MainActor
	final class Props: ObservableObject {
		@Published var name: String = ""
		@Published var age: String = ""

		static let initial = Props()
	}
}

#if DEBUG
// MARK: - Preview.
/// Вспомогательная функция для превью верстки.
struct CleanView_Previews: PreviewProvider {
	static var previews: some View {
		CleanView()
	}
}
#endif
