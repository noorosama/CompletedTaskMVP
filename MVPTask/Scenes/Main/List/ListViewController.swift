//
//  ListViewController.swift
//  MVPTask
//
//  Created by Admin user on 8/1/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
 
    @IBOutlet weak var listTableView: UITableView!
    
    //    MARK: Variables
    var presenter: ListPresenterInput!
    var configurator: ListConfigurable?
    
    //    MARK: View LifeCycle
    override func viewDidLoad() {
        
       super.viewDidLoad()
       configurator?.configure(listViewController: self)
       configurListTableView()
        presenter?.viewDidLoad()
        
    }
        
}


//MARK: - Configurations

extension ListViewController {
    
    func configurListTableView() {
        
        let cityCountryXib = UINib(nibName: Constants.NibName.listCell, bundle: nil)
        listTableView.register(cityCountryXib, forCellReuseIdentifier: Constants.Identifier.listCell)
    }
}

extension ListViewController: ListPresenterOutput {
    
    
}
//MARK: - UITableViewDataSoruce

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter!.numberOfRows()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.listCell, for: indexPath) as! listTableViewCell
        
       presenter.configure(cell: cell, at: indexPath)
        
        cell.selectionStyle = .none
        
        return cell
        
    }
    
}
