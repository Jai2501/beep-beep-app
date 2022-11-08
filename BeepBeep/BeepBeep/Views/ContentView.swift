//
//  ContentView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 10/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()
                
                Text("Your autonomous ride service, \n ready for all your needs")
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Image("WelcomeScreenMain")
                    .resizable()
                    .frame(width:640 ,height: 400)
                    .padding(.leading, 290)
                
                Spacer()
                
                NavigationLink (
                    destination: GetStartedView(),
                    label: {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 250, height: 40)
                            .foregroundColor(Color("b-orange"))
                            .overlay(
                                Text("Sign Up")
                                    .foregroundColor(.white)
                                    .bold()
                            )
                })
                .padding(5)
                
                NavigationLink(
                    destination: DirectionAndGuidanceView(),
                    label: {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("b-orange"), lineWidth: 2)
                            .frame(width: 250, height: 40)
                            .foregroundColor(.white)
                            .overlay(
                                Text("Log In")
                                    .foregroundColor(Color("b-orange"))
                                    .bold()
                            )
                })
                .padding(5)
                
                Spacer()
            }
        }
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
////                .foregroundColor(Color("b-light-gray"))
//            Text("Hello, world!")
////                .foregroundColor(Color("b-orange"))
//        }
//        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
