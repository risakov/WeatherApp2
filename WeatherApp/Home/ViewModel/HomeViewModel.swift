import UIKit
import Combine

final class HomeViewModel: ObservableObject {
    
    // Needs to use this variable in the future for a search
    @Published var city: String = ""
    @Published var weatherArray = [HomeCellViewModel]()
    @Published var state: CitySearchState = .idle
    private lazy var subscriptions = Set<AnyCancellable>()
    
    private var cancellableSet: Set<AnyCancellable> = []
    private let weatherService: WeatherService
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
        
        // TODO: - Needs to get a current location when a task for it will be ready
        let moscowCoordinates = Coordinates(lat: 55.75222, lon: 37.61556)
        weatherService.requestCurrentWeather(byLocationCoordinates: moscowCoordinates) { [weak self] weatherResponse in
            self?.weatherArray.append(HomeCellViewModel(weatherResponse: weatherResponse))
            self?.city = weatherResponse.name
        }
    }
    
    func bind(fieldText: AnyPublisher<String, Never>) {
        fieldText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] text in
                self?.filter(by: text)
            }
            .store(in: &subscriptions)
    }
    
    func filter(by city: String) {
        if (weatherArray.first(where: { $0.title.lowercased() == city.lowercased() }) != nil) {
            self.state = .found
        } else {
            self.state = .error
        }
    }
    
    enum CitySearchState {
        case idle
        case found
        case error
    }
}

