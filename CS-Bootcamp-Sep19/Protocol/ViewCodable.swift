//
//  ViewCodable.swift
//  CS-Bootcamp-Sep19
//
//  Created by User02 on 16/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import Foundation

protocol ViewCodable {
    func buildHierarchy()
    func buildContraints()
    func buildAdditionalConfiguration()
    func setupView()
}

extension ViewCodable {
    func setupView() {
        buildHierarchy()
        buildContraints()
        buildAdditionalConfiguration()
    }
}
