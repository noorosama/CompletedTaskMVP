//
//  LocationItem.swift
//  MVPTask
//
//  Created by Admin user on 8/1/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import Foundation

class LocationItem {
    
    //MARK: Variables
    var text = ""
    var isChecked = false
 }

//MARK: - Helper Methods
extension LocationItem {
    
    func toggelChecked() {
        isChecked = !isChecked
    }
 }
