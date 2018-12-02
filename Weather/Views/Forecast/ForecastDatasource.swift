//
//  ForecastDatasource.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class ForecastDatasource: NSObject {
    
    public var items: [ForecastViewModel]
    
    public override init() {
        items = []
        super.init()
    }
}

// MARK: - UITableViewDataSource
extension ForecastDatasource: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let dictionary = Dictionary(grouping: items, by: { $0.dt })
        return dictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dictionary = Dictionary(grouping: items, by: { $0.dt })
        let keysArray = Array(dictionary.keys).sorted(by: { $0 < $1 })
        guard let elementsPerSection = dictionary[keysArray[section]] else {
            return 0
        }
        return elementsPerSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.identifier, for: indexPath) as? ForecastTableViewCell else {
            return UITableViewCell()
            
        }

        let dictionary = Dictionary(grouping: items, by: { $0.dt })
        let keysArray = Array(dictionary.keys).sorted(by: { $0 < $1 })
        if let elementsPerSection = dictionary[keysArray[indexPath.section]]  {
            let viewModel = elementsPerSection[indexPath.row]
            cell.bindWithViewModel(viewModel)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ForecastHeaderView()
        let dictionary = Dictionary(grouping: items, by: { $0.dt })
        let keysArray = Array(dictionary.keys).sorted(by: { $0 < $1 })
        if let elementsPerSection = dictionary[keysArray[section]]  {
            let viewModel = elementsPerSection[0]
            headerView.title = viewModel.day.uppercased()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return ForecastHeaderView.height
    }
    
}
