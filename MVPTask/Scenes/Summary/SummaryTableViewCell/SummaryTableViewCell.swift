//
//  SummaryTableViewCell.swift
//  MVPTask
//
//  Created by Admin user on 7/31/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

class SummaryTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
}

//MARK: - Helper Methods

extension SummaryTableViewCell {
    
    func displayDescription(text: String) {
        
       descriptionLabel.text = text
        
    }
    
    func displayValue(text: String) {
        
       valueLabel.text = text
        
    }
    
}
