//
//  NewPresenter.swift
//  HW-5
//
//  Created Сергей Абросов on 21.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol NewModuleInput: AnyObject {
    //func setModel(_ model: News)
}

protocol NewModuleOutput: AnyObject {
    
}

final class NewPresenter {
    
    // MARK: - Properties
    
    weak var view: NewViewInput?
    var router: NewRouterInput?
    weak var output: NewModuleOutput?
    
}

// MARK: - NewViewOutput

extension NewPresenter: NewViewOutput {
    
    func viewDidLoad() {
        
    }
}

// MARK: - NewInput

extension NewPresenter: NewModuleInput {
    // вызовется раньше чем вью дид лоэд 
//    func setModel(_ model: News) {
//        print(model)
//    }
    
}
