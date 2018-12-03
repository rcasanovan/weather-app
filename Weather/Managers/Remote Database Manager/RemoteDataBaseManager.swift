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
    
    public var verbose: Bool = false
    
    static let shared: RemoteDabaBaseManager = { return RemoteDabaBaseManager() }()
    
    private struct Config {
        
        struct Document {
            static let temperature: String = "Temperature"
        }
        
        struct Fields {
            static let lastemperature: String = "lastemperature"
            static let coodinates: String = "coodinates"
            static let countryCode: String = "countryCode"
        }
        
    }
    
    public func addInformation(userId: String, lastTemperature: CGFloat, latitude: Double, longitude: Double, countryCode: String) {
        let geoPoint = GeoPoint(latitude: latitude, longitude: longitude)
        let db = Firestore.firestore()
        db.collection(Config.Document.temperature).document(userId).setData([
            Config.Fields.lastemperature: lastTemperature,
            Config.Fields.coodinates: geoPoint,
            Config.Fields.countryCode: countryCode
        ]) { [weak self] (err) in
            guard let `self` = self else { return }
            if self.verbose {
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
    }
    
}
