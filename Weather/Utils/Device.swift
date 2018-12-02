//
//  Device.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

class Device {
    
    public static func getDeviceLanguage() -> String {
        guard let languageCode = NSLocale.current.languageCode else {
            return "en"
        }
        return languageCode
    }
    
    public static func countryName(countryCode: String) -> String? {
        let current = NSLocale.current
        return current.localizedString(forRegionCode: countryCode)
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
    
    public static func degToCompass(_ deg: CGFloat) -> String {
        let val = floor(Double((deg / 22.5) + 0.5))
        let arr = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
        return arr[Int(val.truncatingRemainder(dividingBy: 16.0))]
    }
    
    public static func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public static func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
}
