//
//  CatsDataSource.swift
//  ArchitectureSample
//
//  Created by Arsh Aulakh on 2016-10-16.
//  Copyright © 2016 Bhouse. All rights reserved.
//

import UIKit

class CatsDataSource: NSObject, DataSourceProtocol {
    internal var title: String {
        return Pet.Cats.value
    }
}

extension CatsDataSource {
    //MARK: Configure Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 41
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self)) as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: String(describing: UITableView.self))
        }
        cell?.textLabel?.text = "Cat \(indexPath.row)"
        return cell!
    }
    
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
