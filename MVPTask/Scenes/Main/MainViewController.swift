//
//  ViewController.swift
//  DelegatesMVP
//
//  Created by Nour Abukhaled on 7/31/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    var configurator: MainConfigurable?
    var presenter: MainPresenterInput!
    
    private let datePicker = UIDatePicker()

    //MARK: ViewLife Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator = MainConfigurator()
        configurator?.configure(mainViewController: self)
        configureTableView()
        createFooterView()
        presenter?.viewDidLoad()
        
       
    }
}

extension MainViewController: MainPresenterOutput {
    
    func createFooterView() {
        
      let footerView = tableView.createFooterView()
        
        footerView?.tapHandler = { [weak self] in
            
            self?.presenter.submitButtonTapped()
        }
        
        presenter.configure(footer: footerView!)
    }
    
}

//MARK: - Configurations

private extension MainViewController {
    
    func configureTableView() {
        
        let locationXib = UINib(nibName: Constants.NibName.mainCell, bundle: nil)
        tableView.register(locationXib, forCellReuseIdentifier: Constants.Identifier.mainCell)

        let locationHeaderXib = UINib(nibName: Constants.NibName.header, bundle: nil)
        tableView.register(locationHeaderXib, forHeaderFooterViewReuseIdentifier: Constants.Identifier.header)
        
        let locationFooterXib = UINib(nibName: Constants.NibName.footer, bundle: nil)
        tableView.register(locationFooterXib, forHeaderFooterViewReuseIdentifier: Constants.Identifier.footer)
    }
    
}

//MARK: - UITableViewDataSoruce

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.numberOfRows()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:  Constants.Identifier.mainCell, for: indexPath) as! mainTableViewCell
        
        presenter?.configure(cell: cell, at: indexPath)
        
        cell.handler = { [weak self] textField, eventType in
            
           self?.presenter.textFieldTapped(text: textField.text!, at: indexPath)
        }
       
        cell.selectionStyle = .none
        
        return cell
       
    }
    
}

//MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.Identifier.header) as! TableHeaderView
        
        presenter.configure(header: headerView)
        
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    
}



