//
//  MainPresenter.swift
//  DelegatesMVP
//
//  Created by Nour Abukhaled on 7/31/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

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
   func displayAlert(message: String, completion: (() -> Void)?)
    
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
        
        let validationResult = validate(registrationData: registrationData)
        
        switch validationResult {
        case .valid(_):
            router?.showSummary(items: ["test", "test"])
        case .invalid(let errorMessage):
            output?.displayAlert(message: errorMessage, completion: nil)
        }

    }
    
    func textFieldTapped(text: String, at indexPath: IndexPath) {

        router?.showList(items: ["County0","County1","County2","County3","County4","County5","County6","County7"])
        
        }
   
    func textFieldDidEndEditing(text: String,_ field: FormField) {
        
        registrationData.email = text
    }
  
}

//MARK: - Validation
private extension MainPresenter {
    
    func validate(registrationData: RegistrationData) -> validateResult  {
        
        if registrationData.date.isEmpty {
            
            return .invalid(LocalizationKeys.Messages.emptyDateFieldMessage.localized)
            
        } else if registrationData.countryItem.isEmpty {
            
            return .invalid(LocalizationKeys.Messages.emptyCountryFieldMessage.localized)
            
        } else if registrationData.cityItem.isEmpty {
            
            return .invalid(LocalizationKeys.Messages.emptyCityFieldMessage.localized)
            
        } else if registrationData.email.isEmpty {
            
            return .invalid(LocalizationKeys.Messages.emptyEmailFieldMessage.localized)
            
        } else if !(registrationData.email.validateEmail(enteredEmail: registrationData.email)) {
            
            return .invalid(LocalizationKeys.Messages.invlidEmailFieldMessage.localized)
            
        } else {
            
            return .valid(LocalizationKeys.Messages.successMessage.localized)
        }
        
    }

}


