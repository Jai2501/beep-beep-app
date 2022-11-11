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
                .fill(.cyan)
                .frame(width: 325, height: 54)
                .overlay {
                    Picker("Please choose a color", selection: $selectedLocation) {
                        ForEach(RafflesCityPickUpDropOffPoints.allCases, id: \.self) { item in
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("b-light-turqoise-2"))
                                .frame(width: 303, height: 25)
                                .overlay {
                                    Text(rafflesCityLocation.getPickUpDropOffPointName(location: item))
                                        .foregroundColor(Color("b-black"))
                                }
  
        //                    Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            
            
//            Picker("Please choose a color", selection: $selectedLocation) {
//                ForEach(RafflesCityPickUpDropOffPoints.allCases, id: \.self) { item in
//                    Text(rafflesCityLocation.getPickUpDropOffPointName(location: item))
////                    Text($0)
//                }
//            }
//            .frame(maxWidth: UIScreen.main.bounds.width * 0.82, maxHeight: 80)
//            .pickerStyle(.wheel)
            //.frame(width: 200, height: 10)
            
//            Text("You selected: \(rafflesCityLocation.getPickUpDropOffPointName( location: selectedLocation))")
//                .padding(.vertical, 20)
        }
        .frame(width: 325, height: 54)
        .clipped()
    }
}

struct LocationPickerForMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerForMapView()
    }
}
