//
//  MenuDataSource.swift
//  ArchitectureSample
//
//  Created by Arsh Aulakh on 2016-10-16.
//  Copyright © 2016 Bhouse. All rights reserved.
//

import UIKit

//Enumeration
enum Pet: Int {
    case Cats = 0
    case Dogs
    case Birds
    case Fish
    case All
    
    var value: String {
        switch self {
        case .Cats:
            return "Cats"
        case .Dogs:
            return "Dogs"
        case .Birds:
            return "Birds"
        case .Fish:
            return "Fish"
        case .All:
            return ""
        }
    }
    
    var dataSource: DataSourceProtocol? {
        let sources: [DataSourceProtocol] = [CatsDataSource(), DogsDataSource(), BirdsDataSource(), FishDataSource()]
        return (rawValue < sources.count) ? sources[rawValue] : nil
    }
}

//Protocol
protocol MenuDataSourceDelegate: class {
    func menu(tableView: UITableView, didSelect selectedDataSource: DataSourceProtocol)
}

//MARK:- Interface
class MenuDataSource: NSObject {
    //MARK: Properties
    var tableView: UITableView!
    var delegate: MenuDataSourceDelegate!
    
    //MARK: Initialisation
    required init(tableView: UITableView, delegate: MenuDataSourceDelegate) {
        //Set Properties
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        
        //Add Observer
        NotificationCenter.default.addObserver(self, selector: #selector(preselectCats), name: NSNotification.Name(rawValue: String(describing: ListController.viewDidLoad)), object: nil)
        
        //Configure Table
        configureTable()
    }
}

//MARK:- Implementation
extension MenuDataSource {
    //MARK: Configure
    func configureTable() {
        //Register Cells
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        
        //Set DataSource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //Reload data for changes to take affect
        tableView.reloadData()
    }
    
    //MARK: Preselection
    func preselectCats() {
        tableView(tableView, didSelectRowAt: IndexPath(row: Pet.Cats.rawValue, section: 0))
    }
}

extension MenuDataSource: UITableViewDataSource, UITableViewDelegate {
    //MARK: Configure Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Pet.All.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self)) as UITableViewCell!
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: String(describing: UITableViewCell.self))
        }
        cell?.textLabel?.text = Pet(rawValue: indexPath.row)?.value ?? ""
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedDataSource = Pet(rawValue: indexPath.row)?.dataSource else {
            return
        }
        
        delegate?.menu(tableView: tableView, didSelect: selectedDataSource)
    }
}
