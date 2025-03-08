//
//  LocationModel.swift
//  LocationTracker
//
//  Created by ELIFYAL on 8.03.2025.
//

import Foundation
import MapKit
import RxSwift
import RxCocoa
import CoreLocation

struct LocationModel {
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
