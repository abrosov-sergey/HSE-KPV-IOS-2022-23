import Foundation
import UIKit

protocol ModuleTransitionable: AnyObject {
  func showModule(_ module: UIViewController)
  func dismissView(animated: Bool, completion: (() -> Void)?)
  func dismissModal(animated: Bool, completion: (() -> Void)?) //dismiss all stack view controllers
  func dismissAndPresentModule(
    _ module: UIViewController,
    dismissAnimated dismiss: Bool,
    presentAnimated present: Bool,
    completion: (() -> Void)?
  )
  func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?)
  func pop(animated: Bool)
  func push(module: UIViewController, animated: Bool)
}

extension ModuleTransitionable where Self: UIViewController {

  func showModule(_ module: UIViewController) {
    self.show(module, sender: nil)
  }

  func dismissView(animated: Bool, completion: (() -> Void)?) {
    if let nav = navigationController, nav.viewControllers.count > 1 {
      nav.popViewController(animated: animated)
    } else {
      self.presentingViewController?.dismiss(animated: animated, completion: completion)
    }
  }

  func dismissModal(animated: Bool, completion: (() -> Void)?) {
    self.presentingViewController?.dismiss(animated: animated, completion: completion)
  }

  func dismissAndPresentModule(
    _ module: UIViewController,
    dismissAnimated dismiss: Bool = true,
    presentAnimated present: Bool = true,
    completion: (() -> Void)? = nil
  ) {
    let presenting = self.presentingViewController
    dismissModal(animated: dismiss) {
      presenting?.present(module, animated: present, completion: completion)
    }
  }

  func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?) {
    self.present(module, animated: animated, completion: completion)
  }

  func pop(animated: Bool) {
    self.navigationController?.popViewController(animated: animated)
  }

  func push(module: UIViewController, animated: Bool) {
    self.navigationController?.pushViewController(module, animated: animated)
  }
}
