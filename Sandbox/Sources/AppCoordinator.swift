//
//  AppCoordinator.swift
//  Sandbox
//
//  Created by Dima Disavle on 27.07.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Координатор приложения.
final class AppCoordinator: ICoordinator {
	@Published var path: [ViewScene] = []
	@Published var sheet: ViewScene?
	@Published var fullScreen: ViewScene?
	@Published var childCoordinators: [any ICoordinatorCycle] = []
	weak var parentCoordinator: (any ICoordinatorCycle)?

	/// Перечисление сцен.
	enum ViewScene: Identifiable {
		var id: UUID { return UUID() }
		case mainTab
		case auth(AuthCoordinator)
	}

	/// Билдер для экрана.
	/// - Parameter view: Экран ViewScene.
	/// - Returns: Экран для отображения.
	@ViewBuilder
	func build(_ view: ViewScene) -> some View {
		switch view {
		case .auth(let coordinator):
			AuthCoordinatorView(coordinator: coordinator)
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
		let authCoordinator = AuthCoordinator()
		authCoordinator.parentCoordinator = self
		addChildCoordinator(authCoordinator)
		path = [.auth(authCoordinator)]
	}
}

// MARK: - AppCoordinatorView
/// Отображение координатора приложения. 
struct AppCoordinatorView: View {
	@StateObject var coordinator: AppCoordinator

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
