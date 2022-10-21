//
//  NewsModuleConfigurator.swift
//  HW-5
//
//  Created Сергей Абросов on 21.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class NewsModuleConfigurator {

  // MARK: - Configure

  func configure(
    output: NewsModuleOutput? = nil
  ) -> (
    view: NewsViewController,
    input: NewsModuleInput
  ) {
    let view = NewsViewController()
    let presenter = NewsPresenter()
    let router = NewsRouter()

    presenter.view = view
    presenter.router = router
    presenter.output = output

    router.view = view

    view.output = presenter

    return (view, presenter)
  }
}

