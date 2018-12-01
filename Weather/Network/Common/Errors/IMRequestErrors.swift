//
//  SARequestErrors.swift
//
//  Created by Ricardo Casanova on 03/09/2018.
//  Copyright © 2018. All rights reserved.
//

import Foundation

struct IMRequestErrorResponse: Decodable {
    let errors: [[String:String]]
    
    var parsedErrors: [IMRequestError] {
        let flattenedDictionary = errors
            .flatMap { $0 }
            .reduce([String:String]()) { (dict, tuple) in
                var nextDict = dict
                nextDict.updateValue(tuple.1, forKey: tuple.0)
                return nextDict
        }
        return flattenedDictionary.compactMap({
            return IMRequestError(key: $0.0, error: $0.1)
        })
    }
    
    var reason: String? {
        return parsedErrors.filter{ $0.key == "reason" }.first?.error
    }
}

struct IMRequestError: Decodable {
    let key: String
    let error: String
    
    init(key: String, error: String) {
        self.key = key
        self.error = error
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        let dict = try container.decode([String:String].self)
        guard let key = dict.first?.key,
            let value = dict.first?.value else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Could not parse error from server")
        }
        self.key = key
        self.error = value
    }
}

enum IMFieldErrorResponseState: String, Decodable {
    case missing
    case invalid
}
