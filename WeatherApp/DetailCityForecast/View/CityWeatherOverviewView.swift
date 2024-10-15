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
        cityNameLabel.text = "Rostov-on-Don"
        cityNameLabel.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        cityNameLabel.textColor = .white
        cityNameLabel.textAlignment = .center

        temperatureLabel.text = "21°"
        temperatureLabel.font = UIFont.systemFont(ofSize: 70, weight: .thin)
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center

        weatherDescrLabel.text = "Overcast Clouds"
        weatherDescrLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        weatherDescrLabel.textColor = .white
        weatherDescrLabel.textAlignment = .center

        highTempLabel.text = "H:29°"
        highTempLabel.font = UIFont.systemFont(ofSize: 21, weight: .regular)
        highTempLabel.textColor = .white
        highTempLabel.textAlignment = .center

        lowTempLabel.text = "L:15°"
        lowTempLabel.font = UIFont.systemFont(ofSize: 21, weight: .regular)
        lowTempLabel.textColor = .white
        lowTempLabel.textAlignment = .center
    }

    private func setupHorizontalStackView() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .center
        horizontalStackView.distribution = .equalSpacing
        horizontalStackView.spacing = 10
        horizontalStackView.backgroundColor = .black

        horizontalStackView.addArrangedSubview(highTempLabel)
        horizontalStackView.addArrangedSubview(lowTempLabel)
    }

    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 7
        stackView.backgroundColor = .black

        stackView.addArrangedSubview(cityNameLabel)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(weatherDescrLabel)
        stackView.addArrangedSubview(horizontalStackView)

        addSubview(stackView)
    }

    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.centerY.equalTo(self.snp.centerY)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
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
