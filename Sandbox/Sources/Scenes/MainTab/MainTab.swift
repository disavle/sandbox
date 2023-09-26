//
//  MainTab.swift
//  Sandbox
//
//  Created by Dima Disavle on 26.09.2023.
//  Copyright © 2023 Disavle. All rights reserved.
//

import SwiftUI

/// Таббар приложения.
struct MainTab: View {
	var firstTab: ThemeViewView
	var secondTab: CleanView

	var body: some View {
		TabView {
			firstTab
				.tabItem {
					Label("first", systemImage: "house")
				}
			secondTab
				.tabItem {
					Label("second", systemImage: "bell")
				}
		}
	}
}
