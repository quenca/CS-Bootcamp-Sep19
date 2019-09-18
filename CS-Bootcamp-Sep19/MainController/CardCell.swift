//
//  CardCell.swift
//  CS-Bootcamp-Sep19
//
//  Created by User02 on 16/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {

    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardCell: ViewCodable {
    func buildHierarchy() {
        contentView.addSubview(imageView)
    }

    func buildContraints() {
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    func buildAdditionalConfiguration() {
    }
}
