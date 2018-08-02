//
//  listTableViewCell.swift
//  MVPTask
//
//  Created by Admin user on 8/1/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit

protocol listCellPresentable {
    
    func displayLabel(text: String)
    
}


class listTableViewCell: UITableViewCell, listCellPresentable {

   
    @IBOutlet weak var listLabel: UILabel!
    
    func displayLabel(text: String) {
        
        listLabel.text = text
    }
    
    
}
