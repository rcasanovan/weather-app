//
//  TodayViewModel.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

public struct TodayViewModel {
    
    public let cityName: String
    
    init(cityName: String) {
        self.cityName = cityName
    }
    
    public static func getViewModelWith(weatherResponse: WeatherResponse) -> TodayViewModel {
        let cityName = "\(weatherResponse.city.name), \(weatherResponse.city.country)"
        return TodayViewModel(cityName: cityName)
    }
    
}
