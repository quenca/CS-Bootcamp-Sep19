//
//  SectionHeader.swift
//  CS-Bootcamp-Sep19
//
//  Created by User02 on 18/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {

    var label: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = UIColor.white.withAlphaComponent(0.75)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Criaturas"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SectionHeader: ViewCodable {
    func buildHierarchy() {
        addSubview(label)
    }

    func buildContraints() {
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    func buildAdditionalConfiguration() {
    }
}
