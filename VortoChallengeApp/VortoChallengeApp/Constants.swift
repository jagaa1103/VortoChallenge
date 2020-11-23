//
//  Constants.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.21.
//

import Foundation

struct Constants {
    static let API_HEADER = "Authorization"
    static let API_KEY = "Bearer IaQepd0smW9jCABgIQ2u9i2IWELD5zFc9n2N9AML0EOAXVJNosNLkcs-IfXstYY7MCXPWTPJh6OmbAnukzBk0nTd1WhxlvWKmSHiU909fhCsg3vs7NxiX7NhIaK4X3Yx"
    
    static func calculateDistanceByMiles(meter: Double) -> String {
        return String(format: "%.2f", meter / 1609.344)
    }
}
