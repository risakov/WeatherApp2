import UIKit
import SnapKit

class HomeCell: UITableViewCell {
    
    private let containerView = UIView()
    private let titleLabel: UILabel = UILabel()
    private let subtitleLabel: UILabel = UILabel()
    private let conditionsLabel: UILabel = UILabel()
    private let weatherDergreesLabel: UILabel = UILabel()
    private let feelsLikeDergreesLabel: UILabel = UILabel()
    private let separatorView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    private func setupViews() {
        contentView.addSubview(containerView)
        contentView.addSubview(separatorView)
        contentView.backgroundColor = .black
        
        setupContainerView()
        setupLabels()
        setupConstraints()
    }
    
    private func setupContainerView() {
        containerView.layer.cornerRadius = Constants.cornerRadius
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(conditionsLabel)
        containerView.addSubview(weatherDergreesLabel)
        containerView.addSubview(feelsLikeDergreesLabel)
    }
    
    private func setupLabels() {
        titleLabel.font = .title
        subtitleLabel.font = .subtitle
        conditionsLabel.font = .subtitle
        weatherDergreesLabel.font = .bigDegrees
        feelsLikeDergreesLabel.font = .subtitle
        
        titleLabel.textColor = .white
        subtitleLabel.textColor = .white
        conditionsLabel.textColor = .white
        weatherDergreesLabel.textColor = .white
        feelsLikeDergreesLabel.textColor = .white
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().inset(16)
        }
        separatorView.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(11)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(16)
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.left.equalToSuperview().offset(16)
        }
        conditionsLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.left.equalToSuperview().offset(16)
        }
        weatherDergreesLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.right.equalToSuperview().inset(16)
        }
        feelsLikeDergreesLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.right.equalToSuperview().inset(16)
        }
    }
}

// MARK: - Updating
extension HomeCell {
    
    func update(with viewModel: HomeCellViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        conditionsLabel.text = viewModel.conditions
        weatherDergreesLabel.text = viewModel.weatherDegrees
        feelsLikeDergreesLabel.text = viewModel.feelsLike
        containerView.backgroundColor = viewModel.backgroundColor
    }
}

// MARK: - Constants
extension HomeCell {
    
    enum Constants {
        
        static let identifier: String = "homeCellIdentifier"
        static let cornerRadius: CGFloat = 16
    }
}

// MARK: - Previews
@available(iOS 17, *)
#Preview("HomeCell") {
    let cell = HomeCell()
    cell.snp.makeConstraints {
        $0.height.equalTo(117)
    }
    cell.update(
        with:
            HomeCellViewModel(
                weatherResponse:
                    WeatherResponse(
                        coord: .init(lat: 10.99, lon: 44.34),
                        weather: [WeatherParameters(main: "Rain")],
                        main: WeatherMainParameters(
                            temp: 29.48,
                            feelsLike: 29.74
                        ),
                        dt: 1661870592,
                        timezone: 7200,
                        name: "Rostov-on-Don"
                    )
            )
    )
    return cell
}
