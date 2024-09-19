import UIKit
import Combine
import CoreLocation

class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel(weatherService: WeatherServiceImpl.shared)
    private var tableView = UITableView(frame: .zero)
    private var cancellable = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBarStyle()
    }
        
    private func setupNavigationBarStyle() {
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.clear
        title = Constants.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        view.addSubview(tableView)

        tableView.backgroundColor = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.Constants.identifier)
    }
    
    // MARK: - Binding
    private func setupBinding() {
        viewModel.$weatherArray
        .receive(on: RunLoop.main)
        .sink { [weak self] _ in
            self?.tableView.reloadData()
        }
        .store(in: &cancellable)
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableViewCellHeight
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.weatherArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.Constants.identifier, for: indexPath) as? HomeCell else { return UITableViewCell() }
        cell.update(with: viewModel.weatherArray[indexPath.row])
        return cell
    }
}

// MARK: - Constants
extension HomeViewController {
    
    private enum Constants {
        
        static let tableViewCellHeight: CGFloat = 117
        static let title = "Weather"
    }
}

// MARK: - Previews
@available(iOS 17, *)
#Preview("HomeViewController") {
    return UINavigationController(rootViewController: HomeViewController())
}
