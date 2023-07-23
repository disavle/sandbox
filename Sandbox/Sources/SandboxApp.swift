//
//  SandboxApp.swift
//  Sandbox
//
//  Created by Dima Disavle on 20.07.2023.
//

import SwiftUI

@main
struct SandboxApp: App {
	var body: some Scene {
		WindowGroup {
			CleanView().assembly(
				inputModel: CleanModel.InputModel(name: "Дима", age: 21),
				outputModel: CleanModel.OutputModel {
					print("Presenting second view.")
				}
			)
		}
	}
}
