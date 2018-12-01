//
//  ResultError.swift
//
//  Created by Ricardo Casanova on 03/09/2018.
//  Copyright © 2018. All rights reserved.
//

import Foundation

enum ResultError: Error {
    var localizedDescription: String {
        switch self {
        case .networkError(let code):
            return "Network error. HTTP Code \(code.intValue)"
        case .serverError(let underlying):
            return "Server error: \(String(describing: underlying))"
        case .parsingError(let message):
            return "Parsing error: \(message)"
        default:
            return "Unknown error"
        }
    }
    
    case networkError(code: HTTPCode)
    case serverError(underlying: IMRequestErrorResponse)
    case unknownError(underlaying: Error)
    case parsingError(message: String)
    case internalError(message: String)
    
    init(error: Error) {
        self = .unknownError(underlaying: error)
    }
    
    var isConnectionError: Bool {
        return false // TODO:
    }
}
