//
//  Constants.swift
//  ArchitectureSample
//
//  Created by Arsh Aulakh on 2016-10-16.
//  Copyright © 2016 Bhouse. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

//Variables
var sideMenu: SlideMenuController!

//Protocol
protocol DataSourceProtocol: class, UITableViewDataSource, UITableViewDelegate {
    var title: String { get }
    var sources: [DataSourceProtocol] { get }
}

extension DataSourceProtocol {
    func updateTable(tableView: UITableView!) {
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.reloadData()
    }
    
    var sources: [DataSourceProtocol] {
        return [CatsDataSource(), DogsDataSource(), BirdsDataSource(), FishDataSource()]
    }
}

//Extensions
//UIViewController
extension UIViewController {
    var navigationEmbeddedInstance: UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
