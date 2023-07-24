//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

/// Модель сцены ___VARIABLE_documentationSceneName___.
enum ___FILEBASENAMEASIDENTIFIER___ {
	/// Входная модель сцены ___VARIABLE_documentationSceneName___.
	struct InputModel { }
	
	/// Выходная модель сцены ___VARIABLE_documentationSceneName___.
	struct OutputModel { }
	
	/// Модели данных VIP цикла.
	enum Main {
		/// Данные получаемые из View.
		struct Request { }
		
		/// Данные получаемые из Interactor.
		struct Response { }
		
		/// Данные получаемые из Presenter.
		struct Props {			
			static let initial = Props()
		}
	}
}
