//
//  ShortForecastView.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 30.09.2024.
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
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.textColor = .white
        return label
    }
    
    
    private func createForecastRow(weather: WeatherOnTime) -> UIStackView {
        let timeLabel = createLabel(text: weather.time)
        let dayTemperatureLabel = createLabel(text: "\(weather.dayTemperature)°", fontSize: 20, weight: .medium)
        let nightTemperatureLabel = createLabel(text: "\(weather.nightTemperature)°", fontSize: 20, weight: .medium)
        
        let rowStackView = UIStackView(arrangedSubviews: [timeLabel, dayTemperatureLabel, nightTemperatureLabel])
        rowStackView.axis = .vertical
        rowStackView.distribution = .equalSpacing
        
        return rowStackView
    }
    
    private func setupViews() {
        let titleLabel = createLabel(text: "1-DAY FORECAST (every 3 hours)", fontSize: 14)
        stackView.addArrangedSubview(titleLabel)
        
        let forecastData: [WeatherOnTime] = [
            WeatherOnTime(time: "17:44", dayTemperature: 29, nightTemperature: 15),
            WeatherOnTime(time: "20:44", dayTemperature: 29, nightTemperature: 15),
            WeatherOnTime(time: "23:44", dayTemperature: 29, nightTemperature: 15)]
        
        for data in forecastData {
            let row = createForecastRow(weather: data)
            stackView.addArrangedSubview(row)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
