//
//  RemoteDataBaseManager.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation
import Firebase

class RemoteDabaBaseManager {
    
    public static func addInformation(userId: String, lastTemperature: CGFloat, latitude: Double, longitude: Double, countryCode: String) {
        let geoPoint = GeoPoint(latitude: latitude, longitude: longitude)
        let db = Firestore.firestore()
        db.collection("Temperature").document(userId).setData([
            "lastemperature": lastTemperature,
            "coodinates": geoPoint,
            "countryCode": countryCode
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
}
