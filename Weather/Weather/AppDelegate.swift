//
//  AppDelegate.swift
//  Weather
//
//  Created by esens on 24/02/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    var appCoordinator : Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()

        // Initialise the coordinator with the main navigation controller
        appCoordinator = Coordinator(navigationController: window?.rootViewController as! UINavigationController)

        // The start method will actually display the main view
        appCoordinator?.start()
        window?.makeKeyAndVisible()
        return true
    }
}
