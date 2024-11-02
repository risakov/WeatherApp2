//
//  DetailCityCoordinator.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 20.10.2024.
//

import UIKit

class DetailCityCoordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func openDetailCityModule() {
        let detailCityViewModel = DetailCityViewModel()
        let detailCityViewController = DetailCityViewController(viewModel: detailCityViewModel)
        navigationController.pushViewController(detailCityViewController, animated: true)
    }
}
