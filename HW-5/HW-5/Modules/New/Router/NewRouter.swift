//
//  NewRouter.swift
//  HW-5
//
//  Created Сергей Абросов on 21.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol NewRouterInput {
    // то что презентер вызывает у роутера (наш презентер вызывает ттут функции)
}

final class NewRouter {

  // MARK: - Properties

  weak var view: ModuleTransitionable?
}

// MARK: - NewRouterInput

extension NewRouter: NewRouterInput {

}

