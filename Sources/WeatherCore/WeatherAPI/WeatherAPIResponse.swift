//
//  WeatherAPIResponse.swift
//  
//
//  Created by Dmitry Seliverstov on 01.10.2021.
//

import Foundation

extension WeatherAPI {
    
    public struct Response : Codable {
        
        public var location: WeatherAPI.Location?
        
        public var current: WeatherAPI.Current?
        
        public var forecast: WeatherAPI.Forecast?
        
    }
    
    public enum ResponseHeader : String {
        
        case Transfer_Encoding = "Transfer-Encoding"
        case Connection = "Connection"
        case Vary = "Vary"
        case CDN_PullZone = "CDN-PullZone"
        case CDN_Uid = "CDN-Uid"
        case CDN_RequestCountryCode = "CDN-RequestCountryCode"
        case CDN_EdgeStorageId = "CDN-EdgeStorageId"
        case CDN_CachedAt = "CDN-CachedAt"
        case CDN_RequestPullSuccess = "CDN-RequestPullSuccess"
        case CDN_RequestPullCode = "CDN-RequestPullCode"
        case CDN_RequestId = "CDN-RequestId"
        case CDN_Status = "CDN-Status"
        case CDN_Cache = "CDN-Cache"
        case Cache_Control = "Cache-Control"
        case Content_Type = "Content-Type"
        case Date = "Date"
        case Server = "Server"
        
    }
}
