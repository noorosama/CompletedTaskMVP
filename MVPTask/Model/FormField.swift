//
//  FormField.swift
//  MVPTask
//
//  Created by Admin user on 8/1/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit

enum FormField {
    
    case email
    case country
    case city
    case date
    
    var keyboardType: UIKeyboardType? {
        switch self {
        case .email: return .emailAddress
        case .country: return nil
        case .city: return nil
        case .date: return nil
        }
    }
    
    var placeholder: String {
        switch self {
        case .email: return "Please enter your email"
        case .country: return "Please pic your country"
        case .city: return "Please pic your city"
        case .date: return "Please pic your date of birth"
        }
    }
    
    var shouldBeginEditing: Bool {
        switch self {
        case .country: return false
        default: return true
        }
    }
}
