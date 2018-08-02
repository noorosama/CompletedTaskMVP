//
//  TableHeaderView.swift
//  MVPTask
//
//  Created by Admin user on 7/31/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit

protocol TableHeaderPresentable {
    
    func displayHeader(text: String)
}

class TableHeaderView: UITableViewHeaderFooterView {
    //  MARK: Outlet
    @IBOutlet private weak var mainHeaderTitle: UILabel!
}

//MARK: - Helper Methods
extension TableHeaderView: TableHeaderPresentable {
    
    func displayHeader(text: String) {
       mainHeaderTitle.text = text
    }
}
