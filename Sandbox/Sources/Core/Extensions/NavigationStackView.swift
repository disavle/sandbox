//
//  NavigationStackView.swift
//  Sandbox
//
//  Created by Dima Disavle on 27.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Стратегия для навигационного стека при изменениях iOS 16.
struct NavigationStackView<Content: View>: View {
	@ViewBuilder var content: () -> Content
	var body: some View {
		if #available(iOS 16.0, *) {
			NavigationStack(root: content)
		} else {
			NavigationView(content: content)
				.navigationViewStyle(.stack)
		}
	}
}
