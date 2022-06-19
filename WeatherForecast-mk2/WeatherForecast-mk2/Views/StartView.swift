import CoreLocationUI
import SwiftUI

struct StartView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        ZStack {
            Color.blue
            
            VStack {
                VStack(spacing: 40) {
                    Text("Welcome to Weather Forecast App!")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                    Image("weatherForStartScreen")
                        .resizable()
                        .frame(width: 350, height: 240)
                }
                VStack {
                    Text("Please, share your location!")
                    // .fontWeight(.thin)
                    LocationButton(.shareCurrentLocation) {
                        locationManager.requestlocation()
                    }.tint(.orange)
                        .cornerRadius(15)
                }
                VStack {
                    Text("by Roman Korsak")
                        .fontWeight(.thin)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
