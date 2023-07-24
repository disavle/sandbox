//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import SwiftUI

// MARK: - I___FILEBASENAMEASIDENTIFIER___.
/// Протокол отображения сцены ___VARIABLE_documentationSceneName___.
protocol I___FILEBASENAMEASIDENTIFIER___ {
	/// Рендер отображения.
	/// - Parameter props: Модель данных для отображения.
	func render(_ props: ___VARIABLE_sceneName___Model.Main.Props)
}

// MARK: - ___FILEBASENAMEASIDENTIFIER___.
/// Отображение сцены ___VARIABLE_documentationSceneName___.
struct ___FILEBASENAMEASIDENTIFIER___: View {
	// MARK: Dependencies.
	/// Модель данных для отображения.
	@ObservedObject private var viewModel = ___FILEBASENAMEASIDENTIFIER___Model()
	/// Интерактор.
	var interactor: I___VARIABLE_sceneName___Interactor!
	
	// MARK: View.
	var body: some View {
		NavigationView {
		}
		.onAppear {
			interactor.start(___VARIABLE_sceneName___Model.Main.Request())
		}
	}
}

// MARK: - I___FILEBASENAMEASIDENTIFIER___ implementation.
extension ___FILEBASENAMEASIDENTIFIER___: I___FILEBASENAMEASIDENTIFIER___ {
	/// Рендер отображения.
	/// - Parameter props: Модель данных для отображения.
	func render(_ props: ___VARIABLE_sceneName___Model.Main.Props) {
		viewModel.props = props
	}
}

// MARK: - ViewModel для биндинга.
extension ___FILEBASENAMEASIDENTIFIER___ {
	/// Модель для обновления UI.
	final class ___FILEBASENAMEASIDENTIFIER___Model: ObservableObject {
		@Published var props: ___VARIABLE_sceneName___Model.Main.Props = .initial
	}
}

// MARK: - Preview.
/// Вспомогательная функция для превью верстки.
struct ___FILEBASENAMEASIDENTIFIER____Previews: PreviewProvider {
	static var previews: some View {
		___FILEBASENAMEASIDENTIFIER___()
	}
}
