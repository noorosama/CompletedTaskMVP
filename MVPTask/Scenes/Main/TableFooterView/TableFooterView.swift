//
//  TableFooterView.swift
//  MVPTask
//
//  Created by Admin user on 7/31/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit

protocol TableFooterPresentable {
    
    func displayFooterLabel(text: String)
}

class TableFooterView: UITableViewHeaderFooterView {
    
      var tapHandler: (() -> Void)?
    
    //    MARK: Outlets
    @IBOutlet private weak var submitButton: UIButton!
    
    @IBAction private func submitButtonTapped(_ sender: UIButton) {
        
        tapHandler?()
    }
    
}

//MARK: - Helper Methods

extension TableFooterView: TableFooterPresentable {
    
    func displayFooterLabel(text: String) {
        
        submitButton.setTitle(text, for: .normal)
    }
    
   

}
