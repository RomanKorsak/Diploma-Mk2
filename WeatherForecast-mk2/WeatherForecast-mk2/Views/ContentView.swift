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
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.blue)
                    tint(.white)
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(lat: location.latitude, long: location.longitude)
                            } catch {
                                print("error with getting weather, \(error)")
                            }
                        }
                }
            } else if locationManager.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.blue)
                    .tint(.white)
                   
            } else {
                StartView()
                    .environmentObject(locationManager)
            }
        }
        // .background(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
