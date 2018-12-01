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
    public let currentTemperature: String
    
    init(cityName: String, currentTemperature: String) {
        self.cityName = cityName
        self.currentTemperature = currentTemperature
    }
    
    public static func getViewModelWith(weatherResponse: WeatherResponse) -> TodayViewModel {
        let cityName = "\(weatherResponse.city.name), \(weatherResponse.city.country)"
        
        var currentTemperatureTitle: String = "-"
        if let currentTemperature = weatherResponse.list.first {
            currentTemperatureTitle = "\(Int(currentTemperature.main.temp)) \(Device.getWeatherSymbol())"
        }
        
        return TodayViewModel(cityName: cityName, currentTemperature: currentTemperatureTitle)
    }
    
}
