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

class LocationManager: NSObject, ObservableObject {
    
    let locationManager = CLLocationManager()
    @Published var lastUpdatedLocation: Coordinate?
    
    var delegate: LocationManagerDelegate?
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = .greatestFiniteMagnitude
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }
    
    func stopLocation(){
        locationManager.stopUpdatingLocation()
    }
    
    func getLastLocation() -> Coordinate? {
        return lastUpdatedLocation
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    
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
}


