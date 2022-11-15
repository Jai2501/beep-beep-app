//
//  LocationPickerForMapView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 11/11/22.
//

import SwiftUI

struct LocationPickerForMapView: View {
//    @State private var selectedLocation: RafflesCityPickUpDropOffPoints = .northBridgeRoadEntrance
    
    @EnvironmentObject var rafflesCityPoints: RafflesCityLocationViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.clear
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: UIScreen.main.bounds.width, height: 262)
                .shadow(radius: 1)
            
            VStack(alignment: .center) {
                Image(rafflesCityPoints.getPickUpDropOffPointPictureName(location: rafflesCityPoints.currentSelectedLocation))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 194)
                    .shadow(radius: 2)
                // 350 - 214
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.clear)
                        .frame(width: 325, height: 61)
                    // 54
                        .overlay {
                            Picker("Please choose a color", selection: $rafflesCityPoints.currentSelectedLocation) {
                                ForEach(RafflesCityPickUpDropOffPoints.allCases, id: \.self) { item in
                                    
                                    RoundedRectangle(cornerRadius: 7)
                                        .fill(.clear)
        //                                .fill(Color("b-light-turqoise-2"))
        //                                .frame(width: 306, height: 29)
                                        .overlay {
                                            Text(rafflesCityPoints.getPickUpDropOffPointName(location: item))
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
                .frame(width: 325, height: 64)
                .clipped()
                .padding(.top, 1)
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 40)
                    .foregroundColor(.clear)
                    .overlay(
                        Text("")
                            .foregroundColor(.white)
                            .bold()
                    )
                    .padding()
                    .padding(.bottom, 5)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LocationPickerForMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerForMapView()
    }
}
