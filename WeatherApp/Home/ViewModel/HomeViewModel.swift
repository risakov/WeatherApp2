import UIKit
import Combine

final class HomeViewModel: ObservableObject {
    
    // Needs to use this variable in the future for a search
    @Published var city: String = ""
    @Published var weatherArray = [HomeCellViewModel]()
    
    private var cancellableSet: Set<AnyCancellable> = []
    private let weatherService: WeatherService
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
        
        // TODO: - Needs to get a current location when a task for it will be ready
        let moscowCoordinates = Coordinates(lat: 55.75222, lon: 37.61556)
        weatherService.requestCurrentWeather(byLocationCoordinates: moscowCoordinates) { [weak self] weatherResponse in
            self?.weatherArray.append(HomeCellViewModel(weatherResponse: weatherResponse))
        }
    }
}
