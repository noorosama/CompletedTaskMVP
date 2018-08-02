//
//  SummaryConfigurator.swift
//  MVP
//
//  Created by Nour Abukhaled on 7/30/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation

protocol SummaryConfigurable {
    
    func configure(summaryViewController: SummaryViewController)
}

class SummaryConfigurator: SummaryConfigurable {
    
    let fields: [String]
    
    init(fields: [String]) {
        
        self.fields = fields
    }
    
    func configure(summaryViewController: SummaryViewController) {
        
        let router = summaryRouter(viewController: summaryViewController)
        
        let presenter = SummaryPresenter(output: summaryViewController, fields: fields, router: router)
        
        summaryViewController.presenter = presenter
        
    }
    
}


