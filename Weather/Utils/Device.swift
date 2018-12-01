//
//  Device.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation

class Device {
    
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
    
}
