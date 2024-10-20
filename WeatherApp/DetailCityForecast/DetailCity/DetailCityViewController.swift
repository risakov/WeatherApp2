//
//  DetailCityViewController.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 20.10.2024.
//

import UIKit

class DetailCityViewController: UIViewController {
    var viewModel: DetailCityViewModel?

    init(viewModel: DetailCityViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

