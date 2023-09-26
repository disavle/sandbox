//
//  ICoordinatorCycle.swift
//  Sandbox
//
//  Created by Dima Disavle on 04.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Протокол для цикла координатора.
protocol ICoordinatorCycle: AnyObject {
	/// Родительский координатор.
	var parentCoordinator: (any ICoordinatorCycle)? { get set }
	/// Дочернии координаторы.
	var childCoordinators: [any ICoordinatorCycle] { get set }

	/// Добавить дочерний координатор.
	/// - Parameter coordinator: Дочерний координатор.
	func addChildCoordinator(_ coordinator: ICoordinatorCycle)
}

// MARK: - Реализация ICoordinator

/// Дефолтная реализация методов навигации.
extension ICoordinatorCycle {
	/// Добавить дочерний координатор.
	/// - Parameter coordinator: Дочерний координатор.
	func addChildCoordinator(_ coordinator: ICoordinatorCycle) {
		childCoordinators.removeAll()
		childCoordinators.append(coordinator)
	}
}
