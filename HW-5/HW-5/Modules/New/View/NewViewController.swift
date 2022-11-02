//
//  NewViewController.swift
//  HW-5
//
//  Created Сергей Абросов on 21.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewViewInput: AnyObject {
    //var model: News { get set }
}

protocol NewViewOutput: AnyObject {
    func viewDidLoad()
}


final class NewViewController: UIViewController, ModuleTransitionable {
    
    // MARK: - Outlets
    //private var content: News(
    
    // MARK: - Properties
    
    var output: NewViewOutput?
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
    
    // MARK: - Actions
    
    
    // MARK: - Setup
    
    private func setupUI() {
        
    }
    
    private func setupLocalization() {
        
    }
}

// MARK: - TroikaServiceViewInput

extension NewViewController: NewViewInput {
    
}
