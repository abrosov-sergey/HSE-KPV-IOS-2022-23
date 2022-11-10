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
        let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        tableView.rowHeight = 200
        return tableView
    }()
    
    private var newsList: [New] = []
    
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
        
        newsList = getArrayOfNewCells()
        
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
        print("tapped me")
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NameOfCells.newCell) as! NewTableCell
        let new = newsList[indexPath.row]
         
        cell.set(new: new)

        return cell
    }
}

// MARK: - Info for newCells in TableView

extension NewsViewController {
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
