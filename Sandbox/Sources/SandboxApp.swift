//
//  SandboxApp.swift
//  Sandbox
//
//  Created by Dima Disavle on 20.07.2023.
//

import SwiftUI

@main
struct SandboxApp: App {
	/// Жизненный цикл приложения.
	@Environment(\.scenePhase)
	private var scenePhase
	/// Координатор приложения.
	private let appCoordinator = AppCoordinator()

	var body: some Scene {
		WindowGroup {
			CoordinatorView(coordinator: appCoordinator)
		}
		.onChange(of: scenePhase) { newPhase in
			// Приложение стало активным.
			guard newPhase == .active else { return }
			check()
		}
	}

	// TODO: Вынести в чекер.
	private func check() {
		// Auth
		guard false else {
			appCoordinator.showAuth()
			return
		}
		// Network
		guard true else { return }
		// Координатор еще не стартовал.
		guard appCoordinator.path.isEmpty else { return }
		appCoordinator.start()
	}
}
