//
//  Constant.swift
//  Delegates
//
//  Created by Nour Abukhaled on 6/27/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit

struct Constants {
    
//    struct Color {
//        static let darkBlue = UIColor(red: 4, green: 536, blue: 65, alpha: 1.0)
//    }
    struct StoryboardName {
        static let main = "Main"
        static let list = "List"
        static let summary = "SummaryViewController"
    }
    
    
    struct StoryboardID {
        static let main = "MainViewController"
        static let list = "ListViewController"
        static let summary = "SummaryViewController"
    }
    
    struct  NibName {
        static let mainCell = "mainTableViewCell"
        static let listCell = "listTableViewCell"
        static let summaryCell = "SummaryTableViewCell"
        static let header = "TableHeaderView"
        static let footer = "TableFooterView"
    }
    struct  Identifier {
        static let mainCell = "mainTableViewCell"
        static let listCell = "listTableViewCell"
        static let summaryCell = "SummaryTableViewCell"
        static let header = "TableHeaderView"
        static let footer = "TableFooterView"
    }

    struct TableView {
        static let main = "tableView"
        static let list = "listTableView"
    }
    
    enum DateFormat: String {
        case dateOfBirth = "MMMM dd, YYYY"
    }
}

