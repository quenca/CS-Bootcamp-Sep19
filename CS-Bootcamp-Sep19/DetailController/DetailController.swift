//
//  DetailController.swift
//  CS-Bootcamp-Sep19
//
//  Created by User02 on 17/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

protocol DismissControllerDelegate: MainViewControllerDelegate {
    func back()
}

class DetailController: UIViewController {

   weak var delegate: DismissControllerDelegate?

  // weak var backViewDelegate: DismissControllerDelegate?

   lazy var detailView = DetailView(frame: .zero)

    override func loadView() {
         self.view = detailView
         view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }

   lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    func setupNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)

        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }

    @objc
    func back() {
        delegate?.back()
    }
}

extension DetailController: MainViewDelegate {
    func didButtonDetail() {
        delegate?.showDetail()
    }
}
