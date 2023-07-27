//
//  AppCoordinator.swift
//  Sandbox
//
//  Created by Dima Disavle on 27.07.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

protocol ICoordinator: ObservableObject {
	associatedtype CoordinatorSceneState: Identifiable &
	RawRepresentable where CoordinatorSceneState.RawValue: StringProtocol
	associatedtype CoordinatorScene: View
	var path: [CoordinatorSceneState] { get set }
	var sheet: CoordinatorSceneState? { get set }
	var fullScreen: CoordinatorSceneState? { get set }
	func build(_ view: CoordinatorSceneState) -> CoordinatorScene
}

extension ICoordinator {
	func push(_ view: CoordinatorSceneState) {
		path.append(view)
	}

	func present(sheet view: CoordinatorSceneState) {
		sheet = view
	}

	func present(fullScreen view: CoordinatorSceneState) {
		fullScreen = view
	}

	func pop() {
		path.removeLast()
	}

	func popToRoot() {
		path.removeLast(path.count)
	}

	func dismissSheet() {
		sheet = nil
	}

	func dismissFullScreen() {
		fullScreen = nil
	}
}


enum ViewScene: String, Identifiable {
	var id: String {
		self.rawValue
	}
	case content
	case cleanView
}

final class AppCoordinator: ICoordinator {
	typealias CoordinatorSceneState = ViewScene
	@Published var path: [CoordinatorSceneState] = [.cleanView]
	@Published var sheet: CoordinatorSceneState?
	@Published var fullScreen: CoordinatorSceneState?

	@ViewBuilder
	func build(_ view: CoordinatorSceneState) -> some View {
		switch view {
		case .content:
			ContentView()
		case .cleanView:
			CleanView().assembly(
				inputModel: CleanModel.InputModel(name: "Дима", age: 21),
				outputModel: CleanModel.OutputModel {
					self.push(.content)
				}
			)
		}
	}
}

struct AppCoordinatorView: View {
	@StateObject var coordinator: AppCoordinator

	var body: some View {
		NavigationView {
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
}


// MARK: - Support for NStack.

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
