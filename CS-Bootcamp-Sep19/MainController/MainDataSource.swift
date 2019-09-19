//
//  MainDataSource.swift
//  CS-Bootcamp-Sep19
//
//  Created by User02 on 19/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

import UIKit

// TO DO: Separate Data Source from the MainViews

class MainDataSource: NSObject, UICollectionViewDataSource {
    private let cardId: String = "cardId"
    private let headerId: String = "headerId"

    var cards: [String]?

    init(collectionView: UICollectionView, cards: [String]) {
        self.cards = cards
        super.init()
        register(in: collectionView)
    }

    func register(in collectionView: UICollectionView) {
       collectionView.register(CardCell.self, forCellWithReuseIdentifier: cardId)
       collectionView.register(SectionHeader.self,
                                forSupplementaryViewOfKind:
            UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerId)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cardId, for: indexPath) as? CardCell {
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if let sectionHeader =
                collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                withReuseIdentifier: headerId,
                                                                for: indexPath) as? SectionHeader {
                return sectionHeader
            }
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}
