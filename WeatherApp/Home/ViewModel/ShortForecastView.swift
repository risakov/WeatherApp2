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

    private func createForecastRow(time: String, dayTemperature: Int, nightTemperature: Int) -> UIStackView {
        let timeLabel = createLabel(text: time)
        let dayTemperatureLabel = createLabel(text: "\(dayTemperature)°", fontSize: 20, weight: .medium)
        let nightTepmeratureLabel = createLabel(text: "\(nightTemperature)°", fontSize: 20, weight: .medium)

        let rowStackView = UIStackView(arrangedSubviews: [timeLabel, dayTemperatureLabel, nightTepmeratureLabel])
        rowStackView.axis = .vertical
        rowStackView.distribution = .equalSpacing

        return rowStackView
    }

    private func setupViews() {
        let titleLabel = createLabel(text: "1-DAY FORECAST (every 3 hours)", fontSize: 14)
        stackView.addArrangedSubview(titleLabel)

        let forecastData: [(String, Int, Int)] = [
            ("17:44", 15, 29),
            ("20:44", 15, 29),
            ("23:44", 15, 29)
        ]

        for data in forecastData {
            let row = createForecastRow(time: data.0, dayTemperature: data.1, nightTemperature: data.2)
            stackView.addArrangedSubview(row)
        }

        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

