//
//  NewsViewController.swift
//  HW-5
//
//  Created Сергей Абросов on 21.10.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsViewInput: AnyObject {
    
}

protocol NewsViewOutput: AnyObject {
    func viewDidLoad()
}

final class NewsViewController: UIViewController, ModuleTransitionable {
    // MARK: - Outlets
    
    private var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray
        tableView.rowHeight = 100
        return tableView
    }()
    
    private var newsList: [InfoCell]
    
    // MARK: - Properties
    
    var output: NewsViewOutput?
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        output?.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Actions
    
    
    // MARK: - Setup
    
    private func setupUI() {
        
        makeConstraints()
        
        // MARK: - mainTableView
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
    
    }
    
    private func setupLocalization() {
        
    }
}

// MARK: - Setup

extension NewsViewController {
    func makeConstraints() {
        // MARK: - mainTaibleView
        view.addSubview(mainTableView)
        
        mainTableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - ViewInput

extension NewsViewController: NewsViewInput {
    
}

// MARK: - Delegates for UITableView

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped me")
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        cell.textLabel?.text = "Hello, World!"
//
//        return cell
        
        return UITableViewCell()
    }
}
