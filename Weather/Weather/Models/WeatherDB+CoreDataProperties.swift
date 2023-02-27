////
////  WeatherDB+CoreDataProperties.swift
////  Weather
////
////  Created by esens on 24/02/2023.
////
//
//
//import Foundation
//import CoreData
//@objc(WeatherDB)
////public class WeatherDB: NSManagedObject {
////
////}
//
//extension WeatherDB {
//    
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherDB> {
//        return NSFetchRequest<WeatherDB>(entityName: "WeatherDB")
//    }
//    
//    @nonobjc public class func fetchRequest(source: String) -> NSFetchRequest<WeatherDB> {
//        let request = NSFetchRequest<WeatherDB>(entityName: "WeatherDB")
//        request.predicate = NSPredicate(format: "source == %@", source)
//        return request
//    }
//    
//    @nonobjc public class func fetchRequest(date: Date) -> NSFetchRequest<WeatherDB> {
//        let request = NSFetchRequest<WeatherDB>(entityName: "WeatherDB")
//        request.predicate = NSPredicate(format: "date == %@", date as NSDate)
//        return request
//    }
//
//    @NSManaged public var city: String?
//    @NSManaged public var country: String?
//    @NSManaged public var date: Date?
//    @NSManaged public var humidity: Int64
//    @NSManaged public var pressure: Int64
//    @NSManaged public var wind: Double
//    @NSManaged public var icon: String?
//    @NSManaged public var temp: Double
//    @NSManaged public var tempMax: Double
//    @NSManaged public var tempMin: Double
//    @NSManaged public var lat: Double
//    @NSManaged public var lon: Double
//    @NSManaged public var source: String?
//    @NSManaged public var main: String?
//    
//    func getMappedWeather() -> (WeatherJSON, Date) {
//        return (WeatherJSON(coord: Coord(lon: lon,
//                                        lat: lat),
//                           weather: [Weather(main: main ?? "",
//                                             icon: icon ?? "",
//                                             weatherDescription: "")],
//                           main: Main(temp: temp,
//                                        tempMin: tempMin,
//                                        tempMax: tempMax,
//                                        pressure: Int(pressure),
//                                        humidity: Int(humidity)),
//                           wind: Wind(speed: wind),
//                           sys: Sys(country: country ?? ""),
//                           name: city ?? "",
//                           cod: 0),
//                           date ?? Date())
//    }
//    
//    func setValues(weather: WeatherJSON) {
//        self.city = weather.name ?? ""
//        self.country = weather.sys.country ?? ""
//        self.icon = weather.weather.first?.icon ?? ""
//        self.temp = weather.main.temp ?? 0.0
//        self.tempMax = weather.main.tempMax ?? 0.0
//        self.tempMin = weather.main.tempMin ?? 0.0
//        self.lat = weather.coord.lat ?? 0.0
//        self.lon = weather.coord.lon ?? 0.0
//        self.date = Date()
//        self.pressure = Int64(weather.main.pressure ?? 0)
//        self.humidity = Int64(weather.main.humidity ?? 0)
//        self.wind = weather.wind.speed ?? 0.0
////        self.source = "source.rawValue"
//        self.main = weather.weather.first?.main ?? ""
//    }
//}
