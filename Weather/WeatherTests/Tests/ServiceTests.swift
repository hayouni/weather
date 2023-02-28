//
//  ServiceTests.swift
//  Weather
//
//  Created by esens on 28/02/2023.
//

import XCTest
@testable import Weather

class ServiceTests: XCTestCase {

    var service: ServiceMock!

    override func setUp() {
        self.service = ServiceMock()
    }

    func testFetchDataService() throws {
        service.getWeather(lat: "", lon: "", completion: { data in
            XCTAssertNotNil(data)
        })
    }
}
