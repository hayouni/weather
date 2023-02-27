//
//  AddCityViewControllerBuilder.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import Foundation

class AddCityViewControllerBuilder {
    
    class func build(delegate: AddCityViewControllerDelegate) -> AddCityViewController {
        
        let addCityViewController = AddCityViewController.instantiate()
        addCityViewController.viewModel = AddCityViewModel(coreDataManager: CoreDataManager.shared)
        addCityViewController.delegate = delegate
        
        return addCityViewController
    }
}
 
