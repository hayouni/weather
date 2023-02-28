//
//  ServiceMock.swift
//  WeatherTests
//
//  Created by esens on 28/02/2023.
//

import Foundation
import APIDataRetriever

class ServiceMock: ServiceProtocol {
    
    public init(){}
    
    let bundle = Bundle(for: ServiceMock.self)

    public func getWeather(lat: String, lon: String, completion: @escaping (WeatherData?) -> Void) {
        do {
            if let bundlePath = bundle.path(forResource: "Weather", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decodedData = try JSONDecoder().decode(WeatherData.self,
                                                           from: jsonData)
                completion(decodedData)
            }
        } catch {
            print(error)
            completion(nil)
        }
    }}
