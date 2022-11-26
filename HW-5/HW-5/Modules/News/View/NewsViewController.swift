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
    
    func didSelectCell(index: Int)
    
    var newsList: [New] { get }
}

final class NewsViewController: UIViewController, ModuleTransitionable {
    // MARK: - Outlets
    
    private var mainTableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.rowHeight = 200
        return tableView
    }()
        
    struct NameOfCells {
        static let newCell = "NewCell"
    }
    
    // MARK: - Properties
    
    var output: NewsViewOutput?
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemRed
        
        output?.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Actions
    
    @objc
    private func rightItemTapped() {
        
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        
        // MARK: - NewsViewController
        
        title = "News"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "refresh-icon"), style: .done, target: self, action: #selector(rightItemTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.counterclockwise"), style: .done, target: self, action: #selector(rightItemTapped))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .done, target: self, action: #selector(rightItemTapped))
        
        // MARK: - Constraints
        
        makeConstraints()
        
        // MARK: - newsList
        
        // MARK: - mainTableView
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(NewTableCell.self, forCellReuseIdentifier: NameOfCells.newCell)
        
    }
    
    private func setupLocalization() {
        
    }
}

// MARK: - Main Setup

extension NewsViewController {
    func makeConstraints() {
        // MARK: - mainTableView
        self.view.addSubview(mainTableView)
        
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
        let selectedCell = indexPath.row
    
//        navigationController?.pushViewController(NewViewController(), animated: true)
        output?.didSelectCell(index: selectedCell)
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.newsList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NameOfCells.newCell) as! NewTableCell
        let new = output?.newsList[indexPath.row]
         
        cell.set(new: new!)

        return cell
    }
}

// MARK: - Info for newCells in TableView

extension NewsViewController {
    
}
