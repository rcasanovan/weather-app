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
    public let humidity: String
    public let pressure: String
    public let wind: String
    public let windDirection: String
    public let rain: String
    
    init(cityName: String, currentTemperature: String, currentWeatherIconName: String?, weatherDescription: String, humidity: String, pressure: String, wind: String, windDirection: String, rain: String) {
        self.cityName = cityName
        self.currentTemperature = currentTemperature
        self.currentWeatherIconName = currentWeatherIconName
        self.weatherDescription = weatherDescription
        self.humidity = humidity
        self.pressure = pressure
        self.wind = wind
        self.windDirection = windDirection
        self.rain = rain
    }
    
    public static func getViewModelWith(weatherResponse: WeatherResponse) -> TodayViewModel {
        var cityName = "\(weatherResponse.city.name)"
        if let countryName = Utils.countryName(countryCode: weatherResponse.city.country) {
            cityName = "\(weatherResponse.city.name), \(countryName)"
        }
        
        var currentTemperatureTitle: String = "-"
        if let currentTemperature = weatherResponse.list.first {
            currentTemperatureTitle = "\(Int(currentTemperature.main.temp)) \(Utils.getWeatherSymbol())"
        }
        
        var currentWeatherIconName: String?
        if let currentTemperature = weatherResponse.list.first, let weather = currentTemperature.weather.first {
            currentWeatherIconName = weather.icon
        }
        
        var weatherDescription: String = "-"
        if let currentTemperature = weatherResponse.list.first, let weather = currentTemperature.weather.first {
            weatherDescription = weather.description
        }
        
        var humidity: String = "-"
        if let currentTemperature = weatherResponse.list.first {
            humidity = "\(currentTemperature.main.humidity)%"
        }
        
        var pressure: String = "-"
        if let currentTemperature = weatherResponse.list.first {
            pressure = "\(currentTemperature.main.pressure) hPa"
        }
        
        var wind: String = "-"
        if let currentTemperature = weatherResponse.list.first {
            let unitTemperature = Utils.getCurrentUnitTemperature()
            switch unitTemperature {
            case .celsius:
                wind = "\(Int(currentTemperature.wind.speed * 3.6)) km/h"
            case .fahrenheit:
                wind = "\(Int(currentTemperature.wind.speed)) mi/h"
            default:
                print("do nothing...")
            }
        }
        
        var windDirection: String = "-"
        if let currentTemperature = weatherResponse.list.first {
            windDirection = Utils.degToCompass(currentTemperature.wind.deg)
        }
        
        var rain: String = "-"
        if let currentTemperature = weatherResponse.list.first, let currentRain = currentTemperature.rain, let rain3h = currentRain.rain3h {
            rain = "\(rain3h) mm"
        }
        
        return TodayViewModel(cityName: cityName, currentTemperature: currentTemperatureTitle, currentWeatherIconName: currentWeatherIconName, weatherDescription: weatherDescription, humidity: humidity, pressure: pressure, wind: wind, windDirection: windDirection, rain: rain)
    }
    
}
