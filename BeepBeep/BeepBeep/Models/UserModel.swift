//
//  UserModel.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 6/11/22.
//

import SwiftUI

enum UserSpecialNeeds {
    case noSpecialNeeds
    case visuallyImpaired
    case seniorCitizen
    case wheelChair
    case familyWithStroller
    case notDefined
}

struct UserModel: Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var phoneNumber: String
    var userSpecialNeeds: UserSpecialNeeds
}
