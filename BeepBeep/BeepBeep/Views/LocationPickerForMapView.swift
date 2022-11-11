//
//  LocationPickerForMapView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 11/11/22.
//

import SwiftUI

struct LocationPickerForMapView: View {
    @State private var selectedLocation: RafflesCityPickUpDropOffPoints = .northBridgeRoadEntrance
    @ObservedObject var rafflesCityLocation: RafflesCityLocationViewModel = .init()

    var body: some View {
        VStack {
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.clear)
                .frame(width: 325, height: 54)
                .overlay {
                    Picker("Please choose a color", selection: $selectedLocation) {
                        ForEach(RafflesCityPickUpDropOffPoints.allCases, id: \.self) { item in
                            
                            RoundedRectangle(cornerRadius: 7)
                                .fill(.clear)
//                                .fill(Color("b-light-turqoise-2"))
//                                .frame(width: 306, height: 29)
                                .overlay {
                                    Text(rafflesCityLocation.getPickUpDropOffPointName(location: item))
                                        .foregroundColor(Color("b-black"))
                                }
                        }
                    }
                    .pickerStyle(.wheel)
                }
        }
        .overlay(content: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("b-light-gray"))
        })
//        .border(Color("b-light-gray"))
        .frame(width: 325, height: 54)
        .clipped()
    }
}

struct LocationPickerForMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerForMapView()
    }
}
