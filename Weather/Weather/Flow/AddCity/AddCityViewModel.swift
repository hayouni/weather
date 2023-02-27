//
//  AddCityViewModel.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import UIKit

protocol AddCityViewModelProtocol {
    func addTask()
    func updateData(textField: UITextField)
}

class AddCityViewModel: AddCityViewModelProtocol {
    var coreDataManager: CoreDataManager
    var title: String = ""
    var lon: String = ""
    var lat: String = ""

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    func addTask() {
        coreDataManager.addTask(title: title,
                                lat: lat,
                                lon: lon)
    }
    func updateData(textField: UITextField) {
        switch InputFieldTag(rawValue: textField.tag) {
        case .nameInputField:
            title = textField.text.orEmpty
        case .latInputField:
            lat = textField.text.orEmpty
        case .lonInputField:
            lon = textField.text.orEmpty
        case .none:
            return
        }
    }
  }
