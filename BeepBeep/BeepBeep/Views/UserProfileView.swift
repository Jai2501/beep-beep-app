//
//  UserProfileView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 8/11/22.
//

import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject var user: UserViewModel
    
    var body: some View {
        Text(user.user.name)
        Text(user.user.phoneNumber)
        Text(user.user.email)
        Text(user.user.userSpecialNeeds == .wheelChair ? "WheelChair" : "Something Else")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
