//
//  ListPresenter.swift
//  MVPTask
//
//  Created by Admin user on 8/1/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation

protocol ListPresenterInput {
    
    func viewDidLoad()
    func configure(cell: listCellPresentable, at indexPath: IndexPath)
    func numberOfRows() -> Int
    
}

protocol ListPresenterOutput: class {
    
    
}

class ListPresenter: ListPresenterInput {
    
    
    weak var output: ListPresenterOutput?
    let items: [String]
    var router: ListRoutable?
    
    init(output: ListPresenterOutput,items: [String], router: ListRoutable ) {
        
        self.output = output
        self.items = items
        self.router = router
    }
    
    func viewDidLoad() {
        
        
    }
    
    func configure(cell: listCellPresentable, at indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        cell.displayLabel(text: item)
        
    }
    
    func numberOfRows() -> Int {
        
       return items.count
        
    }
    
}



