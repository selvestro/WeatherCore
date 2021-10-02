import Foundation

public struct WeatherCore {
    
    public private(set) var text = "Hello, WeatherCore!"

    public init() {}
}

public let DarkSky_Key = ""

public let WeatherAPI_Key = ""

public enum WeatherError : Error {
    case any(String?)
    case anyKey(CodingKey?, String?)
}
