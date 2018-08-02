//
//  MainPresenter.swift
//  DelegatesMVP
//
//  Created by Nour Abukhaled on 7/31/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation

protocol MainPresenterInput {
    
    func viewDidLoad()
    func numberOfRows() -> Int
    func configure(cell: mainCellPresentable, at indexPath: IndexPath)
    func configure(footer: TableFooterPresentable)
    func configure(header: TableHeaderPresentable)
    func submitButtonTapped()
    func textFieldTapped(text: String, at indexPath: IndexPath)
    func textFieldDidEndEditing(text: String,_ field: FormField)
    
}

protocol MainPresenterOutput: class {
    
   func createFooterView()    
    
}

class MainPresenter: MainPresenterInput {
 
    weak var output: MainPresenterOutput?
    var router: MainRoutable?
    
    let fields: [FormField] = [
        .date,
        .country,
        .city,
        .email
    ]
    var registrationData = RegistrationData()
    
    
    init(output: MainPresenterOutput,router: MainRoutable) {
        self.output = output
        self.router = router
    }
    
    func viewDidLoad() {
        
    
        
    }
    
    func numberOfRows() -> Int {
        
        return fields.count
    }
    
    func configure(cell: mainCellPresentable, at indexPath: IndexPath) {
        
        let field = fields[indexPath.row]
        
       cell.displayTextFieldPlaceholder(placeholder: field.placeholder)
    }
    
    func configure(header: TableHeaderPresentable) {
        
        header.displayHeader(text: LocalizationKeys.Headers.main.localized)
    }
    
    func configure(footer: TableFooterPresentable) {
        
        footer.displayFooterLabel(text: LocalizationKeys.ButtonNames.submitButton.localized)
        
    }
    
    
    func submitButtonTapped() {
        
        router?.showSummary(items: ["test", "test"])
    }
    
    func textFieldTapped(text: String, at indexPath: IndexPath) {
        
        router?.showList(items: ["County0","County1","County2","County3","County4","County5","County6","County7"])
        
        }
   
    func textFieldDidEndEditing(text: String,_ field: FormField){
        
        registrationData.email = text
    }
  
}


