//
//  EnterPhoneNumberView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 5/11/22.
//

import SwiftUI

struct EnterPhoneNumberView: View {
    
    @EnvironmentObject var appTheme: ThemeViewModel
    @EnvironmentObject var user: UserViewModel
    
    @StateObject var otpModel: OtpViewModel = .init()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.clear
            
            Image("GetStartedBackgroundCut")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(appTheme.theme.themeColor.opacity(0.3))
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
                            TextField("+65", text: $otpModel.countryCode)
                                .padding()
                                .keyboardType(.phonePad)
                        }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("b-light-gray"), lineWidth: 2)
                        .frame(width: 250, height: 45)
                        .overlay {
                            TextField("Phone Number", text: $otpModel.phoneNumber)
                                .padding()
                                .keyboardType(.numberPad)
                        }
                }
            }
            .padding(.top, UIScreen.main.bounds.height * 0.125)
            
            ZStack(alignment: .center) {
                Color.clear
                
                NavigationLink (
                    destination: EnterOtpView()
                        .environmentObject(otpModel)
                        .environmentObject(appTheme)
                        .environmentObject(user),
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
                .disabled(!isPhoneNumberValid())
                
            }
        }
        .ignoresSafeArea(.keyboard, edges: .all)
        .navigationTitle("Phone Number")
    }
    
    func isPhoneNumberValid() -> Bool {
        return otpModel.phoneNumber.count > 5
    }
}

//struct EnterPhoneNumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterPhoneNumberView()
//    }
//}
