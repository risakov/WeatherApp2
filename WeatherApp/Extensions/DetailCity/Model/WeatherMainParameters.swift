import Foundation

struct WeatherMainParameters: Decodable {
    
    let temp: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        
        case temp
        case feelsLike = "feels_like"
    }
}
