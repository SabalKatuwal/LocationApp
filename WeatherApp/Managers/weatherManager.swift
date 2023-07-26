//
//  weatherManager.swift
//  WeatherApp
//
//  Created by Sabal on 7/24/23.
//

//key: 0f72c8ac61659daba630367a4770ead4
import Foundation
import CoreLocation

class WeatherManager{
    //async throws is new feature reference: https://designcode.io/swiftui-advanced-handbook-async-await
    
    //here ResponseBody is the model written in ResponseBody.swift file in Models
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees)async throws -> ResponseBody {
        //This is async await method of creating HTTP request, so used async.To handle the error thrown by the function we used throws keyword. The url part is given by openweathermap api, we have added &units=metric for metrics(MKS) units
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("0f72c8ac61659daba630367a4770ead4")&units=metric") else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        
        //we'll call URLSession.shared.data to get the data from the URL we created. Since this is a network call, it can take some time to fetch the data. So we'll need to add the await keyword in front of the URLSession. Moreover, the URLSession call might throw an error, so we'll need to add the try keyword before the await. It might return us two things: some data, and a response, so we'll save them in their corresponding variable.
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        //we need to make sure that the status code of the response is 200 OK before continuing, so let's add a guard statement.
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fetching weather data")}
        
        //upto here we have done the fetching task
        //Now decoding of data:
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
        
        
    }
    
    
}

