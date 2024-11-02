//
//  GeneralErrorView.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 21.10.2024.
//

import UIKit

class GeneralErrorView: UIViewController {
    let errorLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        errorLabel.text = "Sorry, \nsomething went \nwrong \nPlease try again"
        errorLabel.font = .systemFont(ofSize: 35, weight: .bold)
        errorLabel.textAlignment = .center
        errorLabel.textColor = .white
        view.addSubview(errorLabel)

        errorLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
