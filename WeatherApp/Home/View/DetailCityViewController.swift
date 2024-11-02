//
//  DetailCityViewController.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 10.10.2024.
//

import UIKit

class DetailCityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nextHoursView = NextHoursView()
        view.addSubview(nextHoursView)
        nextHoursView.translatesAutoresizingMaskIntoConstraints = false
    }
}
