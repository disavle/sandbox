//
//  AuthCoordinator.swift
//  Sandbox
//
//  Created by Dima Disavle on 26.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Координатор авторизации.
final class AuthCoordinator: ICoordinator {
	@Published var path: [ViewScene] = []
	@Published var sheet: ViewScene?
	@Published var fullScreen: ViewScene?
	@Published var childCoordinators: [any ICoordinatorCycle] = []
	weak var parentCoordinator: (any ICoordinatorCycle)?
	weak var finishDelegate: CoordinatorFinishDelegate?

	/// Перечисление сцен.
	enum ViewScene: Identifiable {
		var id: UUID { return UUID() }
		case start
	}

	/// Билдер для экрана.
	/// - Parameter view: Экран ViewScene.
	/// - Returns: Экран для отображения.
	@ViewBuilder
	func build(_ view: ViewScene) -> some View {
		switch view {
		case .start:
			AuthView().assembly(inputModel: .init(), outputModel: .init(showRecurse: { [weak self] in
				self?.showRecurse()
			}))
		}
	}

	func start() {
		path = [.start]
	}

	func showRecurse() {
		finish()
	}
}
