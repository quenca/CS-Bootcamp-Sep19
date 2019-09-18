//
//  DetailView.swift
//  CS-Bootcamp-Sep19
//
//  Created by User02 on 17/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

protocol DetailViewDelegate: AnyObject {
    func didButtonDismiss()
}

class DetailView: UIView {

    let backgroundView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fundo")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
         image.image = UIImage(named: "fundo")
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailView: ViewCodable {
    func buildHierarchy() {
        addSubview(backgroundView)
        addSubview(imageView)
    }

    func buildContraints() {
        backgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        imageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 80).isActive = true
        imageView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -80).isActive = true
        imageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
    }

    func buildAdditionalConfiguration() {
    }
}
