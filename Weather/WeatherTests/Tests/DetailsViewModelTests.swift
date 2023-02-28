//
//  DetailsViewModelTests.swift
//  WeatherTests
//
//  Created by esens on 28/02/2023.
//

import XCTest
@testable import Weather
import APIDataRetriever

final class DetailsViewModelTests: XCTestCase {

    var viewModel: DetailsViewModel!
    var weatherData: WeatherDetailEntity?
    var service: ServiceProtocol!
    
    override func setUp() {
        self.service = ServiceMock()
        self.viewModel = DetailsViewModel(city: nil, service: service)
        self.viewModel.getData { data in
            self.weatherData = data
        }
    }

    func testWeatherDataNotNil() throws {
        XCTAssertEqual(weatherData?.sunrise, 1677565736.0)
    }

}
