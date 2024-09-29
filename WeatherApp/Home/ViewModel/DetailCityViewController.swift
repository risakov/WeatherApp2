//
//  DetailCityViewController.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 29.09.2024.
//

import UIKit
import SwiftUI

class DetailCityViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nextHoursView = NextHoursView()
        view.addSubview(nextHoursView)
        nextHoursView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    
    
}
