//
//  LocationCoordinatesModel.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 11/11/22.
//

import SwiftUI
import CoreLocation

struct LocationCoordinatesModel: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    // Hack for now
    let selectedPoint: RafflesCityPickUpDropOffPoints
}
