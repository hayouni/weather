//
//  HomeListTableViewCell.swift
//  Weather
//
//  Created by esens on 27/02/2023.
//

import UIKit

class HomeListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - RecepiesTableViewCell
extension HomeListTableViewCell {
    
    // MARK: - Configurations
    public func setup(title: String?) {
        self.title.text = title
    }
}
