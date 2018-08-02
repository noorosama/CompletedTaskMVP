//
//  SummaryViewController.swift
//  MVP
//
//  Created by Admin user on 7/30/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation
import UIKit

class SummaryViewController: UIViewController {
    
    
    //MARK: Outlet
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Variables
    
    var configurator: SummaryConfigurable!
    var presenter: SummaryPresenterInput!
    
    //MARK: View LifeCycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configurator.configure(summaryViewController: self)
        configurSummaryTableView()
       
    }
}

//MARK: - Configurations

extension SummaryViewController {
    
    func configurSummaryTableView() {
        
        let summaryXib = UINib(nibName: Constants.NibName.summaryCell, bundle: nil)
        tableView.register(summaryXib, forCellReuseIdentifier: Constants.Identifier.summaryCell)
        
        let summaryHeaderXib = UINib(nibName: Constants.NibName.header, bundle: nil)
        tableView.register(summaryHeaderXib, forHeaderFooterViewReuseIdentifier: Constants.Identifier.header)
        
    }
}

//MARK: - UITableViewDelegate

extension SummaryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let summaryHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.Identifier.header) as! TableHeaderView
        
        presenter.configure(header: summaryHeaderView)
        
        return summaryHeaderView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
}



//MARK: - UITableViewDataSoruce

extension SummaryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.numberOfRows()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.summaryCell, for: indexPath) as! SummaryTableViewCell
        
        cell.selectionStyle = .none
        
        presenter.configure(cell: cell, at: indexPath)
        
        cell.displayDescription(text: "noor")
        cell.displayValue(text: "IOS")
        
        return cell
        
     }

}

//MARK: - SummaryPresenterOutput

extension SummaryViewController: SummaryPresenterOutput {
    
    
}

