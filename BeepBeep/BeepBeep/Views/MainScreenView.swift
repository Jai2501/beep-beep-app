//
//  MainScreenView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 8/11/22.
//

import SwiftUI

struct MainScreenView: View {
    @State var test: String = ""
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color.clear
            
            Image("MainScreen")
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                Spacer()
                
                Text("Where do \nyou want to go?")
                    .multilineTextAlignment(.leading)
                    .font(.largeTitle)
                    .bold()
                    .padding(.trailing, UIScreen.main.bounds.width * 0.2)
                
                // Embedd this into Nav link
                
                NavigationLink(destination: SelectDropLocationView()) {
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.white)
                        .shadow(radius: 3)
                        .frame(width: UIScreen.main.bounds.width * 0.8,
                        height: UIScreen.main.bounds.width * 0.1)
                        .overlay {
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(Color("b-orange"))
                                
                                Text("My destination...")
                                    .foregroundColor(Color("b-light-gray-1"))
                                    .font(.subheadline)
                            }
                            .padding(.trailing, UIScreen.main.bounds.width * 0.35)
                        }
                }
                
                VStack() {
                    
                    Text("Saved Places")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.trailing, UIScreen.main.bounds.width * 0.57)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundColor(Color("b-light-turqoise-1"))
                                .frame(width: 96, height: 31)
                                .overlay {
                                    HStack {
                                        Image(systemName: "house.fill")
                                            .foregroundColor(.white)
                                        
                                        Text("Home")
                                    }
                                    .foregroundColor(.white)
                                    .font(.caption)
                                    .bold()
                                }
                            
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundColor(Color("b-light-turqoise-1"))
                                .frame(width: 96, height: 31)
                                .overlay {
                                    HStack {
                                        Image(systemName: "suitcase.fill")
                                            .foregroundColor(.white)
                                        
                                        Text("Work")
                                    }
                                    .foregroundColor(.white)
                                    .font(.caption)
                                    .bold()
                                }
                            
                            Image(systemName: "plus.circle")
                                .foregroundColor(Color("b-orange"))
                                .font(.title2)
                        }
//                        .padding(.trailing, UIScreen.main.bounds.width * 0.19)
                    }
                    .padding(.horizontal, UIScreen.main.bounds.width * 0.11)
                }
                
                Spacer()
            }
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
