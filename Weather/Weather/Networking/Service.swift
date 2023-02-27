//
//  Service.swift
//  Weather
//
//  Created by esens on 27/02/2023.
//

import Foundation

protocol ServiceProtocol: AnyObject {
    func getWeather(lat: String, lng: String, completion: @escaping (WeatherDetailEntity?) -> Void)
}

class Service: ServiceProtocol {

    static let shared = Service()
    struct K {
        static let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=%@&lon=%@&appid=%@"
        static let APIKey = "9872cf2db2b7f253bfd07c00eb5c255d"
    }

    /// fetch Recepies List
    /// - Parameter completion: RecipeEntities?
    func getWeather(lat: String, lng: String, completion: @escaping (WeatherDetailEntity?) -> Void) {
        Network.shared.fetchData(url: String(format: K.urlString, lat, lng, K.APIKey)  ) { (result : (Result<WeatherData?, Error>)?) in
            switch result {
            case.success(let companies):
                 completion(companies?.asEntity)
             case.failure(_):
                completion(nil)
            case .none:
                print("error")
            }
        }
    }

}
