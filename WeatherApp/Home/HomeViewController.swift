import UIKit
import Combine
import CoreLocation
import SnapKit

class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel(weatherService: WeatherServiceImpl.shared)
    private var tableView = UITableView(frame: .zero)
    private var cancellable = Set<AnyCancellable>()
    private var searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupSearchBar()
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
            $0.top.equalTo(searchBar.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.Constants.identifier)
        
        tableView.register(ErrorCell.self, forCellReuseIdentifier: ErrorCell.Constants.identifier)
    }
    
    private func setupSearchBar() {
        view.addSubview(searchBar)
        
        searchBar.searchBarStyle = .prominent
        searchBar.barTintColor = .clear
        searchBar.placeholder = Constants.placeholder
        searchBar.returnKeyType = .default
        searchBar.isTranslucent = true
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            
            textfield.backgroundColor = UIColor(hexCode: "#1b1b1c")
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
            
            textfield.textColor = UIColor.white
            
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.white
            }
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(141)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
        }
    }
    
    // MARK: - Binding
    private func setupBinding() {
        viewModel.$weatherArray
        .receive(on: RunLoop.main)
        .sink { [weak self] _ in
            self?.tableView.reloadData()
        }
        .store(in: &cancellable)
        
        viewModel.bind(fieldText: searchBar.searchTextField.textPublisher)
        
        viewModel.$state
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
        switch viewModel.state {
        case .idle:
            return viewModel.weatherArray.count
        case .found:
            return viewModel.weatherArray.count
        case .error:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch viewModel.state {
        case .idle:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.Constants.identifier, for: indexPath) as? HomeCell else { return UITableViewCell() }
            cell.update(with: viewModel.weatherArray[indexPath.row])
            
            return cell
            
        case .found:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.Constants.identifier, for: indexPath) as? HomeCell else { return UITableViewCell() }
            cell.update(with: viewModel.weatherArray[indexPath.row])
            
            return cell
            
        case .error:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ErrorCell.Constants.identifier, for: indexPath) as? ErrorCell else { return UITableViewCell() }
            
            return cell
        }
    }
}
    
// MARK: - Constants
extension HomeViewController {
    
    private enum Constants {
        
        static let tableViewCellHeight: CGFloat = 117
        static let title = "Weather"
        static let placeholder = "Search for a city"
    }
}

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        var textPublisher: AnyPublisher<String, Never> {
            NotificationCenter.default
                .publisher(for: UITextField.textDidChangeNotification, object: self)
                .compactMap { ($0.object as? UITextField)?.text }
                .eraseToAnyPublisher()
        }
        return textPublisher
    }
}
    
// MARK: - Previews
@available(iOS 17, *)
#Preview("HomeViewController") {
    return UINavigationController(rootViewController: HomeViewController())
}

