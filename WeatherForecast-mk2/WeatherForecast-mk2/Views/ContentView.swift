import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack{
            
            if let location = locationManager.location{
                Text("your coordinates are \(location.latitude) and  \(location.longitude)")
            } else if locationManager.isLoading{
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.blue)
                    .tint(.white)
                   
            } else {
                
                StartView()
                    .environmentObject(locationManager)
            }
        }
        //.background(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
