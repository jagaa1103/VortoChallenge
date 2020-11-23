//
//  Restaurant.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.20.
//

import Foundation


struct Restaurant : Identifiable, Codable {
    
    let id: String
    let alias: String
    let name: String
    let image_url: String
    let is_closed: Bool
    let url: String
    let rating: Double
    let coordinates: Coordinates
    let location: Location
    let phone: String
    let display_phone: String
    let distance: Double
}

extension Restaurant {
    static func == (lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.id == rhs.id
    }
}


struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}


struct Location: Codable {
    let address1: String?
    let address2: String?
    let address3: String?
    let city: String?
    let zip_code: String?
    let country: String?
    let state: String?
    
    let display_address: [String]
}
