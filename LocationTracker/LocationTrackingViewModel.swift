//
//  LocationTrackingViewModel.swift
//  LocationTracker
//
//  Created by ELIFYAL on 8.03.2025.
//

import Foundation
import MapKit
import RxSwift
import RxCocoa
import CoreLocation

class LocationTrackingViewModel {
    private let locationManager = LocationManager()
    private let disposeBag = DisposeBag()
    
    let locations = BehaviorRelay<[LocationModel]>(value: [])
    let isTracking = BehaviorRelay<Bool>(value: false)
    
    init() {
        locationManager.locations
            .map { $0.map { LocationModel(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude) } }
            .bind(to: locations)
            .disposed(by: disposeBag)
    }
    
    func toggleTracking() {
        isTracking.accept(!isTracking.value)
        locationManager.toggleTracking()
    }
    
    func resetRoute() {
        locationManager.resetRoute()
        locations.accept([])
    }
    
    func continueTracking() {
        locationManager.startTracking()
    }
}
