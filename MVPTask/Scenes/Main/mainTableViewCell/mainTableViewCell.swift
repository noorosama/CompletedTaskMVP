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
    
}

//MARK: - UITextFieldDelegate
extension mainTableViewCell: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        handler?(textField, .begingEditing)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        handler?(textField, .endEditing)
    }

}



