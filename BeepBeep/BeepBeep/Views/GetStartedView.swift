//
//  GetStartedView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 4/11/22.
//

import SwiftUI

struct GetStartedView: View {
    @ObservedObject var appTheme = ThemeViewModel()
    
    @State var isNoSpecialAssistanceRequired = false
    
    @State var isWheelChairUser = false
    @State var isSeniorCitizenUser = false
    @State var isVisualImpairmentUser = false
    @State var isFamilyWithStrollers = false
    
    // Functions to handle tapping and untapping each component
    func tappedOnWheelChairUser() {
        // Can add here an if condition for unchecking purposes and changing to orig background then
        appTheme.changeThemeToWheelChairUser()
        isWheelChairUser.toggle()
        
        if (isSeniorCitizenUser) {
            isSeniorCitizenUser.toggle()
        }
        
        if (isVisualImpairmentUser) {
            isVisualImpairmentUser.toggle()
        }
        
        if (isFamilyWithStrollers) {
            isFamilyWithStrollers.toggle()
        }
        
        if (isNoSpecialAssistanceRequired) {
            isNoSpecialAssistanceRequired.toggle()
        }
    }
    
    func tappedOnSeniorCitizenUser() {
        appTheme.changeThemeToSeniorChairUser()
        isSeniorCitizenUser.toggle()
        
        
        if (isWheelChairUser) {
            isWheelChairUser.toggle()
        }
        
        if (isVisualImpairmentUser) {
            isVisualImpairmentUser.toggle()
        }
        
        if (isFamilyWithStrollers) {
            isFamilyWithStrollers.toggle()
        }
        
        if (isNoSpecialAssistanceRequired) {
            isNoSpecialAssistanceRequired.toggle()
        }
    }
    
    func tappedOnVisualImpairmentUser() {
        appTheme.changeThemeToVisualImpairmentUser()
        isVisualImpairmentUser.toggle()
        
        if (isWheelChairUser) {
            isWheelChairUser.toggle()
        }
        
        if (isSeniorCitizenUser) {
            isSeniorCitizenUser.toggle()
        }
        
        if (isFamilyWithStrollers) {
            isFamilyWithStrollers.toggle()
        }
        
        if (isNoSpecialAssistanceRequired) {
            isNoSpecialAssistanceRequired.toggle()
        }
    }
    
    func tappedOnFamilyWithStrollerUser() {
        appTheme.changeThemeToFamilyWithStrollerUser()
        isFamilyWithStrollers.toggle()
        
        if (isWheelChairUser) {
            isWheelChairUser.toggle()
        }
        
        if (isSeniorCitizenUser) {
            isSeniorCitizenUser.toggle()
        }
        
        if (isVisualImpairmentUser) {
            isVisualImpairmentUser.toggle()
        }
        
        if (isNoSpecialAssistanceRequired) {
            isNoSpecialAssistanceRequired.toggle()
        }
    }
    
    func tappedOnNoSpecialAssistanceUser() {
        isNoSpecialAssistanceRequired.toggle()
        appTheme.changeThemeToOrignalUser()
        
        if (isWheelChairUser) {
            isWheelChairUser.toggle()
        }
        
        if (isSeniorCitizenUser) {
            isSeniorCitizenUser.toggle()
        }
        
        if (isVisualImpairmentUser) {
            isVisualImpairmentUser.toggle()
        }
        
        if (isFamilyWithStrollers) {
            isFamilyWithStrollers.toggle()
        }
    }
    
    var body: some View {
        
        ZStack {
            GetStartedViewWaveBackground(
                backgroundColour: $appTheme.theme.themeColor,
                backgroundColourGradient: $appTheme.theme.themeGradientColor
            )
            
            RoundedRectangle(cornerRadius: 25)
                .blendMode(.destinationOut)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
                .overlay {
                    VStack {
                        Text("Welcome!")
                            .font(.headline)
                            .padding(.top, 115)
                        
                        Text("Help us get to know you, \n to better serve your needs!")
                            .font(.headline)
                            .padding(.top, 8)
                            .multilineTextAlignment(.center)
                        
                        Text("Dont worry, you can still change your ride options later")
                            .font(.caption)
                            .padding(.top, 8)
                        
                        Text("Are you a...")
                            .font(.headline)
                            .padding(.top, 55)
                        
                        VStack {
                            HStack {
                                UserProfileSelectionComponent(
                                    selectionImage: Image("WheelchairUserProfileSelection"),
                                    selectionText: "Wheelchair User",
                                    selectionColor: appTheme.wheelChairColor,
                                    selectionImageHeight: 41,
                                    selectionImageWidth: 29,
                                    isTapped: $isWheelChairUser
                                )
                                .onTapGesture {
                                    // Figure out this is not working -> SOLVED
                                    tappedOnWheelChairUser()
                                }
                                
                                UserProfileSelectionComponent(
                                    selectionImage: Image("SeniorCitizenUserProfileSelection"),
                                    selectionText: "Senior Citizen",
                                    selectionColor: appTheme.seniorCitizenColor,
                                    selectionImageHeight: 41,
                                    selectionImageWidth: 24,
                                    isTapped: $isSeniorCitizenUser
                                )
                                .onTapGesture {
                                    tappedOnSeniorCitizenUser()
                                }
                            }
                            
                            HStack {
                                UserProfileSelectionComponent(
                                    selectionImage: Image("VisualImpairmentUserProfileSelection"),
                                    selectionText: "User With Visual Impairment",
                                    selectionColor: appTheme.visualImpairmentColor,
                                    selectionImageHeight: 41,
                                    selectionImageWidth: 36,
                                    isTapped: $isVisualImpairmentUser
                                )
                                .onTapGesture {
                                    tappedOnVisualImpairmentUser()
                                }
                                
                                UserProfileSelectionComponent(
                                    selectionImage: Image("FamilyWithStrollerUserProfileSelection"),
                                    selectionText: "Family With \nStrollers",
                                    selectionColor: appTheme.familyWithStrollerColor,
                                    selectionImageHeight: 41,
                                    selectionImageWidth: 44,
                                    isTapped: $isFamilyWithStrollers
                                )
                                .onTapGesture {
                                    tappedOnFamilyWithStrollerUser()
                                }
                            }
                        }
                        
                        Toggle(isOn: $isNoSpecialAssistanceRequired) {
                            HStack {
                                RoundedRectangle(cornerRadius: 3)
                                    .fill(isNoSpecialAssistanceRequired ? .orange : .white)
                                    .frame(width: 20, height: 20)
                                    .border(isNoSpecialAssistanceRequired ? .white : .orange)
                                    .cornerRadius(3)
                                    .overlay {
                                        if (isNoSpecialAssistanceRequired) {
    //                                        Image(systemName: "checkmark")
    //                                            .fill(.white)
    //                                            .frame(width: 10, height: 10)
                                            
                                            Circle()
                                                .fill(.white)
                                                .frame(width: 10, height: 10)
                                        }
                                    }
                                    .onTapGesture {
                                        tappedOnNoSpecialAssistanceUser()
                                    }
                                
                                Text("No special assistance required")
                                    .underline()
                                    .foregroundColor(Color("b-orange"))
                            }

                        }
                        .tint(.clear)
                        .toggleStyle(.button)

                        NavigationLink (
                            destination: EnterPhoneNumberView(),
                            label: {
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 270, height: 40)
                                    .foregroundColor(Color("b-orange"))
                                    .overlay(
                                        Text("Next")
                                            .foregroundColor(.white)
                                            .bold()
                                    )
                        })
                        .padding(8)
                        
                        Spacer()
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .compositingGroup()
        }
        .navigationTitle("Get Started")
//        .environmentObject(appTheme)
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
