//
//  SampleView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 8/11/22.
//

import SwiftUI

struct SampleView: View {
    @State var countryCode: String = "+65"
    @State var phoneNumber: String = "12345678"
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.clear
            
            Image("GetStartedBackgroundCut")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(.cyan.opacity(0.3))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Phone Number")
                    .bold()
                    .multilineTextAlignment(.leading)
                
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("b-light-gray"), lineWidth: 2)
                        .frame(width: 70, height: 45)
                        .overlay {
                            TextField("+65", text: $countryCode)
                                .padding()
                                .keyboardType(.phonePad)
                        }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("b-light-gray"), lineWidth: 2)
                        .frame(width: 250, height: 45)
                        .overlay {
                            TextField("Phone Number", text: $phoneNumber)
                                .padding()
                                .keyboardType(.numberPad)
                        }
                }
//                .padding(.bottom, UIScreen.main.bounds.height * 0.5)
                Spacer()
            }
            .padding(.top, UIScreen.main.bounds.height * 0.125)
            
            ZStack(alignment: .center) {
                
                Color.clear
                
                NavigationLink (
                    destination: SampleView(),
                    label: {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 280, height: 40)
                            .foregroundColor(Color("b-orange"))
                            .overlay(
                                Text("Send me a verification code")
                                    .foregroundColor(.white)
                                    .bold()
                            )
                            .opacity(isPhoneNumberValid() ? 1 : 0.5)
                            .disabled(!isPhoneNumberValid())
                    }
                )
    //                .padding(.bottom, UIScreen.main.bounds.height * 0.25)
                .disabled(!isPhoneNumberValid())
            }
        }
        .ignoresSafeArea(.keyboard, edges: .all)
        .navigationTitle("Phone Number")
    }
    
    func isPhoneNumberValid() -> Bool {
        return phoneNumber.count > 5
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
