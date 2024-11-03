//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 04.11.2024.
//

import Foundation

struct WeatherData: Decodable {
    let daily: [DailyWeather]?
}
