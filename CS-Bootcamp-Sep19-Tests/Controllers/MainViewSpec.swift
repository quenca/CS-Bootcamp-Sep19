//
//  MainViewSpec.swift
//  CS-Bootcamp-Sep19-Tests
//
//  Created by User02 on 18/09/19.
//  Copyright © 2019 User01. All rights reserved.
//

@testable import CS_Bootcamp_Sep19
import Quick
import Nimble
import Nimble_Snapshots

class MainViewSpec: QuickSpec {

        override func spec() {
            describe("MainView") {

                var coordinator: Coordinator?

                beforeEach {
                    var window: UIWindow?
                    coordinator = MainCoordinator(window: &window)
                    coordinator?.start()
                    coordinator!.rootViewController.beginAppearanceTransition(true, animated: false)
                    coordinator!.rootViewController.endAppearanceTransition()
                }
                afterEach {
                }

                context("When collecionView is typed") {
                    it("Should call detail view") {
                    if  let controller = coordinator!.rootViewController as? UINavigationController {
                        if let main = controller.topViewController as? MainViewController {
                        expect(main) == recordSnapshot()
                        }
                        }
                    }
                }
            }
        }
}
