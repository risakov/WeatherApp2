//
//  NextHoursView.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 10.10.2024.
//

import UIKit

class NextHoursView: UIView {
    
    enum Constants {
        
        static let fontSize: CGFloat = 17
        static let temperatureFontSize: CGFloat = 19
        static let spacing: CGFloat = 4
        static let cornerRadius: CGFloat = 10
        static let borderWidth: CGFloat = 1
    }
    
    private let hours: [String] = ["Now", "10PM", "11PM", "12AM", "1AM"]
    private let temperatures: [Int] = [21, 21, 19, 19, 19]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        layer.cornerRadius = Constants.cornerRadius
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        for (index, hour) in hours.enumerated() {
            if index < temperatures.count {
                let label = UILabel()
                label.text = hour
                label.font = .systemFont(ofSize: Constants.fontSize)
                label.textColor = .white
                
                let temperatureLabel = UILabel()
                temperatureLabel.text = "\(temperatures[index])°"
                temperatureLabel.font = .systemFont(ofSize: Constants.temperatureFontSize)
                temperatureLabel.textColor = .white
                
                let stackViewItem = UIStackView(arrangedSubviews: [label, temperatureLabel])
                stackViewItem.axis = .vertical
                stackViewItem.spacing = Constants.spacing
                
                stackView.addArrangedSubview(stackViewItem)
            }
        }
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(60)
        }
        
        backgroundColor = .black
        layer.cornerRadius = Constants.cornerRadius
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = UIColor.white.cgColor
    }
}
