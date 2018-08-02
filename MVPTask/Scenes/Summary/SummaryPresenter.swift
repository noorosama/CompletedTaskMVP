//
//  SummaryPresenter.swift
//  MVP
//
//  Created by Admin user on 7/30/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation

protocol SummaryPresenterInput {
    
    func viewDidLoad()
    func configure(cell: SummaryCellPresentable, at indexPath: IndexPath)
    func configure(header: TableHeaderPresentable)
    func numberOfRows() -> Int
}

protocol SummaryPresenterOutput: class {
    
    
}

class SummaryPresenter: SummaryPresenterInput {
   
    
    weak var output: SummaryPresenterOutput?
    let fields: [String]
    var router: summaryRoutable?
    
    init(output: SummaryPresenterOutput, fields: [String],router: summaryRoutable) {
        
        self.output = output
        self.fields = fields
        self.router = router
    }
    
    func numberOfRows() -> Int {
        
        return fields.count
    }
    
    func viewDidLoad() {
        
       
      
    }
    
    func configure(cell: SummaryCellPresentable, at indexPath: IndexPath) {
        
        let item = fields[indexPath.row]
        cell.displayDescription(text: item)
        cell.displayValue(text: item)
        
    }
    
    func configure(header: TableHeaderPresentable) {
        
        header.displayHeader(text: LocalizationKeys.Headers.main.localized)
    }
    
}




