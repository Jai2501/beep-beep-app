//
//  SelectRideTypeView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 11/11/22.
//

import SwiftUI
import CoreLocation
import MapKit

struct SelectRideTypeView: View {
    
//    1.2980064310592392, 103.80815165586802
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.2980064310592392, longitude: 103.80815165586802), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    @ObservedObject var rafflesCityPoints: RafflesCityLocationViewModel = .init()
    
    @State var currentLocation: String = "Raffles City Shopping Center"
    @State var currentLocationDescription = "Stamford Rd Entrance"
    
    @State var destinationLocation: String = "UTown, NUS"
    @State var destinationLocationDescription: String = "12km | 2 College Avenue West, S138607"
    
    var body: some View {
        ZStack(alignment: .top) {
//            Map(coordinateRegion: $mapRegion)
//                .edgesIgnoringSafeArea(.all)
            
            Map(coordinateRegion: $mapRegion, annotationItems: rafflesCityPoints.pickUpAndDropOffLocation) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    
                    if (!(location.name == "Stamford Road Entrance")) {
                        Image("SelectedLocationMarker")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 86, height: 100)
                    } else {
                        Image(systemName: "circlebadge")
                            .foregroundColor(Color("b-turqoise"))
                            .font(.title2)
                            .fontWeight(.heavy)
                            .padding(.leading)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(width: 325, height: 69)
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
                                    .padding(.bottom, -10)
                                
                                TextField("Current Location Description", text: $currentLocationDescription)
                                    .foregroundColor(Color("b-black"))
                                    .font(.caption)
                            }
                        }
                    }
                
                VStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 3, height: 3)
                        .padding(.vertical, -0.5)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 3, height: 10)
                        .padding(.bottom, -5.5)
                    
                }
                .foregroundColor(Color("b-orange"))
                .padding(.leading, UIScreen.main.bounds.width * -0.3525)
                .padding(.vertical, -7.5)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(width: 325, height: 58)
                    .shadow(radius: 5)
                    .overlay {
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(Color("b-orange"))
                                .font(.callout)
                                .padding(.leading)
                            
                            VStack(alignment: .leading) {
                                TextField("Send me to...", text: $destinationLocation)
                                    .foregroundColor(Color("b-black"))
                                    .fontWeight(.heavy)
                                    .padding(.bottom, -10)
                                
                                TextField("Send me to...", text: $destinationLocationDescription)
                                    .foregroundColor(Color("b-black"))
                                    .font(.caption)
                            }
                        }
                    }

                Spacer()
                
                ZStack(alignment: .bottom) {
                    SelectRideTypeBottomComponent()
                    
                    NavigationLink (
                        destination: SearchAndFindAvView(),
                        label: {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 300, height: 39)
                                .foregroundColor(Color("b-orange"))
                                .overlay(
                                    Text("Book Ride")
                                        .foregroundColor(.white)
                                        .bold()
                                )
                    })
                    .padding(.bottom, 1)
                }
            }
        }
        .ignoresSafeArea(.keyboard, edges: .all)
    }
    
    func doSomething() -> UIImage {
        let myCoords: [CLLocationCoordinate2D] = [
            .init(latitude: 42.42, longitude: 42.42),
            .init(latitude: 42.43, longitude: 42.425),
            .init(latitude: 42.425, longitude: 42.427),
            .init(latitude: 42.422, longitude: 42.426),
        ]
        
        let r = MKPolylineRenderer(polyline: .init(coordinates: myCoords, count: myCoords.count))
        let path = r.path!

        let bezier = UIBezierPath(cgPath: path)
        bezier.apply(.init(scaleX: 0.05, y: 0.05))

        let renderer = UIGraphicsImageRenderer(bounds: .init(x: 0, y: 0, width: 640, height: 480))
        let image = renderer
            .image { context in
                let size = renderer.format.bounds.size

                UIColor.darkGray.setFill()
                context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))

                UIColor.black.setStroke()
                bezier.lineWidth = 5
                bezier.stroke()
        }
        
        return image
    }
}

struct SelectRideTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectRideTypeView()
    }
}
