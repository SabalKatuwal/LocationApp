//
//  weatherView.swift
//  WeatherApp
//
//  Created by Sabal on 7/26/23.
//

import SwiftUI

struct weatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                //header VStack
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold() .font(.title)
                    Text("Today, \(Date().formatted(.dateTime .month() .day().hour().minute() ))")
                        .fontWeight(.light)
                }
                
                Spacer()
                    .frame(height: 20)
                
                VStack{
                    HStack{
                        VStack(spacing: 10){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(maxWidth: 100, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 75))
                            .fontWeight(.bold)
                            .padding()
                    }
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                    .frame(height: 80)
                
                //or you can also add from the Assets
                AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                } placeholder: {
                    loadingView()
                }
                
                Spacer()

                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        weatherRow(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDouble()+"°")
                        Spacer()
                        weatherRow(logo: "thermometer", name: "Max temp", value: weather.main.tempMax.roundDouble()+"°")
                    }
                    
                    HStack{
                        weatherRow(logo: "wind", name: "Max temp", value: weather.wind.speed.roundDouble()+"m/s")
                        Spacer()
                        weatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble()+"%")
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.662, saturation: 0.924, brightness: 0.375))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.662, saturation: 0.924, brightness: 0.375))
        .preferredColorScheme(.dark)
    }
}

struct weatherView_Previews: PreviewProvider {
    static var previews: some View {
        weatherView(weather: previewWeather)
    }
}
