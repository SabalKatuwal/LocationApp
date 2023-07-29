//
//  weatherRow.swift
//  WeatherApp
//
//  Created by Sabal on 7/29/23.
//

//this weather row will remain in button of the screen in corner rectangle

import SwiftUI

struct weatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.038, brightness: 0.941))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                Text(value)
                    .bold()
                    .font(.title)
             
            }
            
        }
    }
}

struct weatherRow_Previews: PreviewProvider {
    static var previews: some View {
        weatherRow(logo: "thermometer", name: "Feels like", value: "8°")
    }
}
