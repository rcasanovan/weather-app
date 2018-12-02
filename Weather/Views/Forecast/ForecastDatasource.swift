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
extension ForecastDatasource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.identifier, for: indexPath) as? ForecastTableViewCell else {
            return UITableViewCell()
            
        }

        let viewModel = items[indexPath.row]
        cell.bindWithViewModel(viewModel)
        
        return cell
    }
    
}
