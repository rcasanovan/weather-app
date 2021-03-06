//
//  NetworkTests.swift
//  WeatherTests
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import XCTest
@testable import Weather

typealias getWeatherCompletionBlock = (Result<WeatherResponse?>) -> Void

class NetworkTests: XCTestCase {

    private let requestManager = RequestManager()
    
    override func setUp() {
        super.setUp()
        LocalWeatherManager.shared.deleteLocalWeather()
    }
    
    override func tearDown() {
        super.tearDown()
        LocalWeatherManager.shared.deleteLocalWeather()
    }
    
    func testGetWeatherWith(latitude: CGFloat, longitude: CGFloat, localJSONFile: String? = nil, completion: @escaping getWeatherCompletionBlock) {
        var getWeatherRequest = WeatherRequest(latitude: latitude, longitude: longitude)
        
        getWeatherRequest.completion = completion
        getWeatherRequest.simulatedResponseJSONFile = localJSONFile
        requestManager.send(request: getWeatherRequest)
    }
    
    func testGetValenciaWeather() {
        let weatherExpectation: XCTestExpectation = self.expectation(description: "weatherExpectation")
        
        testGetWeatherWith(latitude: 39.470242, longitude: -0.376800) { (response) in
            switch response {
            case .success(let weatherResponse):
                XCTAssertTrue(weatherResponse != nil, "Impossible to get the weather response")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            weatherExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    func testGetBarcelonaWeather() {
        let weatherExpectation: XCTestExpectation = self.expectation(description: "weatherExpectation")
        
        testGetWeatherWith(latitude: 41.385063, longitude: 2.173404) { (response) in
            switch response {
            case .success(let weatherResponse):
                XCTAssertTrue(weatherResponse != nil, "Impossible to get the weather response")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            weatherExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    func testGetPragueWeather() {
        let weatherExpectation: XCTestExpectation = self.expectation(description: "weatherExpectation")
        
        testGetWeatherWith(latitude: 50.075539, longitude: 14.437800) { (response) in
            switch response {
            case .success(let weatherResponse):
                XCTAssertTrue(weatherResponse != nil, "Impossible to get the weather response")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            weatherExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    func testGetSimulatedWeather() {
        let weatherExpectation: XCTestExpectation = self.expectation(description: "weatherExpectation")
        
        testGetWeatherWith(latitude: 39.470242, longitude: -0.376800, localJSONFile: "SimulatedWeatherResponse") { (response) in
            switch response {
            case .success(let weatherResponse):
                XCTAssertTrue(weatherResponse != nil, "Impossible to get the weather response")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            weatherExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 20.0, handler: nil)
    }
    
    func testSaveWeather() {
        let weatherExpectation: XCTestExpectation = self.expectation(description: "weatherExpectation")
        
        testGetWeatherWith(latitude: 39.470242, longitude: -0.376800, localJSONFile: "SimulatedWeatherResponse") { (response) in
            switch response {
            case .success(let weatherResponse):
                guard let weatherResponse = weatherResponse else {
                    XCTFail("Impossible to get the weather response")
                    return
                }
                LocalWeatherManager.shared.saveLocalWeather(weatherResponse)
                
                let localWeather = LocalWeatherManager.shared.getLocalWeather()
                XCTAssert(localWeather != nil, "Impossible to get the local weather response")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            
            weatherExpectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 20.0, handler: nil)
    }

}
