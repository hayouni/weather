//
//  ViewController.swift
//  DemoApp
//
//  Created by esens on 28/02/2023.
//

import UIKit
import APIDataRetriever

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Service().getWeather(lat: "49,19690", lon: "4,13713", completion: { data in
            print(data)
        })
        
    }

  

}

