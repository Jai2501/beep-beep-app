//
//  ThemeViewModel.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 4/11/22.
//

import SwiftUI

class ThemeViewModel: ObservableObject {
    @Published var theme: ThemeModel
    
    // Remember WAVE INVERTED, either invert start or end point or Colors Array
    init() {
        theme = ThemeModel(
            themeColor: Color("b-light-orange"),
            themeGradientColor: LinearGradient(
                colors: [Color("b-light-orange"),
                         Color("b-light-orange").opacity(0.25)],
                startPoint: .top,
                endPoint: .bottom)
        )
    }
    
    func changeThemeToWheelChairUser() {
        theme = ThemeModel(
            themeColor: Color("b-teal"),
            themeGradientColor: LinearGradient(
                colors: [Color("b-teal"),
                         Color("b-teal").opacity(0.5)],
                startPoint: .top,
                endPoint: .bottom)
        )
    }
    
    func changeThemeToSeniorChairUser() {
        theme = ThemeModel(
            themeColor: Color("b-blue"),
            themeGradientColor: LinearGradient(
                colors: [Color("b-blue"),
                         Color("b-blue").opacity(0.5)],
                startPoint: .top,
                endPoint: .bottom)
        )
    }
    
    func changeThemeToVisualImpairmentUser() {
        theme = ThemeModel(
            themeColor: Color("b-dark-blue"),
            themeGradientColor: LinearGradient(
                colors: [Color("b-dark-blue"),
                         Color("b-dark-blue").opacity(0.5)],
                startPoint: .top,
                endPoint: .bottom)
        )
    }
    
    func changeThemeToFamilyWithStrollerUser() {
        theme = ThemeModel(
            themeColor: Color("b-purple"),
            themeGradientColor: LinearGradient(
                colors: [Color("b-purple"),
                         Color("b-purple").opacity(0.5)],
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
