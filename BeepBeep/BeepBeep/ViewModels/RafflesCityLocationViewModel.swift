//
//  RafflesCityLocationViewModel.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 11/11/22.
//

import SwiftUI
import CoreLocation

enum RafflesCityPickUpDropOffPoints: CaseIterable {
    case northBridgeRoadEntrance
    case stamfordRoadEntrance
    case brasBasahRoadEntrance
}

class RafflesCityLocationViewModel: ObservableObject {
    @Published var locationsCoordinates: [LocationCoordinatesModel] = []
    @Published var currentSelectedLocation: RafflesCityPickUpDropOffPoints = .northBridgeRoadEntrance
    
    @Published var pickUpAndDropOffLocation: [LocationCoordinatesModel] = []
    
    private var northBridgeRoadEntranceString: String = "North Bridge Road Entrance"
    private var stamfordRoadEntranceString: String = "Stamford Road Entrance"
    private var brasBasahRoadEntranceString: String = "Bras Basah Road Entrance"
    
    init() {
        locationsCoordinates.append(LocationCoordinatesModel(name: "North Bridge Road Entrance", coordinate: CLLocationCoordinate2D(latitude: 1.2941536841154733, longitude: 103.85264509067997), selectedPoint: .northBridgeRoadEntrance))
        
        locationsCoordinates.append(LocationCoordinatesModel(name: "Stamford Road Entrance", coordinate: CLLocationCoordinate2D(latitude: 1.2935038980211975, longitude: 103.85272267223058), selectedPoint: .stamfordRoadEntrance))
        
        locationsCoordinates.append(LocationCoordinatesModel(name: "Bras Basah Road Entrance", coordinate: CLLocationCoordinate2D(latitude: 1.2943127147774252, longitude: 103.85388285906974), selectedPoint: .brasBasahRoadEntrance))
        
        pickUpAndDropOffLocation.append(LocationCoordinatesModel(name: "Stamford Road Entrance", coordinate: CLLocationCoordinate2D(latitude: 1.2935038980211975, longitude: 103.85272267223058), selectedPoint: .stamfordRoadEntrance))
        
        // 1.3056575158644028, 103.7730488683276
        pickUpAndDropOffLocation.append(LocationCoordinatesModel(name: "Utown NUS", coordinate: CLLocationCoordinate2D(latitude: 1.3056575158644028, longitude: 103.7730488683276), selectedPoint: .stamfordRoadEntrance))
    }
    
    func getPickUpDropOffPointName(location: RafflesCityPickUpDropOffPoints) -> String {
        switch(location) {
        case .brasBasahRoadEntrance:
            return brasBasahRoadEntranceString
        case .northBridgeRoadEntrance:
            return northBridgeRoadEntranceString
        case .stamfordRoadEntrance:
            return stamfordRoadEntranceString
        }
    }
    
    func getPickUpDropOffPointPictureName(location: RafflesCityPickUpDropOffPoints) -> String {
        switch(location) {
        case .brasBasahRoadEntrance:
            return "BrasBasahRoadEntrance"
        case .northBridgeRoadEntrance:
            return "NorthBridgeRoadEntrance"
        case .stamfordRoadEntrance:
            return "StamfordRoadEntrance"
        }
    }
}
