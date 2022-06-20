import CoreLocation
import Foundation

class WeatherManager {
    func getCurrentWeather(lat: CLLocationDegrees, long: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=f5b163312a57771cfc7180e7d1b2b560") else { fatalError("error with url") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("error with status code") }
        
        
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
    
    struct ResponseBody: Decodable {
        var coordinates: CoodrinatesResponse
        var weather: [WeatherResponse]
        var main: MainResponse
        var name: String
        var wind: WindResponse
    }
    
    struct CoodrinatesResponse: Decodable {
        var latitude: Double
        var longitude: Double
    }
    
    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }

    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}
