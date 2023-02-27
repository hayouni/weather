//
//  ListingViewModel.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import Foundation

protocol DetailsViewModelProtocol {
    var city: Task?  { get }    
    func getData(completion: @escaping (WeatherDetailEntity?) -> Void)
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    var city: Task?
    var service: Service?
    
    init( city: Task?, service: Service) {
        self.service = service
        self.city = city
    }
    func getData(completion: @escaping (WeatherDetailEntity?) -> Void) {
        service?.getWeather(lat: city?.lat ?? "",
                            lng: city?.lon ?? "",
                            completion: { [weak self] entity in
            completion(entity ?? self?.city?.weather?.asEntity)
        })
    }
}
