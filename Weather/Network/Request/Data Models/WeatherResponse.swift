//
//  RepoResponse.swift
//  Weather
//
//  Created by Ricardo Casanova on 29/11/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

public struct WeatherResponse: Codable {
    let cod: String
    let message: CGFloat
    let cnt: UInt
    let list: [WeatherListResponse]
    let city: WeatherCityResponse
}

public struct WeatherListResponse: Codable {
    let dt: Int64
    let main: WeatherListMainResponse
    let weather: [WeatherListWeatherResponse]
    let clouds: WeatherListCloudsResponse
    let wind: WeatherListWindResponse
    let dt_txt: String
}

public struct WeatherListMainResponse: Codable {
    let temp: CGFloat
    let temp_min: CGFloat
    let temp_max: CGFloat
    let pressure: CGFloat
    let sea_level: CGFloat
    let grnd_level: CGFloat
    let humidity: Int
    let temp_kf: CGFloat
}

public struct WeatherListWeatherResponse: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

public struct WeatherListCloudsResponse: Codable {
    let all: Int
}

public struct WeatherListWindResponse: Codable {
    let speed: CGFloat
    let deg: CGFloat
}

public struct WeatherCityResponse: Codable {
    let id: Int64
    let name: String
    let coord: WeatherCityCoordResponse
    let country: String
    let population: Int64?
}

public struct WeatherCityCoordResponse: Codable {
    let lat: CGFloat
    let lon: CGFloat
}
