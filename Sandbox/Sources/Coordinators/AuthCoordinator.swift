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
			AuthView().assembly(inputModel: .init(), outputModel: .init(showRecurse: {
				self.showRecurse()
			}))
		}
	}

	func start() {
		path = [.start]
	}

	func showRecurse() {
		push(.start)
	}
}

// MARK: - AuthCoordinatorView
/// Отображение Координатор авторизации.
struct AuthCoordinatorView: View {
	@StateObject var coordinator: AuthCoordinator

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
