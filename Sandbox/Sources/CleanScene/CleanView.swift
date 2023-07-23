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
	/// - Parameter viewModel: Модель данных для отображения.
	func render(_ viewModel: CleanModel.Main.ViewModel)
}

// MARK: - CleanView.
/// Отображение сцены Пример.
struct CleanView: View {
	// MARK: Dependencies.
	/// Модель данных для отображения.
	@ObservedObject private var viewModel = CleanViewModel()

	var interactor: ICleanInteractor!

	// MARK: View.
	var body: some View {
		NavigationView {
			ZStack {
				Color(UIColor.systemBackground)
					.edgesIgnoringSafeArea(.all)
				VStack {
					Text(viewModel.name)
					Text(viewModel.age)
				}
			}
			.navigationTitle(SandboxStrings.Localizable.CleanScene.navBarTitle)
			.navigationBarItems(trailing: Button(SandboxStrings.Localizable.CleanScene.navBarTitle.lowercased()) {
				interactor.showSecondScene()
			})
		}
		.onAppear {
			interactor.start(CleanModel.Main.Request())
		}
	}
}

// MARK: - Preview.
/// Вспомогательная функция для превью верстки.
struct CleanView_Previews: PreviewProvider {
	static var previews: some View {
		CleanView()
	}
}

// MARK: - ICleanView implementation
extension CleanView: ICleanView {
	/// Рендер отображения.
	/// - Parameter viewModel: Модель данных для отображения.
	func render(_ viewModel: CleanModel.Main.ViewModel) {
		self.viewModel.name = viewModel.name
		self.viewModel.age = viewModel.age
	}
}
