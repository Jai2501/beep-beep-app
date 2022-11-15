//
//  LocationMarker.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 11/11/22.
//

import SwiftUI

struct LocationMarker: View {
//    @State var selectedLocation: Bool
    @State var location: RafflesCityPickUpDropOffPoints
    
    @EnvironmentObject var rafflesCity: RafflesCityLocationViewModel
    
    var body: some View {
        Image(location == rafflesCity.currentSelectedLocation ? "SelectedLocationMarker" : "OtherAvailableLocationMarker")
            .resizable()
            .scaledToFit()
            .frame(width: location == rafflesCity.currentSelectedLocation ? 86 : 32.5, height: location == rafflesCity.currentSelectedLocation ? 100 : 32.5)
    }
}
