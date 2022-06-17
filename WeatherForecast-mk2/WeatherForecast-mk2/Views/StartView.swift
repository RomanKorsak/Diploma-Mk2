//
//  StartView.swift
//  WeatherForecast-mk2
//
//  Created by Роман Корсак on 17.06.22.
//

import SwiftUI
import CoreLocationUI

struct StartView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    
    
    var body: some View {
        VStack{
            VStack(spacing: 40){
                Text("Welcome to Weather Forecast App!")
                    .font(.system(size: 25))
                    .fontWeight(.thin)
                Image("weatherForStartScreen")
                Text("Please, share your location!")
                LocationButton(.currentLocation){
                    locationManager.requestlocation()
                }.tint(.orange)
                    .cornerRadius(15)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
        
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
