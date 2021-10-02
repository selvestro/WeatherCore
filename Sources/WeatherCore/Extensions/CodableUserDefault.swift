//
//  CodableUserDefault.swift
//  
//
//  Created by Dmitry Seliverstov on 02.10.2021.
//

import Foundation

@propertyWrapper
public struct CodableUserDefault<Value: Codable> {
    
    let key: String
    let defaultValue: Value
    var container: UserDefaults = .standard
    
    public var wrappedValue: Value {
        get {
            if let data = container.object(forKey: key) as? Data {
                do {
                    let decoded = try UserDefaults.decoder.decode(Value.self, from: data)
                    return decoded
                } catch {}
            }
            return defaultValue
        }
        set {
            do {
                let encoded = try UserDefaults.encoder.encode(newValue)
                container.set(encoded, forKey: key)
            } catch {}
        }
    }
}

extension UserDefaults {
    
    static let encoder = JSONEncoder()
    static let decoder = JSONDecoder()
    
    @CodableUserDefault(key: "cityTime", defaultValue: 0)
    public static var cityTime: Int
    
    @CodableUserDefault(key: "cityWeather", defaultValue: nil)
    public static var cityWeather: DarkSky.Response?
    
    @CodableUserDefault(key: "citiesWeather", defaultValue: [:])
    public static var citiesWeather: [String: DarkSky.Response]
    
    @CodableUserDefault(key: "mapTime", defaultValue: 0)
    public static var mapTime: Int
    
    @CodableUserDefault(key: "mapWeather", defaultValue: nil)
    public static var mapWeather: DarkSky.Response?
}
