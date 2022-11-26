//
//  NewPresenter.swift
//  HW-5
//
//  Created Сергей Абросов on 21.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol NewModuleInput: AnyObject {
    // здесь будут функции, которые будут вызываться старым модулем у нового модуля (текущего модуля)
    
    func setModel(_ model: NewInfo)
}

protocol NewModuleOutput: AnyObject {
    // если мы что то меняем в ТЕКУЩЕМ модуле, то мы это передаем в ПРЕДЫДУЩИЙ МОДУЛЬ (любой котрый задам аутпут делегатом) который положу в аутпут тот и будет вызываться
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
    func setModel(_ model: NewInfo) {
        print(model)
    }
}
