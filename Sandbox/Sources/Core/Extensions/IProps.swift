//
//  IProps.swift
//  Sandbox
//
//  Created by Dima Disavle on 26.08.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import Foundation

/// Протокол для входных данных отображения.
protocol IProps {
	associatedtype Props: ObservableObject
	var props: Props { get set }
}
