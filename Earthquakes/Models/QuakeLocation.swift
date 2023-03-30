//
//  QuakeLocation.swift
//  EarthquakesTests
//
//  Created by Sem Koliesnikov on 30/03/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

struct QuakeLocation: Decodable {
    
    var latitude: Double { properties.products.origin.first!.properties.latitude }
    var longitude: Double { properties.products.origin.first!.properties.longitude }
    private var properties: RootProperties
    
    struct RootProperties: Decodable {
        var products: Products
    }
    
    struct Products: Decodable {
        var origin: [Origin]
    }
    
    struct Origin: Decodable {
        var properties: OriginProperties
    }
    
    struct OriginProperties {
        var latitude: Double
        var longitude: Double
    }
}

extension QuakeLocation.OriginProperties: Decodable {
    private enum OriginPropertiesCodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: OriginPropertiesCodingKeys.self)
        let longitude = try container.decode(String.self, forKey: .longitude)
        let latitude = try container.decode(String.self, forKey: .latitude)
        
        let longitudes = Double(longitude)
        let latitudes = Double(latitude)
        
        self.longitude = longitudes ?? 0.00
        self.latitude = latitudes ?? 0.00
    }
}
