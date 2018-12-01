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
    
    static let baseUrl: String = "api.openweathermap.org/data/"
    static let version: String = "2.5/"
    
    struct Fields {
        static let latitude: String = "lan"
        static let longitude: String = "long"
    }
    
}

// MARK: - Search Endpoint
enum Endpoint: EndpointProtocol {
    
    var rawValue: String {
        switch self {
        case .getWeatherWith(let latitude, let longitude):
            return "/forecast?\(Url.Fields.latitude)=\(latitude)&\(Url.Fields.longitude)=\(longitude)"
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
