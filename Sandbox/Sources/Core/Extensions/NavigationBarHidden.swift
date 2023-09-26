//
//  NavigationBarHidden.swift
//  Sandbox
//
//  Created by Dima Disavle on 26.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Стратегия для скрытия навигационного бара.
struct NavigationBarHidden: ViewModifier {
	func body(content: Content) -> some View {
		if #available(iOS 16.0, *) {
			content
				.toolbar(.hidden, for: .automatic)
		} else {
			content
				.navigationBarHidden(true)
		}
	}
}
