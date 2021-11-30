//
//  MapViewModel.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 30.11.2021.
//

import Foundation
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

final class MapViewModel: ObservableObject {
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.510357, longitude: -0.116773),
        span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
    )
    
    @Published var annotatedItem = AnnotatedItem(
        coordinate: CLLocationCoordinate2D(latitude: 51.510357, longitude: -0.116773)
    )
    
    var location: String
    
    init(location: String) {
        self.location = location
        convertAddress(location: location)
    }
    
    func convertAddress(location: String) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(location) { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let placemarks = placemarks,
                  let location = placemarks[0].location
            else { return }
            
            DispatchQueue.main.async { [self] in
                region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.0015,
                        longitudeDelta: 0.0015
                    )
                )
                annotatedItem = AnnotatedItem(coordinate: location.coordinate)
            }
        }
    }
}
