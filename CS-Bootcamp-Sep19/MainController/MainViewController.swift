//
//  ViewController.swift
//  CS-Bootcamp-Sep19
//
//  Created by User01 on 16/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func showDetail()
}

class MainViewController: UIViewController {

    weak var delegate: MainViewControllerDelegate?

    lazy var mainView = MainView(frame: .zero)

    override func loadView() {
        mainView.delegate = self
        self.view = mainView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func setupNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
}

extension MainViewController: MainViewDelegate {
    func didButtonDetail() {
        delegate?.showDetail()
    }
}
