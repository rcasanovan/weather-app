//
//  ForecastDatasource.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class ForecastDatasource: NSObject {
    
    public var items: [ForecastViewModel] {
        didSet {
            //__ This is a little trick.
            //__ I create a dicctionary with keys = $0.dt
            //__ and then I created a sorted keys array.
            //__ This is to build the sections and add a headerview
            //__ with the day string.
            //__ Why am I doing this here?
            //__ easy -> to do this logic once :)
            dictionary = Dictionary(grouping: items, by: { $0.dt })
            keysArray = Array(dictionary.keys).sorted(by: { $0 < $1 })
        }
    }
    
    private var dictionary: Dictionary<String, [ForecastViewModel]>
    private var keysArray: [String]
    
    public override init() {
        items = []
        dictionary = [:]
        keysArray = []
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
        guard let elementsPerSection = dictionary[keysArray[section]] else {
            return 0
        }
        return elementsPerSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.identifier, for: indexPath) as? ForecastTableViewCell else {
            return UITableViewCell()
        }

        if let elementsPerSection = dictionary[keysArray[indexPath.section]]  {
            let viewModel = elementsPerSection[indexPath.row]
            cell.bindWithViewModel(viewModel)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ForecastHeaderView()
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
