//
//  AddCityViewModel.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import UIKit

protocol AddCityViewModelProtocol {
    var iban: String  { get }
    func addTask()
    func updateData(textField: UITextField)
}

class AddCityViewModel: AddCityViewModelProtocol {
    var coreDataManager: CoreDataManager
    var title: String = ""
    var lon: Double = 0.0
    var lat: Double = 0.0

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    // get iban from manager
    var iban: String {
        return "beneficiaryManager.iban.orEmpty"
    }
    
    func addTask() {
        coreDataManager.addTask(title: title, lat: lat,lon: lon)
    }
    // save user inputs in data manager
    func updateData(textField: UITextField) {
        switch InputFieldTag(rawValue: textField.tag) {
        case .nameInputField:
            title = textField.text.orEmpty
        case .latInputField:
            lat = Double(textField.text.orEmpty) ?? 0.0
        case .lonInputField:
            lon = Double(textField.text.orEmpty) ?? 0.0
        case .none:
            return
        }
    }
  }
