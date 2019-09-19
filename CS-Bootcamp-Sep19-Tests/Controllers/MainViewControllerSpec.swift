//
//  MainViewControllerSpec.swift
//  CS-Bootcamp-Sep19-Tests
//
//  Created by User02 on 18/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

@testable import CS_Bootcamp_Sep19
import Quick
import Nimble
import Nimble_Snapshots
import KIF

class MainViewControllerSpec: QuickSpec {

     override func spec() {
        let  mainView = MainView()
        var coordinator: Coordinator?

        beforeEach {
            var window: UIWindow?
            coordinator = MainCoordinator(window: &window)
            coordinator?.start()
            coordinator!.rootViewController.beginAppearanceTransition(true, animated: false)
            coordinator!.rootViewController.endAppearanceTransition()
        }

        afterEach {
            UIApplication.shared.keyWindow?.rootViewController = UIViewController()
        }

        describe("MainViewController") {
             context("When collecionView is typed") {
//                if let collectionView = self.tester.waitForView(wit: "mainCollection") as? UICollectionView{
//                    self.tester.tapItem(at: IndexPath(row: 0, section: 0), in: collectionView)
//                    expect(mainView.collectionView).to(recordSnapshot())
//                }
        }
    }
}
}
