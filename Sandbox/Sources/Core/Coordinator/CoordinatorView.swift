//
//  CoordinatorView.swift
//  Sandbox
//
//  Created by Dima Disavle on 26.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Отображение координатора.
struct CoordinatorView<Coordinator: ICoordinator>: View {
	@StateObject var coordinator: Coordinator

	var body: some View {
		strategyNavigationStack()
			.ignoresSafeArea()
			.onAppear {
				coordinator.start()
			}
	}

	// TODO: При переходе на минимальную версию 16 удалить стратегию.

	/// Стратегия для решения проблем навигации на разных версиях.
	/// - Returns: Стек навигации.
	@ViewBuilder
	private func strategyNavigationStack() -> some View {
		if #available(iOS 16.0, *) {
			NavigationStack {
				getNStack()
			}
		} else {
			NavigationView {
				getNStack()
			}
			.navigationViewStyle(.stack)
		}
	}

	/// Функция для решения DRY.
	/// Пока минимальная версия не 16 iOS - workaround
	/// - Returns: NStack.
	private func getNStack() -> NStack<Coordinator.CoordinatorSceneState, some View> {
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
