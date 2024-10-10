import Foundation
import UIKit
import SnapKit

class DetailCityForecastWeatherView: UIView {
    
    private let model = DetailCityForecastWeatherModel(city: "Rostov-on-Don", temp: "21", weather: "Overcast Clouds")
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let cityLabel = UILabel()
    private let bottomLabel = UILabel()
    
    private func setupLabels() {
        cityLabel.text = model.city
        cityLabel.textColor = .white
        cityLabel.font = UIFont.systemFont(ofSize: 34)
        
        bottomLabel.text = "\(model.temp)° | \(model.weather)"
        bottomLabel.textColor = .white
        bottomLabel.font = UIFont.systemFont(ofSize: 24)
    }
    
    private func setupStackView() {
        
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(bottomLabel)
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(5)
        }
        
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(-30)
            make.left.equalTo(stackView.snp.left).offset(7)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.height.equalTo(77)
            $0.width.equalTo(235)
            $0.top.equalToSuperview().offset(30)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(30)
        }
        
        setupLabels()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Previews
@available(iOS 17, *)
#Preview("DetailCityForecastWeatherView") {
    let view = DetailCityForecastWeatherView()
    return view
}

