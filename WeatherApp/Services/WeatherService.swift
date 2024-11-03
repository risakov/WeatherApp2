import Foundation
import Combine
import UIKit
import Alamofire

protocol WeatherService {
    
    func requestCurrentWeather(
        byLocationCoordinates coordinates: Coordinates,
        completionHandler: @escaping (WeatherResponse) -> Void
    )
    
    func fetch16DayWeather(
        for city: String,
        completionHandler: @escaping (Result<WeatherData, Error>) -> Void
    )
}

final class WeatherServiceImpl: NSObject, WeatherService {
    
    static let shared = WeatherServiceImpl()
    
    func requestCurrentWeather(
        byLocationCoordinates coordinates: Coordinates,
        completionHandler: @escaping (WeatherResponse) -> Void
    ) {
        guard let url = WeatherAPI.requestURL(with: coordinates) else { return }
        AF.request(url).responseDecodable(of: WeatherResponse.self) { result in
            switch result.result {
            case .success(let weather):
                completionHandler(weather)
            case .failure(let error):
                print("Error fetching current weather")
                break
            }
        }
    }
    
    func fetch16DayWeather(for city: String, completionHandler: @escaping (Result<WeatherData, Error>) -> Void) {
        
        let apiKey = "a8fde9b5e33fe5d367b2f34c995bb4da"
        let daysCount = 16
        
        var urlComponents = URLComponents(string: "https://api.openweathermap.org/data/2.5/forecast/daily")!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "cnt", value: "16"),
            URLQueryItem(name: "appid", value: apiKey)
        ]
        
        guard let url = urlComponents.url else {
            print("Error creating URL")
            return
        }
        
        print("URL: https://api.openweathermap.org/data/2.5/forecast/daily?q=Rostov-on-Don&cnt=16&appid=a8fde9b5e33fe5d367b2f34c995bb4da")
        
        AF.request(url).responseDecodable(of: WeatherData.self) { response in
            switch response.result {
            case .success(let weatherData):
                completionHandler(.success(weatherData))
            case .failure(let error):
                print("Error fetching 16-day weather data")
                completionHandler(.failure(NSError(domain: "WeatherService", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch 16-day weather data"])))
            }
        }
    }
}
