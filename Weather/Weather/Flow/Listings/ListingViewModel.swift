//
//  ListingViewModel.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import Foundation

protocol ListingViewModelProtocol {
    var iban: String  { get }
    func performFetch(completionHandler: @escaping () -> Void)
    var numberOfItems: Int  { get }
    func cityName(for index: Int) -> String?
    func city(for index: Int) -> Task?
}

class ListingViewModel: ListingViewModelProtocol {
    
    var taskList: [Task] = []
    // get iban from manager
    var iban: String {
        return "beneficiaryManager.iban.orEmpty"
    }
    func performFetch(completionHandler: @escaping () -> Void) {
        CoreDataManager.shared.performFetch { tasks in
            self.taskList = tasks
            completionHandler()
        }
    }
    var numberOfItems: Int {
        taskList.count
    }
    func cityName(for index: Int) -> String? {
        taskList[index].name
    }
    func city(for index: Int) -> Task? {
        taskList[index]
    }
}
