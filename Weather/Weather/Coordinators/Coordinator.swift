//
//  Coordinator.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//


import Foundation
import UIKit

public protocol CoordinatorProtocol : AnyObject {
    init(navigationController:UINavigationController)
    func start()
}

class Coordinator: CoordinatorProtocol {

    unowned let rootController:UINavigationController
    // initiate navigationController
    required init(navigationController: UINavigationController) {
        self.rootController = navigationController
    }
    // start Coordinator
    func start() {
        let listingViewController = ListingViewControllerBuilder.build(delegate: self)
        rootController.isNavigationBarHidden = true
        rootController.setViewControllers([listingViewController], animated: false)
    }
}

extension Coordinator: ListingViewControllerDelegate {
    // Show detail View
    func showDetail(city: Task?) {
        let detailsViewController = DetailsViewControllerBuilder.build(delegate: self, city: city)
        rootController.pushViewController(detailsViewController, animated: true)
    }
    func addCity() {
        let detailsViewController = AddCityViewControllerBuilder.build(delegate: self)
        rootController.pushViewController(detailsViewController, animated: true)
    }
}

extension Coordinator: DetailsViewControllerDelegate {
    // Show detail View
    func showList() {
        rootController.popViewController(animated: true)
    }
}

extension Coordinator: AddCityViewControllerDelegate {
    func succed() {
        rootController.popViewController(animated: true)
    }
}


