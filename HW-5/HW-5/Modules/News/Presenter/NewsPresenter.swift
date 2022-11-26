//
//  NewsPresenter.swift
//  HW-5
//
//  Created Сергей Абросов on 21.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsModuleInput: AnyObject {

}

protocol NewsModuleOutput: AnyObject {

}

final class NewsPresenter {

  // MARK: - Properties
    
    internal var newsList: [NewInfo] {
        get {
            getArrayOfNewCells()
        }
    }

  weak var view: NewsViewInput?
  var router: NewsRouterInput?
  weak var output: NewsModuleOutput?
}

// MARK: - NewsViewOutput

extension NewsPresenter: NewsViewOutput {
    func didSelectCell(index: Int) {
        router?.showNews(model: newsList[index])
    }

    func viewDidLoad() {

    }
    

}

// MARK: - NewsInput

extension NewsPresenter: NewsModuleInput {

}

extension NewsPresenter {
    private func getArrayOfNewCells() -> [New] {
        let new1 = New(title: "Mr. Krabs", image: UIImage(named: "mister-krabs")!, text: "Today Mr. Krabs earned 100$")
//        let new2 = New(title: "mister crabs", image: UIImage(named: "mister-crabs")!, text: "today mister crabs erned 100$")
//        let new3 = New(title: "mister crabs", image: UIImage(named: "mister-crabs")!, text: "today mister crabs erned 100$")
//        let new4 = New(title: "mister crabs", image: UIImage(named: "mister-crabs")!, text: "today mister crabs erned 100$")
//        let new5 = New(title: "mister crabs", image: UIImage(named: "mister-crabs")!, text: "today mister crabs erned 100$")
//        let new6 = New(title: "mister crabs", image: UIImage(named: "mister-crabs")!, text: "today mister crabs erned 100$")
        
        return [new1, new1, new1, new1, new1, new1]
    }
}
