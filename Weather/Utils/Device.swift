//
//  Device.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation

class Device {
    
    public static func getDeviceLanguage() -> String {
        guard let languageCode = NSLocale.current.languageCode else {
            return "en"
        }
        return "es"
    }
    
    public static func getCurrentUnitTemperature() -> UnitTemperature {
        return UnitTemperature.current
    }
    
    public static func getStringCurrentUnitTemperature() -> String {
        let currentUnit = UnitTemperature.current
        if currentUnit == .celsius {
            return "metric"
        }
        
        return "imperial"
    }
    
    public static func getWeatherSymbol() -> String {
        let currentUnit = UnitTemperature.current
        if currentUnit == .celsius {
            return "°C"
        }
        
        return "°F"
    }
    
}
