//
//  Date.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

extension Date {
    
    public static var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "" }
    
    public static func getHHmmFormatWithTimestamp(_ timestamp: Double) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation)
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
}
