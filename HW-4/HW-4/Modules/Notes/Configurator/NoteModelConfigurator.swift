import UIKit

final class NoteModuleConfigurator {

  // MARK: - Configure

  func configure(
    output: NoteModuleOutput? = nil
  ) -> (
    view: NoteViewController,
    input: NoteModuleInput
  ) {
    let view = NoteViewController()
    let presenter = NotePresenter()
    let router = NoteRouter()

    presenter.view = view
    presenter.router = router
    presenter.output = output

    router.view = view

    view.output = presenter

    return (view, presenter)
  }
}

