//
//  CurrentWeatherInformationDatasource.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class CurrentWeatherInformationDatasource: NSObject {
    
    public var viewModel: TodayViewModel?
    
    public override init() {
        super.init()
    }
}

extension CurrentWeatherInformationDatasource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentWeatherInformationCollectionViewCell.identifier, for: indexPath) as? CurrentWeatherInformationCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.bindWith(image: UIImage(named: "HumidityIcon"), description: "57%")
        case 1:
            cell.bindWith(image: UIImage(named: "PrecipitationIcon"), description: "1.0 mm")
        case 2:
            cell.bindWith(image: UIImage(named: "PressureIcon"), description: "1019 hPa")
        case 3:
            cell.bindWith(image: UIImage(named: "WindIcon"), description: "20 km/h")
        case 4:
            cell.bindWith(image: UIImage(named: "WindDirectionIcon"), description: "SE")
        default:
            print("do nothing...")
        }
        
        return cell
    }
    
}

