import Foundation

enum WeatherAPI {
    
    private static let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    private static let apiKey = "09c20159b13e5fd8688f9db864d5a0c2"
    
    static func requestURL(with coordinates: Coordinates) -> URL? {
        guard let queryURL = URL(string: baseURL),
                var components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true) else { return nil}
        components.queryItems = [
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "limit", value: "1"),
            URLQueryItem(name: "lat", value: String(coordinates.lat)),
            URLQueryItem(name: "lon", value: String(coordinates.lon)),
            URLQueryItem(name: "units", value: "metric")

        ]
        return components.url
    }
}
