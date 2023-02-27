//
//  WeatherDetails+CoreDataProperties.swift
//  Weather
//
//  Created by esens on 27/02/2023.
//

import Foundation
 
extension WeatherDetail: BaseModel  {}

extension WeatherDetail {

    var asEntity: WeatherDetailEntity {
        
        WeatherDetailEntity(sunrise: sunrise,
                            sunset: sunset,
                            humidity: humidity,
                            visibility: visibility,
                            weather: weather ?? "Clear" ,
                            weatherIcon: icon)
  
        
    }
    
}
