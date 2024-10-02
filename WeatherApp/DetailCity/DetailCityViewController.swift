//
//  DetailCityViewController.swift
//  WeatherApp
//
//  Created by Artyom Rybalko on 01.10.2024.
//

import Foundation
import UIKit
import SnapKit

class DetailCityViewController: UIViewController {
    let cityWeatherOverview = CityWeatherOverviewView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        setupBackgroundImageView()
        addCityOverview()
    }
    
    private func addCityOverview() {
        view.addSubview(cityWeatherOverview)
        cityWeatherOverview.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(500)
            make.right.left.equalToSuperview().inset(21)
        }
    }
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Background image")
        return imageView
    }()
    
    private func setupBackgroundImageView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    DetailCityViewController()
}
