import Foundation
import Combine
import UIKit
import Alamofire

protocol WeatherService {
    
    func requestCurrentWeather(
        byLocationCoordinates coordinates: Coordinates,
        completionHandler: @escaping (WeatherResponse) -> Void
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
                print(error)
                break
            }
        }
    }
}
