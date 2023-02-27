//
//  WeatherDetailEntity.swift
//  Weather
//
//  Created by esens on 28/02/2023.
//

import Foundation

struct WeatherDetailEntity {
    let sunrise: Double?
    let sunset: Double?
    let humidity: Double?
    let visibility: Double?
    let weather: String?
    let weatherIcon: String?
}

extension WeatherData {
    var asEntity: WeatherDetailEntity {
        let weather = current?.weather?.first?.main
        return  WeatherDetailEntity(sunrise: current?.sunrise,
                                    sunset: current?.sunset,
                                    humidity: current?.humidity,
                                    visibility: current?.visibility,
                                    weather: weather?.rawValue ?? "Clear",
                                    weatherIcon: current?.weather?.first?.icon)
        
    }
}
