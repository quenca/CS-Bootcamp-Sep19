//
//  MainView.swift
//  CS-Bootcamp-Sep19
//
//  Created by User02 on 16/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func didButtonDetail()
}

// categories

class MainView: UIView {
    weak var delegate: MainViewDelegate?

    let contentLayoutData = ContentLayoutData()
    var dataSource: MainDataSource?

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.backgroundView = UIView(frame: .zero)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.accessibilityLabel = "mainCollection"
        return collectionView
    }()

    let backgroundView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fundo")
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        dataSource = MainDataSource(collectionView: collectionView, cards: ["Card"])
        configure()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        collectionView.delegate = self
        collectionView.dataSource = dataSource
    }
}

extension MainView: ViewCodable {
    func buildHierarchy() {
        addSubview(backgroundView)
        addSubview(collectionView)
    }

    func buildContraints() {

        backgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func buildAdditionalConfiguration() {
    }
}

// MARK: - Delegate

extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didButtonDetail()
    }
}

// MARK: - Flow Layout

extension MainView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height2 = collectionView.frame.height * 0.25
        let width2 = (collectionView.frame.width * 0.33) -
            contentLayoutData.leftEdgeInsetConstant -
            contentLayoutData.rightEdgeInsetConstant
        return CGSize(width: width2, height: height2)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: contentLayoutData.topEdgeInsetConstant,
                            left: contentLayoutData.leftEdgeInsetConstant,
                            bottom: contentLayoutData.bottomEdgeInsetConstant,
                            right: contentLayoutData.rightEdgeInsetConstant)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return contentLayoutData.spaceBetweenItemsConstant
    }
}
