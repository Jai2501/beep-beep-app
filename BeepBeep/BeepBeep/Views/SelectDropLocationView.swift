//
//  SelectDropLocationView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 10/11/22.
//

import SwiftUI

struct SelectDropLocationView: View {
    @State var currentLocation: String = "Raffles City Shopping Center"
    @State var destinationLocation: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.clear
            
            Image("BackgroundCutLarge")
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
//                Circle()
//                    .fill(Color("b-light-turqoise-1"))
//                    .blur(radius: 20, opaque: false)
//                    .frame(width: 100, height: 100)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(width: 325, height: 54)
                    .shadow(radius: 5)
                    .overlay {
                        HStack {
                            Image(systemName: "circlebadge")
                                .foregroundColor(Color("b-light-turqoise-1"))
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
                
                VStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 3, height: 7)
                        .padding(.vertical, -7.5)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 3, height: 10)
                        .padding(.bottom, -7.5)
                    
                }
                .foregroundColor(Color("b-orange"))
                .padding(.leading, UIScreen.main.bounds.width * -0.3525)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(width: 325, height: 39)
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
                            }
                        }
                        
                    }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(Color("b-light-turqoise-2"))
                            .frame(width: 81, height: 26)
                            .overlay {
                                HStack {
                                    Image(systemName: "house.fill")
                                    
                                    Text("Home")
                                }
                                .foregroundColor(.black)
                                .font(.caption)
                                .bold()
                            }
                        
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(Color("b-light-turqoise-2"))
                            .frame(width: 81, height: 26)
                            .overlay {
                                HStack {
                                    Image(systemName: "suitcase.fill")
                                    
                                    Text("Work")
                                }
                                .foregroundColor(.black)
                                .font(.caption)
                                .bold()
                            }
                    }
                    .padding(.vertical, 5)
                }
                .padding(.horizontal, UIScreen.main.bounds.width * 0.095)
                
                VStack {
                    PreviousVisitedLocationView(bottomBorder: true, addressHeading: "NUS School of Engineering", addressDescription: "9 Engineering Drive 1, #07-26 EA, Sin...")
                    
                    PreviousVisitedLocationView(bottomBorder: true, addressHeading: "Timbre+", addressDescription: "73A Ayer Rajah Crescent, Singapore 1...")
                    
                    PreviousVisitedLocationView(bottomBorder: false, addressHeading: "Yishun Sapphire", addressDescription: "48 Canberra Drive, S768437")
                }
                .padding(.top)
                
                Spacer()
                
                NavigationLink (
                    destination: ChooseDestinationFromMapView(),
                    label: {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 250, height: 40)
                            .foregroundColor(Color("b-orange"))
                            .overlay(
                                Text("Choose From Map")
                                    .foregroundColor(.white)
                                    .bold()
                            )
                })
                .padding(5)

            }
//            .padding(.top)
        }
        .ignoresSafeArea(.keyboard, edges: .all)
        .navigationTitle("")
    }
}

struct SelectDropLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDropLocationView()
    }
}
