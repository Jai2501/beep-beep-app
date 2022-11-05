//
//  ThemeViewModel.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 4/11/22.
//

import SwiftUI

class ThemeViewModel: ObservableObject {
    @Published var theme: ThemeModel
    
    var orignalColor: Color = Color("b-light-orange")
    var wheelChairColor: Color = Color("b-teal")
    var seniorCitizenColor: Color = Color("b-blue")
    var visualImpairmentColor: Color = Color("b-dark-blue")
    var familyWithStrollerColor: Color = Color("b-purple")
    
    // Remember WAVE INVERTED, either invert start or end point or Colors Array
    init() {
        theme = ThemeModel(
            themeColor: Color("b-light-orange"),
            themeGradientColor: LinearGradient(
                colors: [orignalColor,
                         orignalColor.opacity(0.25)],
                startPoint: .top,
                endPoint: .bottom)
        )
    }
    
    func changeThemeToWheelChairUser() {
        theme = ThemeModel(
            themeColor: Color("b-teal"),
            themeGradientColor: LinearGradient(
                colors: [wheelChairColor,
                         wheelChairColor.opacity(0.5)],
                startPoint: .top,
                endPoint: .bottom)
        )
    }
    
    func changeThemeToSeniorChairUser() {
        theme = ThemeModel(
            themeColor: Color("b-blue"),
            themeGradientColor: LinearGradient(
                colors: [seniorCitizenColor,
                         seniorCitizenColor.opacity(0.5)],
                startPoint: .top,
                endPoint: .bottom)
        )
    }
    
    func changeThemeToVisualImpairmentUser() {
        theme = ThemeModel(
            themeColor: Color("b-dark-blue"),
            themeGradientColor: LinearGradient(
                colors: [visualImpairmentColor,
                         visualImpairmentColor.opacity(0.5)],
                startPoint: .top,
                endPoint: .bottom)
        )
    }
    
    func changeThemeToFamilyWithStrollerUser() {
        theme = ThemeModel(
            themeColor: Color("b-purple"),
            themeGradientColor: LinearGradient(
                colors: [familyWithStrollerColor,
                         familyWithStrollerColor.opacity(0.5)],
                startPoint: .top,
                endPoint: .bottom)
        )
    }
    
    func changeThemeToOrignalUser() {
        theme = ThemeModel(
            themeColor: Color("b-light-orange"),
            themeGradientColor: LinearGradient(
                colors: [Color("b-light-orange"),
                         Color("b-light-orange").opacity(0.25)],
                startPoint: .top,
                endPoint: .bottom)
        )
    }
}
