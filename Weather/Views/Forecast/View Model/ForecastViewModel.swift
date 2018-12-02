//
//  ForecastViewModel.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation

public struct ForecastViewModel {
    
    public let dt: String
    public let hour: String
    public let day: String
    public let temp: String
    public let description: String
    public let icon: String?
    
    init(dt: String, hour: String, day: String, temp: String, description: String, icon: String?) {
        self.dt = dt
        self.hour = hour
        self.day = day
        self.temp = temp
        self.description = description
        self.icon = icon
    }
    
    public static func getViewModelsWith(weatherResponse: WeatherResponse) -> [ForecastViewModel] {
        print(weatherResponse)
        print(weatherResponse.list)
        return weatherResponse.list.map { getViewModelWith(eachWeather: $0) }
    }
    
    public static func getViewModelWith(eachWeather: WeatherListResponse) -> ForecastViewModel {
        let dt = Date.getddMMYYYYFormatWithTimestamp(eachWeather.dt)
        
        let hour = Date.getHHmmFormatWithTimestamp(eachWeather.dt)
        
        let day = Date.getWeekDayWithTimestamp(eachWeather.dt)
        
        let temp = "\(Int(eachWeather.main.temp)) \(Device.getWeatherSymbol())"
        
        var description: String = "-"
        if let weather = eachWeather.weather.first {
            description = weather.description
        }
        
        var icon: String?
        if let weather = eachWeather.weather.first {
            icon = weather.icon
        }
        
        return ForecastViewModel(dt: dt, hour: hour, day: day, temp: temp, description: description, icon: icon)
    }
    
}
