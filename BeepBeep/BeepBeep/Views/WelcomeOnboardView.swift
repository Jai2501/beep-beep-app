//
//  WelcomeOnboardView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 13/11/22.
//

import SwiftUI

struct WelcomeOnboardView: View {
    @State var destinationLocation: String = "UTown, NUS"
    @State var destinationLocationDescription: String = "12km | 2 College Avenue West, S138607"
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.clear
            
            LinearGradient(colors: [.white, Color("b-light-turqoise-2").opacity(0.5)], startPoint: .top, endPoint: .bottom)
            
            Image("WelcomeOnboardFullScreen")
                .resizable()
                .scaledToFit()
                .padding(.top, 30)
            
//            Image("WelcomeOnboardBackground")
//                .resizable()
//                .scaledToFit()
//                .padding(.top, 70)
//
//            ZStack(alignment: .center) {
//                Color.clear
//
//                Image("WelcomeOnboard")
//                    .resizable()
//                    .scaledToFit()
//            }
//
            
            VStack {
                Group {
                    Text("Welcome \nOnboard!")
                        .multilineTextAlignment(.center)
                        .bold()
                        .font(.title)
                        .foregroundColor(Color("b-black"))
                        .padding(.top, 140)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 148, height: 39)
                        .foregroundColor(Color("b-orange"))
                        .overlay(
                            Text("Start Ride")
                                .foregroundColor(.white)
                                .bold()
                        )
                        .padding(.bottom, 190)
                }
                .padding(.trailing, UIScreen.main.bounds.width * 0.4)
                
                Spacer()
                
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
                    .padding(.bottom, 40)
                
                Spacer()
                
                HStack(spacing: 20) {
                    VStack {
                        Image("TripRouteIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 73, height: 73)
                        
                        Text("Trip route")
                            .foregroundColor(Color("b-light-gray-2"))
                            .bold()
                            .font(.caption)
                    }
                    
                    VStack {
                        Image("InrideControlsIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 73, height: 73)
                        
                        Text("In-ride controls")
                            .foregroundColor(Color("b-light-gray-2"))
                            .bold()
                            .font(.caption)
                    }
                    
                    VStack {
                        Image("LiveAvViewIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 73, height: 73)
                        
                        Text("AV live view")
                            .foregroundColor(Color("b-light-gray-2"))
                            .bold()
                            .font(.caption)
                    }
                }
                .padding(.bottom, 25)
                
                // Bottom Tab Bar
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
                    .shadow(radius: 2)
                    .overlay {
                        HStack {
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color("b-light-gray"))
                                .overlay {
                                    HStack {
                                        Image(systemName: "phone.fill")
                                            .foregroundColor(Color("b-light-gray-1"))
                                        
                                        Text("Support")
                                            .foregroundColor(Color("b-light-gray-1"))
                                    }
                                }
                                .frame(width: 140, height: 30)
                                .fontWeight(.semibold)
                                .font(.caption)
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct WelcomeOnboardView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeOnboardView()
    }
}
