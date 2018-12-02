//
//  LocalWeather.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation
import RealmSwift

class LocalWeather: Object {
    @objc dynamic var weatherId: String?
    @objc dynamic var weatherData: Data? = nil
    
    override class func primaryKey() -> String? {
        return "weatherId"
    }
}
