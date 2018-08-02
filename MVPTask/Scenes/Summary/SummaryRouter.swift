//
//  SummaryRouter.swift
//  MVP
//
//  Created by Admin user on 7/30/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

protocol summaryRoutable {
    
    func backToLogin()
}

class summaryRouter: summaryRoutable {
 
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController ) {
        
        self.viewController = viewController
    }
    
    func backToLogin() {
        
        viewController?.navigationController?.popViewController(animated: true)
    }
}
