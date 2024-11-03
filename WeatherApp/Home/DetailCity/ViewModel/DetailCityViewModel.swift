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
            DispatchQueue.main.async {
                switch result {
                case .success(let weatherData):
                    self?.weatherData = weatherData
                    self?.errorMessage = nil
                case .failure(let error):
                    self?.weatherData = nil
                    self?.errorMessage = self?.handleError(error)
                }
            }
        }
    }

    private func handleError(_ error: Error) -> String {
        if let urlError = error as? URLError {
            switch urlError.code {
            case .timedOut:
                return "The request has timed out. Try again"
            default:
                return "An error occurred while loading data. Please try again later."
            }
        } else {
            return "An unknown error has occurred. Please try again later."
        }
    }
}
