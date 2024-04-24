//
//  LocationManager.swift
//  Romalog
//
//  Created by Rohit Paul on 4/23/24.
//

import CoreLocation
import Foundation
import MapKit

class LocationManager: ObservableObject {
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(center: LocationManager.pointNemo, latitudinalMeters: 5000, longitudinalMeters: 5000)
    
    func getLocationFor(address: String) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { [weak self] placemarks, error in
            guard let placemarks = placemarks,
                  let location = placemarks.first?.location else {
                return
            }
            
            self?.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        }
    }
}

extension LocationManager {
    static var pointNemo: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 48.876667, longitude: -123.393333)
    }
}
