//
//  ListRouter.swift
//  MVPTask
//
//  Created by Admin user on 8/1/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

protocol ListRoutable {
    
   
    
}

class listRouter: ListRoutable {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController ) {
        
        self.viewController = viewController
    }
    
    
    
}
