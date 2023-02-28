//
//  DetailsViewControllerBuilder.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import Foundation
import APIDataRetriever

class DetailsViewControllerBuilder {
    
    class func build(delegate: DetailsViewControllerDelegate, city: Task?) -> DetailsViewController {
        
        let addBeneficiaryViewController = DetailsViewController.instantiate()
        addBeneficiaryViewController.viewModel = DetailsViewModel(city: city, service: Service())
        addBeneficiaryViewController.delegate = delegate
        
        return addBeneficiaryViewController
    }
}
 
