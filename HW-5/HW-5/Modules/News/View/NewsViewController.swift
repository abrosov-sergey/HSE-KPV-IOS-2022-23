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

  // MARK: - Properties

  var output: NewsViewOutput?

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

extension NewsViewController: NewsViewInput {

}
