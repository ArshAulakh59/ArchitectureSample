//
//  AppDelegate.swift
//  ArchitectureSample
//
//  Created by Arsh Aulakh on 2016-10-16.
//  Copyright © 2016 Bhouse. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    //Properties
    var window: UIWindow?

    //Configure
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //Configure Window
        window = window ?? UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ListController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
