//
//  NewViewController.swift
//  HW-5
//
//  Created Сергей Абросов on 21.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewViewInput: AnyObject {
    // те функции, которые презентор будет вызывать у этого вью
    // обновить данные к примеру, то он вызовет их отсюда
    // презентер вызывает у эотго вью
    
    var str: String { get set }
//    var model: NewInfo { get set }
}

protocol NewViewOutput: AnyObject {
    // вью вызывает у презентера
    
    func viewDidLoad()
}


final class NewViewController: UIViewController, ModuleTransitionable {
    
    // MARK: - Outlets
    
    // MARK: - Properties
    
    private let newLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let newImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let newText: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    
    var output: NewViewOutput?
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        output?.viewDidLoad()
        
        print(str)
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
    var str: String {
        get {
            print("tapped str")
            return "111"
        }
        set {
            str = "191919"
            print(str)
        }
    }
    
//    var model: NewInfo {
//        set { init( }
//        get { return model }
//    }
}
