//
//  ICoordinatorView.swift
//  Sandbox
//
//  Created by Dima Disavle on 04.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Протокол для декларативного коорданатора.
protocol ICoordinatorView: ObservableObject {
	/// Для перечисления экранов сцены.
	associatedtype CoordinatorSceneState: Identifiable
	/// Для отображения экрана.
	associatedtype CoordinatorScene: View

	/// Путь по стеку.
	var path: [CoordinatorSceneState] { get set }
	/// Ботомшит.
	var sheet: CoordinatorSceneState? { get set }
	/// Отображение через полный экран.
	var fullScreen: CoordinatorSceneState? { get set }

	/// Создать отображение сцены.
	/// - Parameter view: Отображение экрана.
	/// - Returns: Сцена.
	@ViewBuilder
	func build(_ view: CoordinatorSceneState) -> CoordinatorScene
}

extension ICoordinatorView {
	/// Перейти на экран.
	/// - Parameter view: Отображение экрана.
	func push(_ view: CoordinatorSceneState) {
		path.append(view)
	}

	/// Показать ботомшит.
	/// - Parameter view: Отображение экрана.
	func present(sheet view: CoordinatorSceneState) {
		sheet = view
	}

	/// Показать на полный экран..
	/// - Parameter view: Отображение экрана.
	func present(fullScreen view: CoordinatorSceneState) {
		fullScreen = view
	}

	/// Вернуться назад.
	func pop() {
		path.removeLast()
	}

	/// Вернуться к рутовому экрану.
	func popToRoot() {
		path.removeLast(path.count)
	}

	/// Скрыть ботомшит.
	func dismissSheet() {
		sheet = nil
	}

	/// Скрыть полный экран.
	func dismissFullScreen() {
		fullScreen = nil
	}
}
