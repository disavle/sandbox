//
//  CordinatorFinishDelegate.swift
//  Sandbox
//
//  Created by Dima Disavle on 04.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

/// Протокол делегата завершения сценария.
protocol CordinatorFinishDelegate: AnyObject {
	func didFinish(coordinator: any ICoordinator)
}
