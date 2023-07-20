//
//  ContentView.swift
//  Sandbox
//
//  Created by Dima Disavle on 20.07.2023.
//

import SwiftUI

struct ContentView: View {
	
	@State var appIcon: AppIcon = .light
	
	var body: some View {
		VStack{
			Text("Fuck SwiftUI!")
			HStack{
				Button(appIcon.buttonText) {
					changeTheme()
				}
				.padding(10)
				.foregroundColor(Color(UIColor.systemBackground))
				.background(Color(UIColor.label))
			}
			.clipShape(Capsule())
		}
	}
	
	private func changeTheme() {
		UIApplication.shared.setAlternateIconName(appIcon.rawValue) { error in
			if let error = error {
				print(error.localizedDescription)
			} else {
				print("Success!")
			}
		}
		if appIcon == .dark {
			appIcon = .light
			(UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = .dark
		} else{
			appIcon = .dark
			(UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = .light
		}
	}
	
}

enum Theme: String {
	case light, dark, system
	
	var uiInterfaceStyle: UIUserInterfaceStyle {
		switch self {
		case .light:
			return .light
		case .dark:
			return .dark
		case .system:
			return .unspecified
		}
	}
}

enum AppIcon: String {
	case dark
	case light
	
	var buttonText: String {
		switch self {
		case .dark:
			return "Dark"
		case .light:
			return "Light"
		}
	}
	
	var rawValue: String? {
		switch self {
		case .dark:
			return nil
		case .light:
			return "AppIconLight"
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

