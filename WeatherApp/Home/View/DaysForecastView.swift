//
//  DaysForecastView.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 04.10.2024.
//
import UIKit
import SnapKit

class DaysForecastView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()

    private var topLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16)
        label.text = "1-DAY FORECAST (every 3 hours)"
        return label
    }()
    
    private var calendarImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "calendar"))
        image.contentMode = .scaleAspectFill
        image.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        image.tintColor = .lightGray
        return image
    }()
    
    private func createHourForecastView(hour: String, nightTemperature: Int, dayTemperature: Int) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10

        let hourLabel = UILabel()
        hourLabel.text = hour
        hourLabel.font = .systemFont(ofSize: 26)
        hourLabel.textAlignment = .left
        hourLabel.textColor = .white
        
        let nightTemperatureLabel = UILabel()
        nightTemperatureLabel.text = "\(nightTemperature)°"
        nightTemperatureLabel.font = .systemFont(ofSize: 26)
        nightTemperatureLabel.textAlignment = .center
        nightTemperatureLabel.textColor = .lightGray
        
        let dayTemperatureLabel = UILabel()
        dayTemperatureLabel.text = "\(dayTemperature)°"
        dayTemperatureLabel.font = .systemFont(ofSize: 26)
        dayTemperatureLabel.textAlignment = .right
        dayTemperatureLabel.textColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [hourLabel, nightTemperatureLabel, dayTemperatureLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 100
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        return view
    }

    private func setupViews() {
        addSubview(stackView)
        addSubview(calendarImage)
        addSubview(topLabel)
        
        for (hour, nightTemperature, dayTemperature) in [
            ("17:44", 15, 29),
            ("20:44", 15, 29),
            ("23:44", 15, 29),
            ("02:44", 15, 29),
            ("05:44", 15, 29),
            ("08:44", 15, 29),
            ("11:44", 15, 29),
            ("14:44", 15, 29)
        ] {
            let hourForecastView = createHourForecastView(hour: hour, nightTemperature: nightTemperature, dayTemperature: dayTemperature)
            stackView.addArrangedSubview(hourForecastView)
        }
    }
    
    private func setuplayout() {
        calendarImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(calendarImage.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
        }
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(topLabel.snp.bottom).offset(20)
            make.bottom.equalToSuperview().inset(10)
        }
        for view in stackView.arrangedSubviews{
            view.snp.makeConstraints { make in
                make.height.equalTo(1)
            }
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setuplayout()
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setuplayout()
        }
    }
