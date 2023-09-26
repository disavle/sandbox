//
//  NStack.swift
//  Sandbox
//
//  Created by Dima Disavle on 04.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Структура аналог NavigationStack iOS16.
struct NStack<Screen, ScreenView: View>: View {
	@Binding var path: [Screen]
	@ViewBuilder var buildView: (Screen) -> ScreenView

	var body: some View {
		path
			.enumerated()
			.reversed()
			.reduce(NavigationNode<Screen, ScreenView>.end) { pushedNode, new in
				let (index, screen) = new
				return NavigationNode<Screen, ScreenView>.view(
					buildView(screen),
					pushing: pushedNode,
					stack: $path,
					index: index
				)
			}
	}
}

/// Единица стека навигации.
indirect enum NavigationNode<Screen, ScreenView: View>: View {
	case view(ScreenView, pushing: NavigationNode<Screen, ScreenView>, stack: Binding<[Screen]>, index: Int)
	case end

	var body: some View {
		if case .view(let view, let pushedNode, let stack, let index) = self {
			view.background(
				NavigationLink(
					destination: pushedNode,
					isActive: Binding(
						get: {
							if case .end = pushedNode {
								return false
							}
							return stack.wrappedValue.count > index + 1
						},
						set: { isPushed in
							guard !isPushed else { return }
							stack.wrappedValue = Array(stack.wrappedValue.prefix(index + 1))
						}),
					label: EmptyView.init
				).hidden()
			)
		} else {
			EmptyView()
		}
	}
}
