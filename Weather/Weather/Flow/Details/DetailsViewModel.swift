//
//  ListingViewModel.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import Foundation

protocol DetailsViewModelProtocol {
    var iban: String  { get }
 }

class DetailsViewModel: DetailsViewModelProtocol {
    
    var city: Task?
    
    init( city: Task?) {
        self.city = city
    }
    
    // get iban from manager
    var iban: String {
        return "beneficiaryManager.iban.orEmpty"
    }
}
