//
//  RepoResponse.swift
//  Weather
//
//  Created by Ricardo Casanova on 29/11/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import UIKit

struct WeatherResponse: Decodable {
    let cod: String
    let message: CGFloat
    let cnt: UInt
    let list: [WeatherListResponse]
    let city: WeatherCityResponse
}

struct WeatherListResponse: Decodable {
    let dt: Int64
    let main: WeatherListMainResponse
    let weather: [WeatherListWeatherResponse]
    let clouds: WeatherListCloudsResponse
    let wind: WeatherListWindResponse
    let dt_txt: String
}

struct WeatherListMainResponse: Decodable {
    let temp: CGFloat
    let temp_min: CGFloat
    let temp_max: CGFloat
    let pressure: CGFloat
    let sea_level: CGFloat
    let grnd_level: CGFloat
    let humidity: Int
    let temp_kf: CGFloat
}

struct WeatherListWeatherResponse: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WeatherListCloudsResponse: Decodable {
    let all: Int
}

struct WeatherListWindResponse: Decodable {
    let speed: CGFloat
    let deg: CGFloat
}

struct WeatherCityResponse: Decodable {
    let id: Int64
    let name: String
    let coord: WeatherCityCoordResponse
    let country: String
    let population: Int64
}

struct WeatherCityCoordResponse: Decodable {
    let lat: CGFloat
    let lon: CGFloat
}
