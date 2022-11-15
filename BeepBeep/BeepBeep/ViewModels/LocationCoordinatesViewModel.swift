//
//  LocationCoordinatesViewModel.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 11/11/22.
//

import SwiftUI
import CoreLocation

class LocationCoordinatesViewModel: ObservableObject {
    
    @Published var locationsCoordinates: [LocationCoordinatesModel] = []
    
    init() {
        // 1.2935038980211975, 103.85272267223058
        locationsCoordinates.append(LocationCoordinatesModel(name: "North Bridge Road Entrance", coordinate: CLLocationCoordinate2D(latitude: 1.2941536841154733, longitude: 103.85264509067997), selectedPoint: .northBridgeRoadEntrance))
        
        locationsCoordinates.append(LocationCoordinatesModel(name: "Stamford Road Entrance", coordinate: CLLocationCoordinate2D(latitude: 1.2935038980211975, longitude: 103.85272267223058),  selectedPoint: .stamfordRoadEntrance))
        
        locationsCoordinates.append(LocationCoordinatesModel(name: "Bras Basah Road Entrance", coordinate: CLLocationCoordinate2D(latitude: 1.2943127147774252, longitude: 103.85388285906974),  selectedPoint: .brasBasahRoadEntrance))
    }
}
