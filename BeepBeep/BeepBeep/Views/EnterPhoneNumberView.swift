//
//  EnterPhoneNumberView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 5/11/22.
//

import SwiftUI

struct EnterPhoneNumberView: View {
    @State var countryCode: String = ""
    @State var phoneNumber: String = ""
    
    @Binding var backgroundColor: Color
    @Binding var backgroundColorGradient: LinearGradient
    
    var body: some View {
        ZStack {
                //                Image("WelcomeScreenMain")
                //                    .resizable()
                //                .frame(width: 350, height: 200)
                //
                //                Spacer()
  
            // Enable Animation -> Issue: Moving Objects
            
//                GetStartedViewWaveBackground(
//                    backgroundColour: $backgroundColor,
//                    backgroundColourGradient: $backgroundColorGradient
//                )
//                .padding(.bottom, UIScreen.main.bounds.height * 0.95)
            
            VStack {
                Image("GetStartedBackground")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(backgroundColor.opacity(0.3))
                    .frame(width: UIScreen.main.bounds.width * 1.55)
                    .padding(.bottom, UIScreen.main.bounds.height * 1.2)
            }
            .edgesIgnoringSafeArea(.all)
            
            RoundedRectangle(cornerRadius: 25)
                .blendMode(.destinationOut)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
                .overlay {
                    VStack(alignment: .center) {
                        
                        Text("Phone Number")
                            .bold()
                        //                    .frame(width: .infinity, alignment: .leading)
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("b-light-gray"), lineWidth: 2)
                                .frame(width: 70, height: 45)
                                .overlay {
                                    TextField("+65", text: $countryCode)
                                        .padding()
                                        .keyboardType(.numberPad)
                                }
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("b-light-gray"), lineWidth: 2)
                                .frame(width: 250, height: 45)
                                .border(Color("b-light-gray"))
                                .overlay {
                                    TextField("Phone Number", text: $phoneNumber)
                                        .padding()
                                        .keyboardType(.numberPad)
                                }
                        }
                        .padding(.bottom, 150)
                        
                        NavigationLink (
                            destination: LogInView(),
                            label: {
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 280, height: 40)
                                    .foregroundColor(Color("b-orange"))
                                    .overlay(
                                        Text("Send me a verification code")
                                            .foregroundColor(.white)
                                            .bold()
                                    )
                            })
                        .padding(8)
                        
                        Spacer()
                    }
                    .padding()
                    .padding(.top, 140)
                }
                .compositingGroup()
        }
        .edgesIgnoringSafeArea(.all)
        .navigationTitle("Phone Number")
    }
}

//struct EnterPhoneNumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterPhoneNumberView()
//    }
//}
