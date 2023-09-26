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
			AppCoordinatorView(coordinator: appCoordinator)
				.onChange(of: scenePhase) { newPhase in
					if newPhase == .active, !check() {
						appCoordinator.showAuth()
					}
				}
		}
	}
	// TODO: Вынести в чекер.
	private func check() -> Bool {
		// Auth
		guard true else { return false }
		// Network
		guard true else { return false }
		return true
	}
}
