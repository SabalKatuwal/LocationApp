//
//  welcomeView.swift
//  WeatherApp
//
//  Created by Sabal on 7/24/23.
//

import SwiftUI
//CorelocationUI has the button called LocationButton
import CoreLocationUI

struct welcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to the Weather App")
                    .bold().font(.title)
                Text("Please share your current location to get weather update")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            //contained in CoreLocationUI
            LocationButton(.shareCurrentLocation){
                //this is the closure that executes when button is clicked
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct welcomeView_Previews: PreviewProvider {
    static var previews: some View {
        welcomeView()
    }
}
