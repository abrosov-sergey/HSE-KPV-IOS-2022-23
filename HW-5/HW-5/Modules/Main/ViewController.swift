//
//  ViewController.swift
//  HW-5
//
//  Created by Сергей Абросов on 21.10.2022.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let newsButton: UIButton = {
        let button = UIButton()

        button.setImage(UIImage(named: "newspaper-svgrepo-com"), for: .normal)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Новости"
        
        view.backgroundColor = .systemGray
        
        makeConstraits()
        setupUI()
    }

    // MARK: - Actions
    
    @objc
    private func imageButtonPressed() {
        navigationController?.pushViewController(NewsViewController(), animated: true)
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        newsButton.addTarget(self, action: #selector(imageButtonPressed), for: .touchUpInside)
    }
}

extension ViewController {
    private func makeConstraits() {
        
        view.addSubview(newsButton)
        
        // MARK: - NewsButton
        
        newsButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 100.0, height: 100.0))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(50)
        }
    }
}
