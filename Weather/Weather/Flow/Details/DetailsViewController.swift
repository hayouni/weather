//
//  DetailsViewController.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import UIKit

protocol DetailsViewControllerDelegate: AnyObject {
    func showList()
}

class DetailsViewController: UIViewController, Storyboarded {

    var viewModel: DetailsViewModelProtocol?
    var delegate: DetailsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
