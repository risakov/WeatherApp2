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
    
    private let hoursDict: [String: Int] = [
        "Now": 21,
        "10PM": 22,
        "11PM": 23,
        "12AM": 24,
        "1AM": 1]
    
    private let temperaturesDict: [String: Int] = [
        "Now": 21,
        "10PM": 21,
        "11PM": 19,
        "12AM": 19,
        "1AM": 19]
    
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
        
        for (hour, _ ) in hoursDict {
                let label = UILabel()
                label.text = hour
                label.font = .systemFont(ofSize: Constants.fontSize)
                label.textColor = .white
                
            if let temperature = temperaturesDict[hour] {
                let temperatureLabel = UILabel()
                temperatureLabel.text = "\(temperature)°"
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
