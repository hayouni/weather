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
    
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var sunset: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var visibility: UILabel!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    var viewModel: DetailsViewModelProtocol?
    var delegate: DetailsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.getData { entity in
            self.setupView(entity: entity)
        }
        
    }
    private func setupView(entity: WeatherDetailEntity?) {
        guard let data = entity else { return }
        DispatchQueue.main.async {
            self.setupUI(data)
        }
        persistData(data)
    }
    private func persistData(_ data: WeatherDetailEntity) {
        CoreDataManager.shared.saveWeather(weather: data.weather,
                                           icon: data.weatherIcon,
                                           visibility: data.visibility,
                                           sunset: data.sunset,
                                           humidity: data.humidity,
                                           task: viewModel?.city,
                                           sunrise: data.sunrise)
        
    }
    private func setupUI(_ data: WeatherDetailEntity) {
        sunrise.text = String(describing: data.sunrise ?? 0)
        sunset.text =  String(describing: data.sunset ?? 0)
        humidity.text = String(describing: data.humidity ?? 0)
        visibility.text = String(describing: data.visibility ?? 0)
        weather.text = String(describing: data.weather ?? "")
        weatherIcon.image = UIImage(named: data.weatherIcon ?? "")
    }
}
