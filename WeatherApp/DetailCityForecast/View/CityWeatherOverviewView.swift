import Foundation
import UIKit
import SnapKit

class CityWeatherOverviewView: UIView {
    
    private let cityNameLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let weatherDescrLabel = UILabel()
    private let highTempLabel = UILabel()
    private let lowTempLabel = UILabel()
    private let stackView = UIStackView()
    private let horizontalStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        
        setupLabels()
        setupHorizontalStackView()
        setupStackView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLabels()
        setupHorizontalStackView()
        setupStackView()
        setupConstraints()
    }
    
    private func setupLabels() {
        cityNameLabel.text = Constants.cityName
        cityNameLabel.font = UIFont.systemFont(ofSize: Constants.cityLabelFont, weight: .regular)
        cityNameLabel.textColor = .white
        cityNameLabel.textAlignment = .center

        temperatureLabel.text = Constants.temp
        temperatureLabel.font = UIFont.systemFont(ofSize: Constants.tempLabelFont, weight: .thin)
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center

        weatherDescrLabel.text = Constants.weather
        weatherDescrLabel.font = UIFont.systemFont(ofSize: Constants.weatherLabelFont, weight: .regular)
        weatherDescrLabel.textColor = .white
        weatherDescrLabel.textAlignment = .center

        highTempLabel.text = Constants.highTemp
        highTempLabel.font = UIFont.systemFont(ofSize: Constants.bottomLabelsFont, weight: .regular)
        highTempLabel.textColor = .white
        highTempLabel.textAlignment = .center

        lowTempLabel.text = Constants.lowTemp
        lowTempLabel.font = UIFont.systemFont(ofSize: Constants.bottomLabelsFont, weight: .regular)
        lowTempLabel.textColor = .white
        lowTempLabel.textAlignment = .center
    }

    private func setupHorizontalStackView() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .center
        horizontalStackView.distribution = .equalSpacing
        horizontalStackView.spacing = Constants.horizontalStackViewSpacing
        horizontalStackView.backgroundColor = .black

        horizontalStackView.addArrangedSubview(highTempLabel)
        horizontalStackView.addArrangedSubview(lowTempLabel)
    }

    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = Constants.stackViewSpacing
        stackView.backgroundColor = .black

        stackView.addArrangedSubview(cityNameLabel)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(weatherDescrLabel)
        stackView.addArrangedSubview(horizontalStackView)

        addSubview(stackView)
    }

    private func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension CityWeatherOverviewView {
    private enum Constants {
        
        static let horizontalStackViewSpacing: CGFloat = 5
        static let stackViewSpacing: CGFloat = 10
        static let bottomLabelsFont: CGFloat = 21
        static let weatherLabelFont: CGFloat = 24
        static let tempLabelFont: CGFloat = 85
        static let cityLabelFont: CGFloat = 32
        static let cityName = "Rostov-on-Don"
        static let temp = "21°"
        static let weather = "Overcast Clouds"
        static let highTemp = "H:29°"
        static let lowTemp = "L:15°"
    }
}


@available(iOS 17.0, *)
#Preview {
    let view = CityWeatherOverviewView()
    
    view.snp.makeConstraints {
        $0.height.equalTo(224)
        $0.width.equalTo(225)
    }
    
    return view
}
