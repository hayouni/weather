//
//  Service.swift
//  APIDataRetriever
//
//  Created by esens on 28/02/2023.
//

import Foundation
public protocol ServiceProtocol: AnyObject {
    func getWeather(lat: String, lon: String, completion: @escaping (WeatherData?) -> Void)
}

public final class Service: ServiceProtocol {
    
    public init() {}
    private struct K {
        static let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=%@&lon=%@&appid=%@"
        static let APIKey = "9872cf2db2b7f253bfd07c00eb5c255d"
    }
    
    /// fetch Recepies List
    /// - Parameter completion: RecipeEntities?
    public func getWeather(lat: String, lon: String, completion: @escaping (WeatherData?) -> Void) {
        Network.shared.fetchData(url: String(format: K.urlString, lat, lon, K.APIKey)  ) { (result : (Result<WeatherData?, Error>)?) in
            switch result {
            case.success(let companies):
                completion(companies)
            case.failure(_):
                completion(nil)
            case .none:
                print("error")
            }
        }
    }
    
}
