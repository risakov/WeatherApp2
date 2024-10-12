import Foundation
import UIKit
import SnapKit

class DetailCityForecastWeatherView: UIView {
    
    private let model = DetailCityForecastWeatherModel(city: "Rostov-on-Don", temp: 21, weather: "Overcast Clouds")
    
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
        self.addSubview(stackView)
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(bottomLabel)
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(5)
        }
        
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom)
            make.left.equalTo(stackView.snp.left).offset(7)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()

        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    view.backgroundColor = .black
    view.snp.makeConstraints {
        $0.height.equalTo(77)
        $0.width.equalTo(235)
    }
    
    return view
}

