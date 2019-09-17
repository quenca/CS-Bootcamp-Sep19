//
//  ViewController.swift
//  CS-Bootcamp-Sep19
//
//  Created by User01 on 16/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func loadView() {
        view = MainView(frame: .zero)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }

    func setupNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
}
