//
//  SummaryCell.swift
//  MVP
//
//  Created by Admin user on 7/30/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

protocol SummaryCellPresentable {
    
    func displayLabel(text: String)
}

class SummaryCell: UITableViewCell, SummaryCellPresentable {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    func displayLabel(text: String) {
        
        titleLabel.text = text
    }
    
}

