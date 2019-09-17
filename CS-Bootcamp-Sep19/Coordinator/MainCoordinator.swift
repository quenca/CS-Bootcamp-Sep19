//
//  MainCoordinator.swift
//  CS-Bootcamp-Sep19
//
//  Created by User02 on 16/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var rootViewController: UIViewController
    var navigationController: UINavigationController {
        if let root = rootViewController as? UINavigationController {
            return root
        } else {
            return UINavigationController()
        }
    }

    private let window: UIWindow

    init(window: inout UIWindow?) {
        let navigation = UINavigationController()
        rootViewController = navigation
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.rootViewController = self.rootViewController
        window = self.window
    }

    func start() {
        let controller = MainViewController()
        navigationController.pushViewController(controller, animated: true)
        self.window.makeKeyAndVisible()
    }
}
