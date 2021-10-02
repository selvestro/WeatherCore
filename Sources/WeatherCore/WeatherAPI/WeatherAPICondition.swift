//
//  WeatherAPICondition.swift
//  
//
//  Created by Dmitry Seliverstov on 01.10.2021.
//

import Foundation

extension WeatherAPI {
    
    public struct Condition : Codable {
        public let text: String
        public let icon: String
        public let code: Int
        
    }
}
