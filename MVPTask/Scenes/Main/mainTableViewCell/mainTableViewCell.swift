//
//  mainTableViewCell.swift
//  MVPTask
//
//  Created by Nour Abukhaled on 8/1/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

protocol mainCellPresentable {
    
    func displayTextField(text: String)
    func displayTextFieldPlaceholder(placeholder: String)
    func setKeyboardType(keyboardType: UIKeyboardType)
    func textFieldDidEndEditing(_ textField: UITextField)
    func shouldBeginEditingEnabled(_ enabled: Bool) 
    
}

class mainTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet private weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    
    //  MARK: Variables
    enum EventType {
        case endEditing
        case begingEditing
    }
    private var shouldBeginEditing = true
    var handler: ((UITextField, EventType) -> Void)?

}

//MARK: - Helper Methods
extension mainTableViewCell: mainCellPresentable {
    
    func displayTextField(text: String) {
        textField.text = text
    }
    
    func displayTextFieldPlaceholder(placeholder: String) {
        textField.placeholder = placeholder
    }
    
    func setKeyboardType(keyboardType: UIKeyboardType) {
        textField.keyboardType = keyboardType
    }
    
    func shouldBeginEditingEnabled(_ enabled: Bool) {
        shouldBeginEditing = enabled
    }
    
}

//MARK: - UITextFieldDelegate
extension mainTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        handler?(textField, .begingEditing)
        return shouldBeginEditing
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        handler?(textField, .endEditing)
    }

}



