//
//  LocationService.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.20.
//

import Foundation
import CoreLocation



protocol LocationManagerDelegate {
    func locationChanged(coord: Coordinate)
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var lastUpdatedLocation: Coordinate?
    
    var delegate: LocationManagerDelegate?
    
    func startLocation(){
        locationManager.desiredAccuracy = .greatestFiniteMagnitude
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    func stopLocation(){
        locationManager.stopUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            case .authorizedAlways:
                locationManager.startUpdatingLocation()
                break
            case .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
                break
            case .denied:
                locationManager.requestWhenInUseAuthorization()
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                break
            case .restricted:
                break
            default:
                locationManager.requestWhenInUseAuthorization()
                break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let last = locations.last {
            let coord = Coordinate(lat: last.coordinate.latitude, lon: last.coordinate.longitude)
            delegate?.locationChanged(coord: coord)
            self.lastUpdatedLocation = coord
        }
    }
    
    func getLastLocation() -> Coordinate? {
        return lastUpdatedLocation
    }
}


