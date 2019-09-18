//
//  Coordinator.swift
//  CS-Bootcamp-Sep19
//
//  Created by User02 on 16/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

protocol Coordinator {
    var rootViewController: UIViewController { get }
    func start()
}
