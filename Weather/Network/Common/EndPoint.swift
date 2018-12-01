//
//  EndPoint.swift
//
//  Created by Ricardo Casanova on 03/09/2018.
//  Copyright © 2018. All rights reserved.
//

import UIKit

protocol EndpointProtocol: RawRepresentable where RawValue == String {
    static var baseUrl: String { get }
    var url: URL? { get }
}

/**
 * Internal struct for Url
 */
private struct Url {
    
    static let baseUrl: String = "http://api.openweathermap.org/data/"
    static let version: String = "2.5"
    static let appID: String = "28bc6d7ace6e643065fd95756fae8b9c"
    
    struct Fields {
        static let latitude: String = "lat"
        static let longitude: String = "lon"
        static let appID: String = "APPID"
        static let units: String = "units"
    }
    
}

// MARK: - Search Endpoint
enum Endpoint: EndpointProtocol {
    
    var rawValue: String {
        switch self {
        case .getWeatherWith(let latitude, let longitude):
            return "/forecast?\(Url.Fields.latitude)=\(latitude)&\(Url.Fields.longitude)=\(longitude)&\(Url.Fields.appID)=\(Url.appID)&\(Url.Fields.units)=\(Device.getStringCurrentUnitTemperature())"
        }
    }
    
    case getWeatherWith(latitude: CGFloat, longitude: CGFloat)
}

extension EndpointProtocol {
    
    init?(rawValue: String) {
        assertionFailure("init(rawValue:) not implemented")
        return nil
    }
    
    var url: URL? {
        let urlComponents = URLComponents(string: Endpoint.baseUrl + self.rawValue)
        return urlComponents?.url
    }
    
    static var baseUrl: String {
        return "\(Url.baseUrl)\(Url.version)"
    }
}
