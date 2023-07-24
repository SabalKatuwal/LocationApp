//
//  locationManager.swift
//  WeatherApp
//
//  Created by Sabal on 7/24/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    //Request Location from user. This app asks location each time the app is opened. You can also take location from background.
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    //Two function that make CLLocationManagerDelegate work:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print ("Error while getting location", error)
        isLoading = false
    }
}
