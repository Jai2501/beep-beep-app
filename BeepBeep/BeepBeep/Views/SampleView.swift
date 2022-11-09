//
//  SampleView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 8/11/22.
//

import SwiftUI

struct SampleView: View {
    @FocusState var activeOtpField: OtpField?
    @StateObject var otpModel: OtpViewModel = .init()
    
    @State var countryCode: String = "+65"
    @State var phoneNumber: String = "12345678"
    
    @State var backgroundColor: Color = .cyan
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Color.clear
            
            Image("GetStartedBackgroundCut")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(backgroundColor.opacity(0.3))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Enter the 6 digit code sent to")
                    .bold()
                
                Text(countryCode + " " + phoneNumber)
                    .bold()
                
                Spacer()
                
                OtpField()
                
                Spacer()
                
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
                
                Spacer()
            }

                ZStack(alignment: .bottom) {
                    
                    Color.clear
                    
                    VStack {
                        NavigationLink (
                            destination: SampleView(),
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
                        .focused($activeOtpField, equals: .noField)
                        
                        Text("By singing up, you agree to our Privacy Policy and \n Terms & Conditions")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                }
            .onChange(of: otpModel.otpFields) { newValue in
                otpConditions(newValue: newValue)
            }
        }
        .onAppear {
            otpModel.updatePhoneNumberInRealtimeDatabase()
            //user.updateUserPhoneNumber(phoneNumber: otpModel.phoneNumber)
        }
        .ignoresSafeArea(.keyboard, edges: .all)
        .navigationTitle("Verification")
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    // To close the keyboard
                    activeOtpField = nil
                }
            }
        }
    }
    
    // Figure out Keyboard not Popping down issue lol
    
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
                                    (activeOtpField == activeStateForIndex(index: index)) ? .cyan : Color("b-light-gray"),
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
        case 5:
            return .field6
        default:
            return .noField
        }
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
