//
//  AddCityViewController.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import UIKit

public enum InputFieldTag: Int {
    case nameInputField = 0
    case latInputField = 1
    case lonInputField = 2
}

protocol AddCityViewControllerDelegate: AnyObject {
    func succeded()
}

class AddCityViewController: UIViewController, Storyboarded {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var latTextField: UITextField!
    @IBOutlet weak var lonTextField: UITextField!
    
    var viewModel: AddCityViewModelProtocol?
    var delegate: AddCityViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView() {
        nameTextField.delegate = self
        latTextField.delegate = self
        lonTextField.delegate = self
        
        nameTextField.tag = InputFieldTag.nameInputField.rawValue
        latTextField.tag = InputFieldTag.latInputField.rawValue
        lonTextField.tag = InputFieldTag.lonInputField.rawValue
    }
    @IBAction func addCityHandleAction(_ sender: Any) {
        viewModel?.addTask()
        delegate?.succeded()
    }
}
// MARK: - UITextFieldDelegate
extension AddCityViewController: UITextFieldDelegate {
    @available(iOS 13, *)
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textFieldDidChange(textField)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        viewModel?.updateData(textField: textField)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel?.updateData(textField: textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewModel?.updateData(textField: textField)
        textField.resignFirstResponder()
        return true
    }
    
}
