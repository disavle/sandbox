//
//  AppCoordinator.swift
//  Sandbox
//
//  Created by Dima Disavle on 27.07.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Протокол координатор приложения.
protocol IAppCoordinator: ICoordinator, ICoordinatorView {
	func showCleanCoordinator()
}

// https://www.youtube.com/watch?v=0fT_xyBDl0w

/// Координатор приложения.
final class AppCoordinator {
	/// Перечисление сцен.
	enum ViewScene: Identifiable {
		var id: UUID { return UUID() }
		case themeView
		case cleanView
	}

	@Published var path: [ViewScene] = [.cleanView]
	@Published var sheet: ViewScene?
	@Published var fullScreen: ViewScene?
	weak var finishDelegate: CordinatorFinishDelegate?
	weak var parentCoordinator: (any ICoordinator)?
	var childCoordinators: [any ICoordinator] = []

	func start() {
		showCleanCoordinator()
	}

	@ViewBuilder
	func build(_ view: ViewScene) -> some View {
		switch view {
		case .themeView:
			ThemeViewView().assembly(
				inputModel: ThemeViewModel.InputModel(title: "Fuck SwiftUI!"),
				outputModel: ThemeViewModel.OutputModel()
			)
		case .cleanView:
			CleanView().assembly(
				inputModel: CleanModel.InputModel(name: "Дима", age: 21),
				outputModel: CleanModel.OutputModel {
					self.push(.themeView)
				}
			)
		}
	}
}

// MARK: - IAppCoordinator

extension AppCoordinator: IAppCoordinator {
	func showCleanCoordinator() {
		let cleanCoordinator = AppCoordinator()
		cleanCoordinator.parentCoordinator = self
		cleanCoordinator.finishDelegate = self
		addChildCoordinator(cleanCoordinator)
		cleanCoordinator.start()
	}
}

// MARK: - CordinatorFinishDelegate

extension AppCoordinator: CordinatorFinishDelegate {
	func didFinish(coordinator: ICoordinator) {
		if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
			childCoordinators.remove(at: index)
		}
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
	}
}
