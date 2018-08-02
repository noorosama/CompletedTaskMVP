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
    
    
    //   MARK: Outlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleButton: UIButton!
    
    
    //    MARK: Variables
    
    var presenter: SummaryPresenterInput!
    var configurator: SummaryConfigurable?
    
    //    MARK: View LifeCycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configurator?.configure(summaryViewController: self)
        presenter.viewDidLoad()
    }
}

//MARK: - Actions

extension SummaryViewController {
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        presenter.backButtonTapped()
        
    }
}

//MARK: - UITableViewDataSoruce

extension SummaryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.numberOfRows()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCell", for: indexPath) as! SummaryCell
        
        cell.selectionStyle = .none
        
        presenter.configure(cell: cell, at: indexPath)
        
        return cell
        
     }

}

//MARK: - SummaryPresenterOutput

extension SummaryViewController: SummaryPresenterOutput {
    
    func displayTitleLabel(title: String) {
        
       titleButton.setTitle(title, for: .normal)
    }
    
    func displayScreenTitle(title: String) {
      
        self.title = title
        
    }
    
    
    
}

