//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import SwiftUI

extension ___VARIABLE_sceneName___View {
	/// Собрать сцену ___VARIABLE_documentationSceneName___.
	/// - Parameters:
	///   - inputModel: Входная модель данных.
	///   - outputModel: Выходная модель данных.
	/// - Returns: ___VARIABLE_sceneName___View.
	func assembly(inputModel: ___VARIABLE_sceneName___Model.InputModel, outputModel: ___VARIABLE_sceneName___Model.OutputModel) -> some View {
		var view = self
		
		let presenter: I___VARIABLE_sceneName___Presenter = ___VARIABLE_sceneName___Presenter(view: view)
		
		let interactor: I___VARIABLE_sceneName___Interactor = ___VARIABLE_sceneName___Interactor(
			presenter: presenter,
			inputModel: inputModel,
			outputModel: outputModel
		)
		
		view.interactor = interactor
		
		return view
	}
}
