//
//  Network.swift
//  Weather
//
//  Created by esens on 27/02/2023.
//

import Foundation
import Combine

 
public class Network {
    
    static let shared = Network()
    
    func fetchData<T: Decodable>(url: String ,completion: @escaping (Result<T?, Error>) ->())  {
        
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let donationArray = try JSONDecoder().decode(T.self, from: data!)
                completion (.success(donationArray))
            } catch let JsonError {
                completion(.failure(JsonError))
            }
            
        }.resume()
    }
    
    
}
