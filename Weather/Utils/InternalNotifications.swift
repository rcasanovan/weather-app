//
//  InternalNotifications.swift
//  Weather
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation

public struct WeatherInfo {
    static let viewModelValue: String = "viewModelValue"
}

extension Notification.Name {
    static let locationAllowed = Notification.Name("locationAllowed")
    static let locationDenied = Notification.Name("locationDenied")
    static let weatherInfoLoaded = Notification.Name("weatherInfoLoaded")
}
