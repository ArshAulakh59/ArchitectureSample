//
//  AppDelegate.swift
//  ArchitectureSample
//
//  Created by Arsh Aulakh on 2016-10-16.
//  Copyright © 2016 Bhouse. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    //Properties
    var window: UIWindow?

    //System
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //Configure Slide Menu
        SlideMenuOptions.contentViewScale = 1
        SlideMenuOptions.simultaneousGestureRecognizers = false
        
        //Configure Window
        window = window ?? UIWindow(frame: UIScreen.main.bounds)
        sideMenu = SlideMenuController(mainViewController: ListController().navigationEmbeddedInstance, leftMenuViewController: MenuController())
        window?.rootViewController = sideMenu
        window?.makeKeyAndVisible()
        return true
    }
}
