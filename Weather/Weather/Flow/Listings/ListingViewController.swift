//
//  ListingViewController.swift
//  Weather
//
//  Created by esens on 25/02/2023.
//

import UIKit

protocol ListingViewControllerDelegate: AnyObject {
    func showDetail(city: Task?)
    func addCity()
}

class ListingViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: ListingViewModelProtocol?
    var delegate: ListingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.performFetch {
            self.tableView.reloadData()
        }
    }
    @IBAction func addCityAction(_ sender: Any) {
        delegate?.addCity()
    }
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNibCell(ofType: HomeListTableViewCell.self)
    }
}

// MARK: - UITableViewDataSource
extension ListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfItems ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: HomeListTableViewCell.self, for: indexPath)
        cell.setup(title: viewModel?.cityName(for: indexPath.row))
        return cell
    }
}
// MARK: - UITableViewDelegate
extension ListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = viewModel?.city(for: indexPath.row)
        delegate?.showDetail(city: city)
    }
}
