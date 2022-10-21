//
//  NewsPresenter.swift
//  HW-5
//
//  Created Сергей Абросов on 21.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol NewsModuleInput: AnyObject {

}

protocol NewsModuleOutput: AnyObject {

}

final class NewsPresenter {

  // MARK: - Properties

  weak var view: NewsViewInput?
  var router: NewsRouterInput?
  weak var output: NewsModuleOutput?
}

// MARK: - NewsViewOutput

extension NewsPresenter: NewsViewOutput {

  func viewDidLoad() {

  }
}

// MARK: - NewsInput

extension NewsPresenter: NewsModuleInput {

}
