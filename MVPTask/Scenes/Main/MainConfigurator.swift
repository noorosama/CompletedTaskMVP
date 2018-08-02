//
//  MainConfigurator.swift
//  DelegatesMVP
//
//  Created by Nour Abukhaled on 7/31/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation



import Foundation

protocol MainConfigurable {

    func configure(mainViewController: MainViewController)
}

class MainConfigurator: MainConfigurable {

    func configure(mainViewController: MainViewController) {

        let router = MainRouter(viewController: mainViewController)

        let presenter = MainPresenter(output: mainViewController, router: router)

        mainViewController.presenter = presenter
    }

}

