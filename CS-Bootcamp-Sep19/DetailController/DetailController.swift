//
//  DetailController.swift
//  CS-Bootcamp-Sep19
//
//  Created by User02 on 17/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

protocol DismissControllerDelegate: AnyObject {
    func back()
}

class DetailController: UIViewController {

   weak var delegate: MainViewControllerDelegate?

   weak var backViewDelegate: DismissControllerDelegate?

   lazy var detailView = DetailView(frame: .zero)

    override func loadView() {
         self.view = detailView
         view.backgroundColor = .white
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

        let backButton: UIButton = {
            let button = UIButton()
            button.setTitle("X", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)

        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }

    @objc
    func back() {
        backViewDelegate?.back()
    }
}

extension DetailController: MainViewDelegate {
    func didButtonDetail() {
        delegate?.showDetail()
    }
}
