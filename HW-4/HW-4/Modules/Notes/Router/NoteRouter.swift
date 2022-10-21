import UIKit

protocol NoteRouterInput {

}

final class NoteRouter {

  // MARK: - Properties

  weak var view: ModuleTransitionable?
}

// MARK: - NoteRouterInput

extension NoteRouter: NoteRouterInput {

}

