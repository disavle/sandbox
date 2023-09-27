//
//  CoordinatorView.swift
//  Sandbox
//
//  Created by Dima Disavle on 26.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Отображение координатора.
struct CoordinatorView<Coordinator: ICoordinator>: View {
	@StateObject var coordinator: Coordinator

	var body: some View {
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
