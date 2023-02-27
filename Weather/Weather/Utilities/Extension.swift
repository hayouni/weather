//
//  Extension.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import Foundation

import UIKit

// MARK: - Storyboarded
protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
extension UIView {
    
    func strokeBorder() {
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
    }
}

public extension UITableView {

    func registerNibCell<T: UITableViewCell>(ofType type: T.Type) {
        let nib = UINib(nibName: String(describing: type), bundle: Bundle(for: type))
        register(nib, forCellReuseIdentifier: type.reuseIdentifier)
    }
    func dequeueReusableCell<T: UITableViewCell>(ofType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Cannot create reusable cell with type \(String(describing: self))). Did you register the cell for the table view? Did you set the cell identifier right?")
        }
        return cell
    }
}

public extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public extension Optional where Wrapped == String {
   var orEmpty: String { self ?? "" }
}
