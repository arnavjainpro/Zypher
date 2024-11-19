//
//  ContentView.swift
//  Zypher
//
//  Created by Arnav Jain on 11/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentTemp = 72.0
    @State private var weatherCondition = "sun.max"
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [.blue.opacity(0.6), .blue.opacity(0.25)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Current weather display
                    VStack(spacing: 8) {
                        Text("San Francisco")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Image(systemName: weatherCondition)
                            .symbolRenderingMode(.multicolor)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        
                        Text("\(Int(currentTemp))°")
                            .font(.system(size: 70, weight: .light))
                        
                        Text("Sunny")
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 32)
                    
                    // Weather details
                    HStack(spacing: 20) {
                        WeatherDetailView(icon: "wind", value: "8 mph")
                        WeatherDetailView(icon: "humidity", value: "64%")
                        WeatherDetailView(icon: "sun.max.fill", value: "UV 3")
                    }
                    .padding(.horizontal)
                    
                    // Hourly forecast
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(0..<24) { hour in
                                HourlyForecastView(hour: hour)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "location.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "gear")
                    }
                }
            }
        }
    }
}

// Supporting Views
struct WeatherDetailView: View {
    let icon: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
            Text(value)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct HourlyForecastView: View {
    let hour: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text("\(hour):00")
                .font(.subheadline)
            Image(systemName: "sun.max.fill")
                .symbolRenderingMode(.multicolor)
            Text("72°")
                .font(.subheadline)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ContentView()
}
