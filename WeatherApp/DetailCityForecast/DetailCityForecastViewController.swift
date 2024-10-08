import UIKit

class DetailCityForecastViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = Constants.title
    }
    
}

// MARK: - Constants
extension DetailCityForecastViewController {
    
    private enum Constants {
        
        static let title = "DetailCity"
    }
}


// MARK: - Previews
@available(iOS 17, *)
#Preview("DetailCityForecastViewController") {
    return UINavigationController(rootViewController: DetailCityForecastViewController())
}
