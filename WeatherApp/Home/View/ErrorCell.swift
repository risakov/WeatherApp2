import UIKit
import SnapKit

class ErrorCell : UITableViewCell {
    private let errorContainerView: UIView = UIView()
    private let errorLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup
    
    private func setupViews() {
        contentView.addSubview(errorContainerView)
        contentView.backgroundColor = .black
        
        setupContainerView()
        setupLabel()
        setupConstraints()
    }
    
    private func setupContainerView() {
        errorContainerView.backgroundColor = UIColor(hexCode: Constants.containerBackgroundColor)
        errorContainerView.layer.cornerRadius = Constants.corderRadius
        
        errorContainerView.addSubview(errorLabel)
    }
    
    private func setupLabel() {
        errorLabel.numberOfLines = Constants.numberOfLines
        errorLabel.textAlignment = .center
        errorLabel.text = Constants.errorLabelText
        errorLabel.textColor = .white
        errorLabel.font = .systemFont(ofSize: Constants.errorLabelFont, weight: .medium)
    }
    
    private func setupConstraints() {
        errorContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(Constants.containerSide)
            $0.right.equalToSuperview().inset(Constants.containerSide)
            $0.height.equalTo(Constants.containerHeight)
        }
        
        errorLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.labelTop)
            $0.left.equalTo(errorContainerView.snp.left).offset(Constants.labelSide)
            $0.right.equalTo(errorContainerView.snp.right).inset(Constants.labelSide)
        }
    }
}

//MARK: Constants
extension ErrorCell {
    
    enum Constants {
        static let identifier: String = "ErrorCell"
        static let corderRadius: CGFloat = 16
        static let errorLabelText: String = "Unfortunately, we can’t find any city \nlike that \nPlease try another one"
        static let containerBackgroundColor: String = "#9C4444"
        static let numberOfLines: Int = 3
        static let errorLabelFont: CGFloat = 19
        static let containerHeight: Int = 117
        static let containerSide: Int = 10
        static let labelTop: Int = 25
        static let labelSide: Int = 20
    }
}

//MARK: Preview
@available(iOS 17, *)
#Preview("ErrorCell") {
    let cell = ErrorCell()
    cell.snp.makeConstraints {
        $0.height.equalTo(117)
    }
    
    return cell
}
