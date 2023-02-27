//
//  WeatherData.swift
//  Weather
//
//  Created by esens on 24/02/2023.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Codable {
    let lat, lon: Double?
    let timezone: String?
    let timezoneOffset: Double?
    let current: Current?
    let minutely: [Minutely]?
    let hourly: [Current]?
    let daily: [Daily]?
    let alerts: [Alert]?
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, minutely, hourly, daily, alerts
    }
}

// MARK: - Alert
struct Alert: Codable {
    let senderName, event: String?
    let start, end: Double?
    let description: String?
    let tags: [String]?
    
    enum CodingKeys: String, CodingKey {
        case senderName = "sender_name"
        case event, start, end, description, tags
    }
}

// MARK: - Current
struct Current: Codable {
    let dt: Double?
    let sunrise, sunset: Double?
    let temp, feelsLike: Double?
    let pressure, humidity: Double?
    let dewPoint, uvi: Double?
    let clouds, visibility: Double?
    let windSpeed: Double?
    let windDeg: Double?
    let weather: [Weather]?
    let windGust: Double?
    let pop: Double?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
        case windGust = "wind_gust"
        case pop
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Double?
    let main: Main?
    let description: Description?
    let icon: String?
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

// MARK: - Daily
struct Daily: Codable {
    let dt, sunrise, sunset, moonrise: Double?
    let moonset: Double?
    let moonPhase: Double?
    let temp: Temp?
    let feelsLike: FeelsLike?
    let pressure, humidity: Double?
    let dewPoint, windSpeed: Double?
    let windDeg: Double?
    let windGust: Double?
    let weather: [Weather]?
    let clouds: Double?
    let pop, uvi: Double?
    let rain: Double?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, uvi, rain
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double?
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}

// MARK: - Minutely
struct Minutely: Codable {
    let dt, precipitation: Double?
}
