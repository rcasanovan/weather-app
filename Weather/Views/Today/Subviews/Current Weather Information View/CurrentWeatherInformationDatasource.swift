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
            var humidity: String = "-"
            if let viewModel = viewModel {
                humidity = viewModel.humidity
            }
            cell.bindWith(image: UIImage(named: "HumidityIcon"), description: humidity)
        case 1:
            var rain: String = "-"
            if let viewModel = viewModel {
                rain = viewModel.rain
            }
            cell.bindWith(image: UIImage(named: "PrecipitationIcon"), description: rain)
        case 2:
            var pressure: String = "-"
            if let viewModel = viewModel {
                pressure = viewModel.pressure
            }
            cell.bindWith(image: UIImage(named: "PressureIcon"), description: pressure)
        case 3:
            var wind: String = "-"
            if let viewModel = viewModel {
                wind = viewModel.wind
            }
            cell.bindWith(image: UIImage(named: "WindIcon"), description: wind)
        case 4:
            var windDirection: String = "-"
            if let viewModel = viewModel {
                windDirection = viewModel.windDirection
            }
            cell.bindWith(image: UIImage(named: "WindDirectionIcon"), description: windDirection)
        default:
            print("do nothing...")
        }
        
        return cell
    }
    
}

