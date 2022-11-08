//
//  EnterOtpView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 5/11/22.
//

import SwiftUI

enum OtpField {
    case field1
    case field2
    case field3
    case field4
    case field5
    case field6
}

struct EnterOtpView: View {
//    @StateObject var otpModel: OtpViewModel = .init()
    @FocusState var activeOtpField: OtpField?
    
    @EnvironmentObject var otpModel: OtpViewModel
    @EnvironmentObject var appTheme: ThemeViewModel
    @EnvironmentObject var user: UserViewModel
    
    // Bind These Later from Previous View
    var countryCode: String = "+65"
    var phoneNumer: String = "12345678"
    
//    var backgroundColor: Color = .red
    
    @State var otpCodeOne: String = "1"
    
    var body: some View {
        ZStack {
            VStack {
                Image("GetStartedBackground")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(appTheme.theme.themeColor.opacity(0.3))
                    .frame(width: UIScreen.main.bounds.width * 1.55)
                    .padding(.bottom, UIScreen.main.bounds.height * 1.2)
            }
            .edgesIgnoringSafeArea(.all)
            
                VStack {
                    Text("Enter the 6 digit code sent to")
                        .bold()
                    Text(countryCode + " " + phoneNumer)
                        .bold()
                    
                    OtpField()
                        .padding(.vertical, 60)
                    
                    VStack {
                        Text("Didn't receive it?")
                            .foregroundColor(Color("b-orange"))
                            .font(.footnote)
                        
                        Button {
                            // Trigger Code for OTP Resend
                            // Dummy purposes
                        } label: {
                            Text("Get a New Code")
                                .foregroundColor(Color("b-orange"))
                                .bold()
                                .font(.footnote)
                                .underline()
                        }
                    }
                    .padding(.bottom, 15)
                    
//                    Button {
//                        // Verify OTP, and if Correct, take to next page :)
//
//                    } label: {
//                        RoundedRectangle(cornerRadius: 25)
//                            .frame(width: 270, height: 40)
//                            .foregroundColor(Color("b-orange"))
//                            .overlay(
//                                Text("Verify")
//                                    .foregroundColor(.white)
//                                    .bold()
//                            )
//                    }
//                    .padding(5)
//                    .disabled(!checkAllFieldsFilled())
//                    .opacity(checkAllFieldsFilled() ? 1 : 0.5)
                    
                    NavigationLink (
                        destination: EnterNameAndEmailView(),
//                            .environmentObject(otpModel)
//                            .environmentObject(appTheme)
//                            .environmentObject(user),
                        label: {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 280, height: 40)
                                .foregroundColor(Color("b-orange"))
                                .overlay(
                                    Text("Verify")
                                        .foregroundColor(.white)
                                        .bold()
                                )
                                .padding(5)
                                .disabled(!checkAllFieldsFilled())
                                .opacity(checkAllFieldsFilled() ? 1 : 0.5)
                        })
                        .padding(8)
                        .disabled(!checkAllFieldsFilled())
                    
                    Spacer()
                }
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height)
                .padding()
                .onChange(of: otpModel.otpFields) { newValue in
                    otpConditions(newValue: newValue)
                }
                .padding(.top, UIScreen.main.bounds.height * 0.4)
                .ignoresSafeArea(.keyboard, edges: .bottom)
                
            }
            .onAppear {
                // Put in a random number and go
    //            Task { await otpModel.sendOtp() }
                otpModel.updatePhoneNumberInRealtimeDatabase()
                user.updateUserPhoneNumber(phoneNumber: otpModel.phoneNumber)
            }
            .navigationTitle("Verification")
//            .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    @ViewBuilder
    func OtpField() -> some View {
        HStack(spacing: 14) {
            ForEach(0..<6, id: \.self) { index in
                VStack {
                    TextField("", text: $otpModel.otpFields[index])
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .focused($activeOtpField, equals: activeStateForIndex(index: index))
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    (activeOtpField == activeStateForIndex(index: index)) ? appTheme.theme.themeColor : Color("b-light-gray"),
                                    lineWidth: 2)
                                .frame(width: 45, height: 50)
                        }
                    
//                    Rectangle()
//                        .fill((activeOtpField == activeStateForIndex(index: index)) ? backgroundColor : Color("b-light-gray"))
//                        .frame(height: 4)
                }
                .padding()
                .frame(width: 40)
            }
        }
    }
    
    // Verify all fields filled up
    func checkAllFieldsFilled() -> Bool {
        for index in 0..<6 {
            if (otpModel.otpFields[index].isEmpty) {
                return false
            }
        }
        return true
    }
    
    func otpConditions(newValue: [String]) {
        // To enable clicking on auto otp completion
        for index in 0..<6 {
            if (newValue[index].count == 6) {
                DispatchQueue.main.async {
                    otpModel.otpText = newValue[index]
                    otpModel.otpFields[index] = ""
                    
                    for item in otpModel.otpText.enumerated() {
                        otpModel.otpFields[item.offset] = String(item.element)
                    }
                }
                return
            }
        }
        
        
        // To Move to the next field, as this current field has an iput
        for index in 0..<6 {
            if ((newValue[index].count == 1) && (activeStateForIndex(index: index) == activeOtpField)) {
                activeOtpField = activeStateForIndex(index: index + 1)
            }
        }
        
        // To Move back, as any erase happens
        for index in 0..<6 {
            if ((newValue[index].isEmpty) && !newValue[(index <= 0) ? 0 : (index - 1)].isEmpty) {
                activeOtpField = activeStateForIndex(index: index - 1)
            }
        }
        
        // To only take last value entered in the text field
        for index in 0..<6 {
            if (newValue[index].count > 1) {
                otpModel.otpFields[index] = String(newValue[index].last!)
            }
        }
        
        // Check if last field has a value, and can close keyboard
    }
    
    func activeStateForIndex(index: Int) -> OtpField {
        switch(index) {
        case 0:
            return .field1
        case 1:
            return .field2
        case 2:
            return .field3
        case 3:
            return .field4
        case 4:
            return .field5
        default:
            return .field6
        }
    }
}

struct EnterOtpView_Previews: PreviewProvider {
    static var previews: some View {
        EnterOtpView()
    }
}
