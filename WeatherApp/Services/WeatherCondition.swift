//
//  WeatherCondition.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 04.11.2024.
//

import Foundation

struct WeatherCondition: Decodable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}
