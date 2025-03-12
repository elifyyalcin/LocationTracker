//
//  ViewController.swift
//  LocationTracker
//
//  Created by ELIFYAL on 7.03.2025.
//

import UIKit
import MapKit
import SnapKit
import RxSwift
import RxCocoa
import CoreLocation

class LocationTrackingViewController: UIViewController {
    private let mapView = MKMapView()
    private let startButton = UIButton()
    private let resetButton = UIButton()
    private let viewModel = LocationTrackingViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        mapView.delegate = self
    }
    
    private func setupUI() {
        view.addSubview(mapView)
        view.addSubview(startButton)
        view.addSubview(resetButton)
        
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        startButton.setTitle("Start Tracking", for: .normal)
        startButton.backgroundColor = .blue
        startButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
        
        resetButton.setTitle("Reset Route", for: .normal)
        resetButton.backgroundColor = .red
        resetButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
    }
    
    private func bindViewModel() {
        startButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.viewModel.toggleTracking()
                self.updateStartButtonTitle()
            })
            .disposed(by: disposeBag)
        
        resetButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                let wasTracking = self.viewModel.isTracking.value
                self.viewModel.resetRoute()
                self.mapView.removeAnnotations(self.mapView.annotations)
                if wasTracking {
                    self.viewModel.continueTracking()
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.locations
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] locations in
                guard let self = self else { return }
                self.updateMap(with: locations)
            })
            .disposed(by: disposeBag)
    }
    
    private func updateStartButtonTitle() {
        let isTracking = viewModel.isTracking.value
        startButton.setTitle(isTracking ? "Stop Tracking" : "Start Tracking", for: .normal)
    }
    
    private func updateMap(with locations: [LocationModel]) {
        print("Harita Güncelleniyor: \(locations.count) marker var.")
        
        if let lastLocation = locations.last {
            let annotation = MKPointAnnotation()
            annotation.coordinate = lastLocation.coordinate
            mapView.addAnnotation(annotation) //only new marker
        }
        
        if let lastLocation = locations.last {
            let region = MKCoordinateRegion(center: lastLocation.coordinate, latitudinalMeters: 50, longitudinalMeters: 50)
            mapView.setRegion(region, animated: true)
        }
    }
}

extension LocationTrackingViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation else { return }
        fetchAddress(for: annotation.coordinate) { [weak self] address in
            guard let self = self else { return }
            let alert = UIAlertController(title: "Location Address", message: address, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    private func fetchAddress(for coordinate: CLLocationCoordinate2D, completion: @escaping (String) -> Void) {
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let placemark = placemarks?.first {
                let address = [placemark.thoroughfare, placemark.subThoroughfare, placemark.locality, placemark.country].compactMap { $0 }.joined(separator: ", ")
                completion(address)
            } else {
                completion("Address not found")
            }
        }
    }
}
