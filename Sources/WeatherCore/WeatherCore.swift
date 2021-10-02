import Foundation

struct WeatherCore {
    
    private(set) var text = "Hello, WeatherCore!"

    init() {}
    
    static func calculateCelsius(fahrenheit: Double) -> Double {
        var celsius: Double
        celsius = (fahrenheit - 32) * 5 / 9
        return celsius
    }
}

public var DarkSky_Key = ""

public var WeatherAPI_Key = ""

public enum WeatherError : Error {
    case any(String?)
    case anyKey(CodingKey?, String?)
}
