//
//  LocationTests.swift
//  WeatherTests
//
//  Created by Ricardo Casanova on 01/12/2018.
//  Copyright © 2018 Pijp. All rights reserved.
//

import XCTest
@testable import Weather

class LocationTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSimulateLocation() {
        LocationManager.sharedInstance.simulateLocation = true
        let currentLocation = LocationManager.sharedInstance.getCurrentLocation()
        XCTAssert(currentLocation?.latitude == 39.470242 && currentLocation?.longitude == -0.376800, "Error getting the simulate location (Valencia, Spain)")
    }

}
