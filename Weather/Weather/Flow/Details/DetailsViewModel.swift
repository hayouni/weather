//
//  ListingViewModel.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import Foundation
import APIDataRetriever

protocol DetailsViewModelProtocol {
    var city: Task?  { get }    
    func getData(completion: @escaping (WeatherDetailEntity?) -> Void)
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    var city: Task?
    var service: ServiceProtocol?
    
    init( city: Task?, service: ServiceProtocol) {
        self.service = service
        self.city = city
    }
    func getData(completion: @escaping (WeatherDetailEntity?) -> Void) {
        service?.getWeather(lat: city?.lat ?? "",
                            lon: city?.lon ?? "",
                            completion: { [weak self] data in
            completion(data?.asEntity ?? self?.city?.weather?.asEntity)
        })
    }
}
