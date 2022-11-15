//
//  ChooseDestinationFromMapView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 11/11/22.
//

import SwiftUI
import MapKit

// Raffles City Coordinated: 1.294020274655083, 103.8531425106119
struct ChooseDestinationFromMapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.294020274655083, longitude: 103.8531425106119), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    
    @ObservedObject var rafflesCityPoints: RafflesCityLocationViewModel = .init()
    
    @State var width: CGFloat = 16
    @State var height: CGFloat = 22
    @State var currentLocation: String = "Raffles City Shopping Center"
    
    @State var isThisLocationSelected: Bool = true
    // location.name == pickUpDropOffLocationsOfRafflesCity.getPickUpDropOffPointName(location: .stamfordRoadEntrance)
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(coordinateRegion: $mapRegion, annotationItems: rafflesCityPoints.locationsCoordinates) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    LocationMarker(location: (location.selectedPoint))
                        .environmentObject(rafflesCityPoints)
                        .onTapGesture {
                            rafflesCityPoints.currentSelectedLocation = location.selectedPoint
                        }
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(width: 325, height: 54)
                    .shadow(radius: 5)
                    .overlay {
                        HStack {
                            Image(systemName: "circlebadge")
                                .foregroundColor(Color("b-turqoise"))
                                .font(.title2)
                                .fontWeight(.heavy)
                                .padding(.leading)
                            
                            VStack(alignment: .leading) {
                                Text("Current Location")
                                    .font(.caption)
                                    .foregroundColor(Color("b-light-gray-1"))
                                    .padding(.bottom, -10)
                                
                                
                                TextField("Current Location", text: $currentLocation)
                                    .foregroundColor(Color("b-black"))
                                    .fontWeight(.heavy)
                            }
                        }
                    }
                
                Spacer()
                
                ZStack(alignment: .bottom) {
                    LocationPickerForMapView()
                        .environmentObject(rafflesCityPoints)
                    
                    NavigationLink (
                        destination: SelectRideTypeView(),
                        label: {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 300, height: 39)
                                .foregroundColor(Color("b-orange"))
                                .overlay(
                                    Text("Confirm Pick-up Location")
                                        .foregroundColor(.white)
                                        .bold()
                                )
                    })
                    .padding(.bottom, 21)
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ChooseDestinationFromMapView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseDestinationFromMapView()
    }
}
