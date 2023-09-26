//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import SwiftUI

/// ___VARIABLE_documentationCoordinatorName___.
final class ___VARIABLE_coordinatorName___Coordinator: ICoordinator {
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
		case show
	}
	
	/// Билдер для экрана.
	/// - Parameter view: Экран ViewScene.
	/// - Returns: Экран для отображения.
	@ViewBuilder
	func build(_ view: ViewScene) -> some View {
		switch view {
		case .start:
			// Вызвать другой координатор или начальную сцену.
			EmptyView()
		case .show:
			// Вызвать другой координатор или сцену.
			EmptyView()
		}
	}
	
	func start() {
		path = [.start]
	}
	
	func show() {
		path = [.show]
	}
}

