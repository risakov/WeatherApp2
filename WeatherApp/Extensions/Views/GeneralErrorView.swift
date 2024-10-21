//
//  GeneralErrorView.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 05.10.2024.
//
import UIKit

class GeneralErrorView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        view.addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let errorLabel = UILabel()
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
