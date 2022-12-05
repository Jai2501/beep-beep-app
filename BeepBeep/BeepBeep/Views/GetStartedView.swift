//
//  GetStartedView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 4/11/22.
//

import SwiftUI

struct GetStartedView: View {
    @ObservedObject var appTheme: ThemeViewModel = ThemeViewModel()
    @ObservedObject var user: UserViewModel = .init()
    
    @State var isNoSpecialAssistanceRequired: Bool = false
    
    @State var isWheelChairUser: Bool = false
    @State var isSeniorCitizenUser: Bool = false
    @State var isVisualImpairmentUser: Bool = false
    @State var isFamilyWithStrollers: Bool = false
    
    @State var isWhiteTextRequired: Bool = false
    
    func selectedAtleastOneProfileType() -> Bool {
        return (isNoSpecialAssistanceRequired || isWheelChairUser || isSeniorCitizenUser || isVisualImpairmentUser || isFamilyWithStrollers)
    }
    
    func getUserSpecialNeeds() -> UserSpecialNeeds {
        if (isNoSpecialAssistanceRequired) {
            return .noSpecialNeeds
        }
        
        if (isWheelChairUser) {
            return .wheelChair
        }
        
        if (isSeniorCitizenUser) {
            return .seniorCitizen
        }
        
        if (isVisualImpairmentUser) {
            return .visuallyImpaired
        }
        
        if (isFamilyWithStrollers) {
            return .familyWithStroller
        }
        
        return .notDefined
    }
    
    // Functions to handle tapping and untapping each component
    func tappedOnWheelChairUser() {
        // Can add here an if condition for unchecking purposes and changing to orig background then
        appTheme.changeThemeToWheelChairUser()
        isWheelChairUser.toggle()
        isWhiteTextRequired = true
        
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
        
        user.updateUserSpecialNeeds(specialNeeds: getUserSpecialNeeds())
    }
    
    func tappedOnSeniorCitizenUser() {
        appTheme.changeThemeToSeniorChairUser()
        isSeniorCitizenUser.toggle()
        isWhiteTextRequired = true
        
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
        
        user.updateUserSpecialNeeds(specialNeeds: getUserSpecialNeeds())
    }
    
    func tappedOnVisualImpairmentUser() {
        appTheme.changeThemeToVisualImpairmentUser()
        isVisualImpairmentUser.toggle()
        isWhiteTextRequired = true
        
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
        
        user.updateUserSpecialNeeds(specialNeeds: getUserSpecialNeeds())
    }
    
    func tappedOnFamilyWithStrollerUser() {
        appTheme.changeThemeToFamilyWithStrollerUser()
        isFamilyWithStrollers.toggle()
        isWhiteTextRequired = true
        
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
        
        user.updateUserSpecialNeeds(specialNeeds: getUserSpecialNeeds())
    }
    
    func tappedOnNoSpecialAssistanceUser() {
        isNoSpecialAssistanceRequired.toggle()
        appTheme.changeThemeToOrignalUser()
        isWhiteTextRequired = false
        
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
        
        user.updateUserSpecialNeeds(specialNeeds: getUserSpecialNeeds())
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
                    Spacer()
                    
                    VStack {
                        Text("Get Started")
                            .font(.headline)
                            .padding(.top, 57)
                            .padding(.bottom, 33)
                            .foregroundColor(isWhiteTextRequired ? .white : Color("b-black"))
                        
                        
                        Text("Welcome!")
                            .font(.headline)
                            //.padding(.top, 115)
                            .foregroundColor(isWhiteTextRequired ? .white : Color("b-black"))
                        
                        Text("Help us get to know you, \n to better serve your needs!")
                            .font(.headline)
                            .padding(.top, 8)
                            .multilineTextAlignment(.center)
                            .foregroundColor(isWhiteTextRequired ? .white : Color("b-black"))
                        
                        Text("Dont worry, you can still change your ride options later")
                            .font(.caption)
                            .padding(.top, 8)
                            .foregroundColor(isWhiteTextRequired ? .white : Color("b-black"))
                        
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
//                                RoundedRectangle(cornerRadius: 3)
//                                    .fill(isNoSpecialAssistanceRequired ? .orange : .white)
//                                    .frame(width: 20, height: 20)
//                                    .border(isNoSpecialAssistanceRequired ? .white : .orange)
//                                    .cornerRadius(3)
//                                    .overlay {
//                                        if (isNoSpecialAssistanceRequired) {
////                                            RoundedRectangle(cornerRadius: 20)
////                                                .overlay {
////                                                    Image(systemName: "checkmark")
////                                                        .fill(.white)
////                                                        .frame(width: 10, height: 10)
////                                                }
//
//                                            Circle()
//                                                .fill(.white)
//                                                .frame(width: 10, height: 10)
//                                        }
//                                    }
//                                    .onTapGesture {
//                                        tappedOnNoSpecialAssistanceUser()
//                                    }
                                
                                Text("No special assistance required")
                                    .underline()
                                    .foregroundColor(Color("b-orange"))
                                    .font(.footnote)
                            }
                            .onTapGesture {
                                tappedOnNoSpecialAssistanceUser()
                            }

                        }
                        .tint(.clear)
                        .toggleStyle(CheckToggleStyle())
                        .onTapGesture {
                            tappedOnNoSpecialAssistanceUser()
                        }

                        NavigationLink (
                            destination:
                                EnterPhoneNumberView()
                                .environmentObject(appTheme)
                                .environmentObject(user),
                            label: {
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 300, height: 39)
                                    .foregroundColor(Color("b-orange"))
                                    .overlay(
                                        Text("Next")
                                            .foregroundColor(.white)
                                            .bold()
                                    )
                                    .opacity(selectedAtleastOneProfileType() ? 1 : 0.5)
                                    .disabled(!selectedAtleastOneProfileType())
                        })
                        .padding(.top, 8)
                        .padding(.bottom, 4)
                        .disabled(!selectedAtleastOneProfileType())
                        
                        Text("Don’t worry, you can still change your ride options later.")
                            .font(.custom("", size: 10))
                            .foregroundColor(Color("b-black"))
                        
                        Spacer()
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .compositingGroup()
        }
        .navigationTitle("Get Started")
        .navigationBarHidden(true)
//        .environmentObject(appTheme)
    }
}

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? Color("b-orange") : Color("b-orange"))
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
