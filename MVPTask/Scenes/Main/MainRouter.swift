//
//  MainRouter.swift
//  DelegatesMVP
//
//  Created by Nour Abukhaled on 7/31/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

protocol MainRoutable {

    func showList(items: [String])
 }

class MainRouter: MainRoutable {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        
        self.viewController = viewController
    }
    
    func showList(items: [String]) {
        
        let storyboard = UIStoryboard(name: Constants.StoryboardName.list, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: Constants.StoryboardID.list) as! ListViewController
        
        controller.configurator = ListConfigurator(items: items)
        
        viewController?.navigationController?.pushViewController(controller, animated: true)
        
    }
    
}

