//
//  MainView.swift
//  CS-Bootcamp-Sep19
//
//  Created by User02 on 16/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    private let cellId = "cellId"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let view = UIView()
        view.backgroundColor = UIColor(patternImage: UIImage(named:"fundo")!)
        collectionView.backgroundView = view
        
        return collectionView
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fundo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let contentLayoutData = ContentLayoutData()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.delegate = self
        collectionView.dataSource = self 
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: cellId)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView: ViewCodable {
    func buildHierarchy() {
        addSubview(imageView)
        addSubview(collectionView)
    }
    
    func buildContraints() {
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func buildAdditionalConfiguration() {
        
    }
}

extension MainView: UICollectionViewDelegate {

}

extension MainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CardCell
        return cell
    }
}

extension MainView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height2 = collectionView.frame.height * 0.25
        let width2 = (collectionView.frame.width * 0.33) - contentLayoutData.leftEdgeInsetConstant - contentLayoutData.rightEdgeInsetConstant
        
        return CGSize(width: width2, height: height2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: contentLayoutData.topEdgeInsetConstant, left: contentLayoutData.leftEdgeInsetConstant, bottom: contentLayoutData.bottomEdgeInsetConstant, right: contentLayoutData.rightEdgeInsetConstant)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return contentLayoutData.spaceBetweenItemsConstant
    }
    
}
