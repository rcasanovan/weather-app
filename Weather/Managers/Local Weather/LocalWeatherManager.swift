//
//  LocalWeatherManager.swift
//  Weather
//
//  Created by Ricardo Casanova on 02/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import Foundation
import RealmSwift

class LocalWeatherManager {
    
    static let shared: LocalWeatherManager = { return LocalWeatherManager() }()
    
    /**
     * Save current weather
     *
     * - parameters:
     *      -weather: current weather to save
     */
    public func saveLocalWeather(_ weather: WeatherResponse) {
        //Remove older local weather
        deleteLocalWeather()
        
        // Create a suggestion object
        let localWeatherModel = LocalWeather()
        localWeatherModel.weatherId = UUID().uuidString
        localWeatherModel.weatherData = archive(w: weather)
        
        // Get the default Realm
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(localWeatherModel)
        }
    }
    
    /**
     * Get local weather data
     */
    public func getLocalWeather() -> WeatherResponse? {
        // Get the default Realm
        let realm = try! Realm()
        
        // Query Realm for all local weather
        guard let localWeather = realm.objects(LocalWeather.self).first, let weatherData = localWeather.weatherData else {
            return nil
        }

        return unarchive(d: weatherData)
    }
    
    /**
     * Delete all local weather data
     */
    public func deleteLocalWeather() {
        let realm = try! Realm()
        let localWeather = realm.objects(LocalWeather.self)
        
        try! realm.write {
            realm.delete(localWeather)
        }
    }
    
    /**
     * Validate if local weather exists in the database
     */
    public func localWeatherExists() -> Bool {
        let realm = try! Realm()
        guard let localWeather = realm.objects(LocalWeather.self).first, let _ = localWeather.weatherData else {
            return false
        }
        return true
    }
    
    public func saveUserId(_ userId: String) {
        if localUserExists() { return }
        
        // Create a suggestion object
        let user = User()
        user.userId = userId

        // Get the default Realm
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(user)
        }
    }
    
    public func getCurrentUserId() -> String? {
        // Get the default Realm
        let realm = try! Realm()
        
        // Query Realm for all local weather
        guard let user = realm.objects(User.self).first else {
            return nil
        }
        
        return user.userId
    }
    
}

extension LocalWeatherManager {
    
    /**
     * Validate if local user exists in the database
     */
    private func localUserExists() -> Bool {
        let realm = try! Realm()
        guard let _ = realm.objects(User.self).first else {
            return false
        }
        return true
    }
    
    private func archive(w: WeatherResponse) -> Data? {
        do {
            let jsonData = try JSONEncoder().encode(w)
            return jsonData
        } catch { print(error) }
        
        return nil
    }
    
    private func unarchive(d: Data) -> WeatherResponse? {
        do {
            let decodedWeather = try JSONDecoder().decode(WeatherResponse.self, from: d)
            return decodedWeather
        } catch { print(error) }
        
        return nil
    }
    
}
