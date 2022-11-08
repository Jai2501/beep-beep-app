//
//  UserViewModel.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 6/11/22.
//

import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user: UserModel
    
    init() {
        user = UserModel(name: "Sample Name", email: "Sample Email", phoneNumber: "Sample Number", userSpecialNeeds: .notDefined)
    }
    
    init(name: String, email: String, phoneNumber: String, specialNeeds: UserSpecialNeeds) {
        user = UserModel(name: name, email: email, phoneNumber: phoneNumber, userSpecialNeeds: specialNeeds)
    }
    
    func updateUserName(name: String) {
        self.user = UserModel(name: name, email: self.user.email, phoneNumber: self.user.phoneNumber, userSpecialNeeds: self.user.userSpecialNeeds)
    }
    
    func updateUserEmail(email: String) {
        self.user = UserModel(name: self.user.name, email: email, phoneNumber: self.user.phoneNumber, userSpecialNeeds: self.user.userSpecialNeeds)
    }
    
    func updateUserPhoneNumber(phoneNumber: String) {
        self.user = UserModel(name: self.user.name, email: self.user.email, phoneNumber: phoneNumber, userSpecialNeeds: self.user.userSpecialNeeds)
    }
    
    func updateUserSpecialNeeds(specialNeeds: UserSpecialNeeds) {
        self.user = UserModel(name: self.user.name, email: self.user.email, phoneNumber: self.user.phoneNumber, userSpecialNeeds: specialNeeds)
    }
}
