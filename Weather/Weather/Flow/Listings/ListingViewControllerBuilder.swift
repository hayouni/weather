//
//  ListingViewControllerBuilder.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import Foundation

class ListingViewControllerBuilder {
    
    class func build(delegate: ListingViewControllerDelegate) -> ListingViewController {
        
        let listingViewController = ListingViewController.instantiate()
        listingViewController.viewModel = ListingViewModel()
        listingViewController.delegate = delegate
        
        return listingViewController
    }
}
 
