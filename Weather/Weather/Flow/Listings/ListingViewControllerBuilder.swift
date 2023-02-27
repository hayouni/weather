//
//  ListingViewControllerBuilder.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import Foundation

class ListingViewControllerBuilder {
    
    class func build(delegate: ListingViewControllerDelegate) -> ListingViewController {
        
        let addBeneficiaryViewController = ListingViewController.instantiate()
        addBeneficiaryViewController.viewModel = ListingViewModel()
        addBeneficiaryViewController.delegate = delegate
        
        return addBeneficiaryViewController
    }
}
 
