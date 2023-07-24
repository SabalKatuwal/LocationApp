//
//  ContentView.swift
//  WeatherApp
//
//  Created by Sabal on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            
            
            welcomeView()
                .environmentObject(locationManager)
        }
        .background(Color(hue: 0.662, saturation: 0.924, brightness: 0.375))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
