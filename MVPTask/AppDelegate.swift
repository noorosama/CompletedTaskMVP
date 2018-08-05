//
//  AppDelegate.swift
//  MVPTask
//
//  Created by Admin user on 7/31/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        IQKeyboardManager.sharedManager().enable = true 
        return true
    }
    
}
