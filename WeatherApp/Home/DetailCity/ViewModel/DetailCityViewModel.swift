//
//  DetailCityViewModel.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 02.11.2024.
//

import Foundation
import Combine

class DetailCityViewModel: ObservableObject {
    private let weatherService: WeatherService
    @Published var weatherData: WeatherData?
    @Published var errorMessage: String?

    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }

    func fetchWeather(for city: String) {
        weatherService.fetch16DayWeather(for: city) { [weak self] result in
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async {
                    self?.weatherData = weatherData
                    self?.errorMessage = nil
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                    self?.weatherData = nil
                }
            }
        }
    }
}
