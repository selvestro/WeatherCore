//
//  DarkSkyFlags.swift
//  
//
//  Created by Dmitry Seliverstov on 02.10.2021.
//

import Foundation

extension DarkSky {
    
    public struct Flags : Codable {

        public let sources: [String]
        public var nearest_station: Double?
        public let units: String
    }
}
