//
//  DaillyWeather.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 04.11.2024.
//

import Foundation

struct DailyWeather: Decodable {
    let date: Int?
    let temp: Temperature?
    let weather: [WeatherCondition]?
    
    }
