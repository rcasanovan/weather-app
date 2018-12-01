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
    public let currentWeatherIconName: String?
    public let weatherDescription: String
    
    init(cityName: String, currentTemperature: String, currentWeatherIconName: String?, weatherDescription: String) {
        self.cityName = cityName
        self.currentTemperature = currentTemperature
        self.currentWeatherIconName = currentWeatherIconName
        self.weatherDescription = weatherDescription
    }
    
    public static func getViewModelWith(weatherResponse: WeatherResponse) -> TodayViewModel {
        let cityName = "\(weatherResponse.city.name), \(weatherResponse.city.country)"
        
        var currentTemperatureTitle: String = "-"
        if let currentTemperature = weatherResponse.list.first {
            currentTemperatureTitle = "\(Int(currentTemperature.main.temp)) \(Device.getWeatherSymbol())"
        }
        
        var currentWeatherIconName: String?
        if let currentTemperature = weatherResponse.list.first, let weather = currentTemperature.weather.first {
            currentWeatherIconName = weather.icon
        }
        
        var weatherDescription: String = "-"
        if let currentTemperature = weatherResponse.list.first, let weather = currentTemperature.weather.first {
            weatherDescription = weather.description
        }
        
        return TodayViewModel(cityName: cityName, currentTemperature: currentTemperatureTitle, currentWeatherIconName: currentWeatherIconName, weatherDescription: weatherDescription)
    }
    
}
