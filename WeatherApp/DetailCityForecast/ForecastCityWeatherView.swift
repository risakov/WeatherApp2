import UIKit
import Combine

class ForecastCityWeatherView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.clear
        title = "DetailCity"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}


// MARK: - Previews
@available(iOS 17, *)
#Preview("ForecastCityWeatherView") {
    return UINavigationController(rootViewController: ForecastCityWeatherView())
}
