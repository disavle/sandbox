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
	weak var finishDelegate: CoordinatorFinishDelegate?

	/// Перечисление сцен.
	enum ViewScene: Identifiable {
		var id: UUID { return UUID() }
		case mainTab(ThemeCoordinator, CleanCoordinator)
		case auth(AuthCoordinator)
	}

	/// Билдер для экрана.
	/// - Parameter view: Экран ViewScene.
	/// - Returns: Экран для отображения.
	@ViewBuilder
	func build(_ view: ViewScene) -> some View {
		switch view {
		case let .auth(coordinator):
			CoordinatorView(coordinator: coordinator)
		case let .mainTab(themeCoordinator, cleanCoordinator):
			MainTab(
				firstTab: CoordinatorView(coordinator: themeCoordinator),
				secondTab: CoordinatorView(coordinator: cleanCoordinator)
			)
		}
	}

	func start() {
		childCoordinators.removeAll()

		let themeCoordinator = ThemeCoordinator()
		themeCoordinator.finishDelegate = self
		themeCoordinator.parentCoordinator = self
		themeCoordinator.start()
		addChildCoordinator(themeCoordinator)

		let cleanCoordinator = CleanCoordinator()
		cleanCoordinator.finishDelegate = self
		cleanCoordinator.parentCoordinator = self
		cleanCoordinator.start()
		addChildCoordinator(cleanCoordinator)

		path = [.mainTab(themeCoordinator, cleanCoordinator)]
	}

	func showAuth() {
		childCoordinators.removeAll()

		let authCoordinator = AuthCoordinator()
		authCoordinator.finishDelegate = self
		authCoordinator.parentCoordinator = self
		authCoordinator.start()
		addChildCoordinator(authCoordinator)

		path = [.auth(authCoordinator)]
	}
}

// MARK: - CoordinatorFinishDelegate

extension AppCoordinator: CoordinatorFinishDelegate {
	func didFinish(coordinator: ICoordinatorCycle) {
		removeChildCoordinator(coordinator)
		withAnimation(.easeInOut) {
			start()
		}
	}
}
