//
//  NewsRouter.swift
//  HW-5
//
//  Created Сергей Абросов on 21.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol NewsRouterInput {
    func showNews(model: NewInfo)
}

final class NewsRouter {

  // MARK: - Properties

  weak var view: ModuleTransitionable?
}

// MARK: - NewsRouterInput

extension NewsRouter: NewsRouterInput {
    func showNews(model: NewInfo) {
        let module = NewModuleConfigurator().configure()
        module.input.setModel(model)
        view?.push(module: module.view, animated: true)
    }
}
