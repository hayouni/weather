//
//  AddCityViewControllerBuilder.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import Foundation

class AddCityViewControllerBuilder {
    
    class func build(delegate: AddCityViewControllerDelegate) -> AddCityViewController {
        
        let addBeneficiaryViewController = AddCityViewController.instantiate()
        addBeneficiaryViewController.viewModel = AddCityViewModel(coreDataManager: CoreDataManager.shared)
        addBeneficiaryViewController.delegate = delegate
        
        return addBeneficiaryViewController
    }
}
 
