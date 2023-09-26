//
//  AppCoordinator.swift
//  Sandbox
//
//  Created by Dima Disavle on 27.07.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

protocol IAppCoordinator: ICoordinator {
	/// Показать окно авторизации.
	func showAuth()
}

/// Координатор приложения.
final class AppCoordinator: IAppCoordinator {
	@Published var path: [ViewScene] = []
	@Published var sheet: ViewScene?
	@Published var fullScreen: ViewScene?
	@Published var childCoordinators: [any ICoordinatorCycle] = []
	weak var parentCoordinator: (any ICoordinatorCycle)?

	/// Перечисление сцен.
	enum ViewScene: Identifiable {
		var id: UUID { return UUID() }
		case mainTab
		case auth
	}

	/// Билдер для экрана.
	/// - Parameter view: Экран ViewScene.
	/// - Returns: Экран для отображения.
	@ViewBuilder
	func build(_ view: ViewScene) -> some View {
		switch view {
		case .auth:
			EmptyView()
		case .mainTab:
			MainTab(
				firstTab: ThemeViewView().assembly(
					inputModel: ThemeViewModel.InputModel(title: "Fuck SwiftUI!"),
					outputModel: ThemeViewModel.OutputModel()
				),
				secondTab: CleanView().assembly(
					inputModel: CleanModel.InputModel(name: "Дима", age: 21),
					outputModel: CleanModel.OutputModel {
					}
				)
			)
		}
	}

	func start() {
		path = [.mainTab]
	}

	func showAuth() {
		path = [.auth]
	}
}

// MARK: - AppCoordinatorView
/// Отображение координатора приложения. 
struct AppCoordinatorView<Coordinator: IAppCoordinator>: View {
	@StateObject var coordinator: Coordinator

	var body: some View {
		NavigationView {
			NStack(path: $coordinator.path) { scene in
				coordinator.build(scene)
					.sheet(item: $coordinator.sheet) { sheet in
						coordinator.build(sheet)
					}
					.fullScreenCover(item: $coordinator.fullScreen) { fullscreen in
						coordinator.build(fullscreen)
					}
			}
		}
		.onAppear {
			coordinator.start()
		}
	}
}
