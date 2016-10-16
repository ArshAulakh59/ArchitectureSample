//
//  MenuController.swift
//  ArchitectureSample
//
//  Created by Arsh Aulakh on 2016-10-16.
//  Copyright © 2016 Bhouse. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

//MARK:- Interface
class MenuController: SlideMenuController {
    //MARK: Properties
    //Outlets
    @IBOutlet fileprivate weak var tableView: UITableView!
    //Variables
    var dataSource: MenuDataSource!
}

//MARK:- Implementation
extension MenuController {
    //MARK: System
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = MenuDataSource(tableView: tableView, delegate: self)
    }
}

extension MenuController: MenuDataSourceDelegate {
    //MARK: Handle Menu Selection
    func menu(tableView: UITableView, didSelect selectedDataSource: DataSourceProtocol) {
        guard let navController = sideMenu.mainViewController as? UINavigationController, let listController = navController.topViewController as? ListController else { return }
        
        //Get List Controller instance
        listController.dataSource = selectedDataSource
        sideMenu?.closeLeft()
    }
}
