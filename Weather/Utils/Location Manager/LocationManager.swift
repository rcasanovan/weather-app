//
//  LocationManager.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/09/2018.
//  Copyright © 2018 Pijp Technologies S.L. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    public var simulateLocation: Bool = false
    private let locationManager: CLLocationManager
    private var currentLocation: CLLocation?
    
    private struct Configuration {
        static let maxDistanceInMeters: Double = 50.0
    }
    
    private override init() {
        self.locationManager = CLLocationManager()
        super.init()
        self.locationManager.delegate = self
    }
    
    static let sharedInstance = LocationManager()

    public func requestAuthorizationIfNeeded() {
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    public func getCurrentLocation() -> CLLocationCoordinate2D? {
        let realLocation = simulateLocation ? simulatedLocation() : locationManager.location
        guard let _ = currentLocation else {
            self.currentLocation = realLocation
            return self.currentLocation?.coordinate
        }
        
        let distanceInMeters = getDistanceToLocation(realLocation)
        if distanceInMeters > Configuration.maxDistanceInMeters {
            self.currentLocation = realLocation
        }
        
        return self.currentLocation?.coordinate
    }
    
    public func getDistanceToLocation(_ location: CLLocation?) -> Double {
        guard let currentLocation = currentLocation, let toLocation = location else {
            return 0.0
        }
        
        let distanceInMeters = currentLocation.distance(from: toLocation)
        return distanceInMeters
    }
    
}

extension LocationManager {
    
    private func simulatedLocation() -> CLLocation {
        //return CLLocation(latitude: 39.470242, longitude: -0.376800)
        return CLLocation(latitude: 50.075539, longitude: 14.437800)
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        var shouldIAllow = false
        var notDetermined = false
        var locationStatus: String
        
        switch status {
        case .restricted:
            locationStatus = "Restricted Access to location"
        case .denied:
            locationStatus = "User denied access to location"
        case .notDetermined:
            locationStatus = "Status not determined"
            notDetermined = true
        default:
            locationStatus = "Allowed to location Access"
            shouldIAllow = true
        }

        if (shouldIAllow == true) {
            NSLog("Location to Allowed")
            NotificationCenter.default.post(name: .locationAllowed, object: nil)
            // Start location services
            locationManager.startUpdatingLocation()
        } else {
            NSLog("Denied access: \(locationStatus)")
            if !notDetermined {
                NotificationCenter.default.post(name: .locationDenied, object: nil)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
}
