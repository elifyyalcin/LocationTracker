//
//  LocationManager.swift
//  LocationTracker
//
//  Created by ELIFYAL on 8.03.2025.
//

import Foundation
import MapKit
import RxSwift
import RxCocoa
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var isTracking = false
    let locations = BehaviorRelay<[CLLocation]>(value: [])
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.requestWhenInUseAuthorization()
    }
    
    func toggleTracking() {
        isTracking.toggle()
        if isTracking {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.stopUpdatingLocation()
        }
    }
    
    func resetRoute() {
        locations.accept([])
    }
    
    func startTracking() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations newLocations: [CLLocation]) {
        guard let lastLocation = newLocations.last else { return }
        
        if let previousLocation = locations.value.last {
            let distance = lastLocation.distance(from: previousLocation)
            print("Mesafe: \(distance) metre")
            if distance >= 100 {
                locations.accept(locations.value + [lastLocation])
                print("100 metre geçildi! Yeni marker eklendi.")
            }
        } else {
            locations.accept(locations.value + [lastLocation])
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Konum alma hatası: \(error.localizedDescription)")
    }
}
