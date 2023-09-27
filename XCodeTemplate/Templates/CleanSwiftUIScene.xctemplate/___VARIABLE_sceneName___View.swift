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
	@ObservedObject var props: ___FILEBASENAMEASIDENTIFIER___.Props = .initial
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
		self.props.example = props.example
	}
}

// MARK: - IProps.
extension ___FILEBASENAMEASIDENTIFIER___: IProps {
	@MainActor
	final class Props: ObservableObject {
		@Published var example: String = ""
		
		static let initial = Props()
	}
}

// MARK: - Preview.
#if DEBUG
/// Вспомогательная функция для превью верстки.
struct ___FILEBASENAMEASIDENTIFIER____Previews: PreviewProvider {
	static var previews: some View {
		___FILEBASENAMEASIDENTIFIER___()
	}
}
#endif
