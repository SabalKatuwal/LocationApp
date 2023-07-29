//
//  ModelData.swift
//  WeatherApp
//
//  Created by Sabal on 7/28/23.
//

import Foundation


//If we have such kind of data structure in model and so feel difficut to pass to priview inorder to run preview. At that time we use this way.:
        //First add an empty file type (select others in option while creating file). here we name this file as weatherData. Then add the demo JSON data there. We need to pass this JSON data to preview so we created a load() function.

var previewWeather:ResponseBody = load("weatherData.json")

//this function will read the JSON data from the file and parse it into a Swift data model object of type ResponseBody, which will be assigned to the previewWeather variable.
func load<T: Decodable>(_ filename: String) -> T {
    
    //Data is a Swift type that represents a sequence of bytes, and in this context, it will be used to store the JSON data read from the file.
    let data: Data

    //Apple uses bundles to represent apps, frameworks, plug-ins, and many other specific types of content. Bundles organize their contained resources into well-defined subdirectories
    //The main bundle represents the bundle directory that contains the currently executing code
    
    
    //The block of code given below uses the Bundle class to attempt to find the URL of the file specified by the filename in the main bundle of the app. The main bundle contains all the resources included in the app, such as images, sounds, and JSON files.
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    //This block of code given below is responsible for parsing the JSON data into an instance of the generic type T, which is specified when calling the load function. It uses JSONDecoder, a Swift standard class that can decode JSON data into Swift data models that conform to the Decodable protocol.
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
