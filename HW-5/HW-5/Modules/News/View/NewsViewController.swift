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
        tableView.register(NewTableCell.self, forCellReuseIdentifier: NameOfCells.newCell)
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
        
        output?.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Actions
    
    
    // MARK: - Setup
    
    private func setupUI() {
        
        // MARK: - NewsViewController
        
        title = "News"
        
        // MARK: - Constraints
        
        makeConstraints()
        
        // MARK: - mainTableView
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        // MARK: - newsList
        
        newsList = getArrayOfNewCells()
    }
    
    private func setupLocalization() {
        
    }
}

// MARK: - Main Setup

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
        let new1 = New(title: "mister crabs", image: UIImage(named: "mister-crabs")!, text: "today mister crabs erned 100$")
        let new2 = New(title: "mister crabs", image: UIImage(named: "mister-crabs")!, text: "today mister crabs erned 100$")
        let new3 = New(title: "mister crabs", image: UIImage(named: "mister-crabs")!, text: "today mister crabs erned 100$")
        let new4 = New(title: "mister crabs", image: UIImage(named: "mister-crabs")!, text: "today mister crabs erned 100$")
        let new5 = New(title: "mister crabs", image: UIImage(named: "mister-crabs")!, text: "today mister crabs erned 100$")
        let new6 = New(title: "mister crabs", image: UIImage(named: "mister-crabs")!, text: "today mister crabs erned 100$")
        
        return [new1, new2, new3, new4, new5, new6]
    }
}
