//
//  Weather.swift
//  Weather
//
//  Created by esens on 24/02/2023.
//

//import Foundation
//
//// MARK: - WeatherJSON
//struct WeatherJSON: Codable {
//    let coord: Coord
//    let weather: [Weather]
//    //let base: String
//    let main: Main
//    //let visibility: Int
//    let wind: Wind
//    //let clouds: Clouds
//    //let dt: Int?
//    let sys: Sys
//    //let timezone, id: Int
//    let name: String?
//    let cod: Int?
//}
//
//// MARK: - Clouds
//struct Clouds: Codable {
//    let all: Int?
//}
//
//// MARK: - Coord
//struct Coord: Codable {
//    let lon, lat: Double?
//}
//
//// MARK: - Main
//struct Main: Codable {
//    let temp, tempMin, tempMax: Double? //feelsLike,
//    let pressure, humidity: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case temp
//        //case feelsLike = "feels_like"
//        case tempMin = "temp_min"
//        case tempMax = "temp_max"
//        case pressure, humidity
//    }
//}
//
//// MARK: - Sys
//struct Sys: Codable {
//    //let type, id: Int
//    let country: String?
//    //let sunrise, sunset: Int
//}
//
//// MARK: - Weather
//struct Weather: Codable {
//    //let id: Int
//    let main, icon, weatherDescription: String?
//
//    enum CodingKeys: String, CodingKey {
//        case main //id,
//        case weatherDescription = "description"
//        case icon
//    }
//}
//
//// MARK: - Wind
//struct Wind: Codable {
//    let speed: Double?
//    //let deg: Int
//}
