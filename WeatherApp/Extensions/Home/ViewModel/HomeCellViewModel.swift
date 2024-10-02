import UIKit
import Combine

class HomeCellViewModel {
    
    var title: String
    var subtitle: String
    var conditions: String
    var weatherDegrees: String
    var feelsLike: String
    var backgroundColor: UIColor
    
    // init from a model
    init(weatherResponse: WeatherResponse) {
        self.title = weatherResponse.name
        self.subtitle = weatherResponse.dt.formattedTimeFromUnixTime(secondsFromGMT: weatherResponse.timezone)
        self.conditions = weatherResponse.weather.first?.main ?? ""
        self.weatherDegrees = "\(Int(weatherResponse.main.temp.rounded()))°"
        self.feelsLike = "Feels like \(Int(weatherResponse.main.feelsLike.rounded()))°"
        self.backgroundColor = .weatherGreen
    }
}
