import Foundation

struct WeatherResponse: Decodable {
    
    let coord: Coordinates
    let weather: [WeatherParameters]
    let main: WeatherMainParameters
    let dt: Double
    let timezone: Int
    let name: String
}
