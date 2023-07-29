//
//  double.swift
//  WeatherApp
//
//  Created by Sabal on 7/29/23.
//

import Foundation

extension Double{
    
    //roundDoubel function will change the Double value into 0 decimal place
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}
