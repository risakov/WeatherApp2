//
//  DaysForecastView.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 04.10.2024.
//
import UIKit

class DaysForecastView: UIView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()

    private func createHourForecastView(hour: String, nightTemperature: Int, dayTemperature: Int) -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        
        let hourLabel = UILabel()
        hourLabel.text = hour
        hourLabel.font = .systemFont(ofSize: 18)
        hourLabel.textAlignment = .left
        
        let nightTemperatureLabel = UILabel()
        nightTemperatureLabel.text = "\(nightTemperature)°"
        nightTemperatureLabel.font = .systemFont(ofSize: 18)
        nightTemperatureLabel.textAlignment = .center
        
        let dayTemperatureLabel = UILabel()
        dayTemperatureLabel.text = "\(dayTemperature)°"
        dayTemperatureLabel.font = .systemFont(ofSize: 18)
        dayTemperatureLabel.textAlignment = .right
        
        let stackView = UIStackView(arrangedSubviews: [hourLabel, nightTemperatureLabel, dayTemperatureLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        return view
    }

    private func setupViews() {
        addSubview(stackView)
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
    private func addSubviews() {
        addSubview(stackView)
    }
    
    private func setuplayout() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addSubviews()
        setuplayout()
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        addSubviews()
        setuplayout()
        }
    }
