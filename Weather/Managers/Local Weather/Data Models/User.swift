//
//  User.swift
//  Weather
//
//  Created by Ricardo Casanova on 03/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var userId: String?
    
    override class func primaryKey() -> String? {
        return "userId"
    }
}
