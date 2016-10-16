//
//  ListController.swift
//  ArchitectureSample
//
//  Created by Arsh Aulakh on 2016-10-16.
//  Copyright © 2016 Bhouse. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

//MARK: Interface
class ListController: UIViewController {
    //MARK: Properties
    //Outlets
    @IBOutlet fileprivate weak var tableView: UITableView!
    //Variables
    var dataSource: DataSourceProtocol? = nil {
        didSet {
            self.title = dataSource?.title
            dataSource?.updateTable(tableView: tableView)
        }
    }
    
    //MARK: Initialisation
    init() {
        super.init(nibName: String(describing: ListController.self), bundle: Bundle(for: ListController.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//MARK: Implementation
extension ListController {
    //MARK: System
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add Menu Button
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: sideMenu, action: #selector(SlideMenuController.openLeft))
        
        //Make preselection
        if dataSource == nil {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: String(describing: ListController.viewDidLoad)), object: nil)
        }
    }
}
