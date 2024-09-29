//
//  ForecastCityWeatherView.swift
//  WeatherApp
//
//  Created by Sergey on 9/28/24.
//

import UIKit

class DetailCityForecastViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.clear
        title = "DetailCity"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}


// MARK: - Previews
@available(iOS 17, *)
#Preview("DetailCityForecastViewController") {
    return UINavigationController(rootViewController: DetailCityForecastViewController())
}
