//
//  NewModuleConfigurator.swift
//  HW-5
//
//  Created Сергей Абросов on 21.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class NewModuleConfigurator {

  // MARK: - Configure

  func configure(
    output: NewModuleOutput? = nil
  ) -> (
    view: NewViewController,
    input: NewModuleInput
  ) {
    let view = NewViewController()
    let presenter = NewPresenter()
    let router = NewRouter()

    presenter.view = view
    presenter.router = router
    presenter.output = output

    router.view = view

    view.output = presenter

    return (view, presenter)
  }
}

