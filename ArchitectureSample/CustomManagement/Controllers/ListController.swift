//
//  ListController.swift
//  ArchitectureSample
//
//  Created by Arsh Aulakh on 2016-10-16.
//  Copyright © 2016 Bhouse. All rights reserved.
//

import UIKit

//MARK: Interface
class ListController: UIViewController {
    //MARK: Properties
    //Outlets
    @IBOutlet fileprivate weak var tableView: UITableView!
    //Variables
    var dataSource: NSObject {
        didSet {
            tableView.reloadData()
        }
    }
    //Constants
    let 
    
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
    }
}
