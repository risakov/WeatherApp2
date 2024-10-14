//
//  ShortForecastView.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 10.10.2024.
//

import UIKit

class ShortForecastView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        return stackView
    }()
    
    private func createLabel(text: String, fontSize: CGFloat = 16, weight: UIFont.Weight = .regular) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: fontSize, weight: weight)
        label.textColor = .white
        
        return label
    }
    
    private func createForecastRow(weather: WeatherOnTime) -> UIStackView {
        let hourLabel = createLabel(text: weather.hour)
        let dayTemperatureLabel = createLabel(text: "\(weather.dayTemperature)°", fontSize: 20, weight: .medium)
        let nightTemperatureLabel = createLabel(text: "\(weather.nightTemperature)°", fontSize: 20, weight: .medium)
        
        let rowStackView = UIStackView(arrangedSubviews: [hourLabel, dayTemperatureLabel, nightTemperatureLabel])
        rowStackView.axis = .vertical
        rowStackView.distribution = .equalSpacing
        
        return stackView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        addSubview(stackView)
        
        let titleLabel = createLabel(text: "1-DAY FORECAST (every 3 hours)", fontSize: 14)
        stackView.addArrangedSubview(titleLabel)
        
        let forecastData: [WeatherOnTime] = [
            WeatherOnTime(hour: "17:44", dayTemperature: 29, nightTemperature: 15),
            WeatherOnTime(hour: "20:44", dayTemperature: 29, nightTemperature: 15),
            WeatherOnTime(hour: "23:44", dayTemperature: 29, nightTemperature: 15)]
        
        for data in forecastData {
            let row = createForecastRow(weather: data)
            stackView.addArrangedSubview(row)
        }
        
        self.addSubview(stackView)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
