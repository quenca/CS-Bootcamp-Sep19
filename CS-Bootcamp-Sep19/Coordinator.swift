//
//  Coordinator.swift
//  CS-Bootcamp-Sep19
//
//  Created by User02 on 16/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import Foundation

protocol Coordinator {
    var rootViewController: MainViewController { get }
    func start()
}

