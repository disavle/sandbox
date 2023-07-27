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
	@ObservedObject private var viewModel = CleanViewModel()

	var interactor: ICleanInteractor!

	@State var isShow2View = false

	// MARK: View.
	var body: some View {
		ZStack {
			Color(UIColor.systemBackground)
				.edgesIgnoringSafeArea(.all)
			VStack {
				Text(viewModel.props.name)
				Text(viewModel.props.age)
				Button("Button") {
					self.isShow2View.toggle()
				}
				NavigationLink(destination: ContentView(), isActive: $isShow2View) {
					EmptyView()
				}
			}
		}
		.navigationTitle(SandboxStrings.Localizable.CleanScene.navBarTitle)
		.navigationBarItems(trailing: Button(SandboxStrings.Localizable.CleanScene.navBarTitle.lowercased()) {
			interactor.showSecondScene()
		})
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
		viewModel.props = props
	}
}

// MARK: - ViewModel для биндинга.
extension CleanView {
	/// Модель для обновления UI.
	final class CleanViewModel: ObservableObject {
		@Published var props: CleanModel.Main.Props = .initial
	}
}

// MARK: - Preview.
/// Вспомогательная функция для превью верстки.
struct CleanView_Previews: PreviewProvider {
	static var previews: some View {
		CleanView()
	}
}
