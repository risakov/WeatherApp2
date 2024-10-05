//
//  GeneralErrorView.swift
//  WeatherApp
//
//  Created by Анастасия Лыгина on 05.10.2024.
//

import SwiftUI

struct GeneralErrorView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            Text("Sorry, \nsomething went \nwrong \nPlease try again")
                .font(.system(size: 35, weight: .bold))
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
        }
    }
}

struct GeneralErrorView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralErrorView()
    }
}
