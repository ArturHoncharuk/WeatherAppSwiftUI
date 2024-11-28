//
//  ContentView.swift
//  WeatherApp
//
//  Created by Artur Honcharuk on 28.11.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                try await weather = weatherManager.getCurrentWeather(lat: location.latitude, lon: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.6, saturation: 0.835, brightness: 0.756))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
