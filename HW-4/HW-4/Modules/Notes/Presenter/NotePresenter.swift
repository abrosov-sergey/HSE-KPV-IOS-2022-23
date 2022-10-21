protocol NoteModuleInput: AnyObject {

}

protocol NoteModuleOutput: AnyObject {

}

final class NotePresenter {

  // MARK: - Properties

  weak var view: NoteViewInput?
  var router: NoteRouterInput?
  weak var output: NoteModuleOutput?
}

// MARK: - NoteViewOutput

extension NotePresenter: NoteViewOutput {

  func viewDidLoad() {

  }
}

// MARK: - NoteInput

extension NotePresenter: NoteModuleInput {

}
