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

struct WeatherData: Decodable {
    let list: [DailyWeather]
}

struct DailyWeather: Decodable {
    let date: Int
    let temp: Temperature
    let weather: [WeatherCondition]
}

struct Temperature: Decodable {
    let day: Double
    let min: Double
    let max: Double
}

struct WeatherCondition: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

final class WeatherServiceImpl: NSObject, WeatherService {
    func fetch16DayWeather(for city: String, completionHandler: @escaping (Result<WeatherData, any Error>) -> Void) {
    }
    
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
                print(error)
                break
            }
        }
    }
}

func fetch16DayWeather(for city: String, completionHandler: @escaping (Result<WeatherData, Error>) -> Void) {
    let apiKey = "a8fde9b5e33fe5d367b2f34c995bb4da"
    let urlString = "https://api.openweathermap.org/data/2.5/forecast/daily?q=Rostov-on-Don&cnt=16&appid=a8fde9b5e33fe5d367b2f34c995bb4da"
    
    guard let url = URL(string: urlString) else { return }
    
    AF.request(url).responseDecodable(of: WeatherData.self) { response in
        switch response.result {
        case .success(let weatherData):
            completionHandler(.success(weatherData))
        case .failure(let error):
            print("Error fetching 16-day weather data: \(error)")
            completionHandler(.failure(error))
        }
    }
}

