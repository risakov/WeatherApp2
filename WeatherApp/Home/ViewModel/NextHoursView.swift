//
//  NextHoursView.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 29.09.2024.
//

import UIKit

class NextHoursView: UIView {

    let hours: [String] = ["Now", "10PM", "11PM", "12AM", "1AM"]
    let temperatures: [Int] = [21, 21, 19, 19, 19]

    private let fontSize: CGFloat = 17
    private let temperatureFontSize: CGFloat = 19
    private let spacing: CGFloat = 4
    private let cornerRadius: CGFloat = 10
    private let borderWidth: CGFloat = 1

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing

        for (index, hour) in hours.enumerated() {
            if index < temperatures.count {
                let label = UILabel()
                label.text = hour
                label.font = .systemFont(ofSize: fontSize)
                label.textColor = .white

                let temperatureLabel = UILabel()
                temperatureLabel.text = "\(temperatures[index])°"
                temperatureLabel.font = .systemFont(ofSize: temperatureFontSize)
                temperatureLabel.textColor = .white

                let stackViewItem = UIStackView(arrangedSubviews: [label, temperatureLabel])
                stackViewItem.axis = .vertical
                stackViewItem.spacing = spacing

                stackView.addArrangedSubview(stackViewItem)
            }
        }

        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        backgroundColor = .black
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = UIColor.white.cgColor
    }
}

