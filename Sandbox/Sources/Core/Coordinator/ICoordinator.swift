//
//  ICoordinator.swift
//  Sandbox
//
//  Created by Dima Disavle on 04.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Протокол для координатора.
protocol ICoordinator: AnyObject {
	var finishDelegate: CordinatorFinishDelegate? { get set }
	/// Родительский координатор.
	var parentCoordinator: (any ICoordinator)? { get set }
	/// Дочернии координаторы.
	var childCoordinators: [any ICoordinator] { get set }

	/// Добавить дочерний координатор.
	/// - Parameter coordinator: Дочерний координатор.
	func addChildCoordinator(_ coordinator: ICoordinator)
	/// Начало сценария.
	func start()
	/// Завершение сценария.
	func finish()
}

// MARK: - Реализация ICoordinator

/// Дефолтная реализация методов навигации.
extension ICoordinator {
	/// Завершение сценария.
	func finish() {
		childCoordinators.removeAll()
		finishDelegate?.didFinish(coordinator: self)
	}

	/// Добавить дочерний координатор.
	/// - Parameter coordinator: Дочерний координатор.
	func addChildCoordinator(_ coordinator: ICoordinator) {
		childCoordinators.removeAll()
		childCoordinators.append(coordinator)
	}
}
