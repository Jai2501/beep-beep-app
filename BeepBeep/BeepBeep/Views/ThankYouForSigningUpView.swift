//
//  ThankYouForSigningUpScreen.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 8/11/22.
//

import SwiftUI

struct ThankYouForSigningUpView: View {
    
    @EnvironmentObject var appTheme: ThemeViewModel
    @EnvironmentObject var user: UserViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            
            // To expand the view
            Color.clear
            
            Image("GetStartedBackgroundCut")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(appTheme.theme.themeColor.opacity(0.3))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image(systemName: "checkmark.circle")
                    .font(.system(size: 60))
                    .foregroundColor(.green)
                
                Text("Thank you for signing up! \n You can now book a ride with us.")
                    .bold()
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Image("ThankYouScreenImage")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.leading)
                    .padding(.bottom)
                
                NavigationLink (
                    destination: MainScreenView(),
                    label: {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 250, height: 40)
                            .foregroundColor(Color("b-orange"))
                            .overlay(
                                Text("Lets Go")
                                    .foregroundColor(.white)
                                    .bold()
                            )
                })
                .padding(5)
                
                Spacer()
            }
        }
    }
}

struct ThankYouForSigningUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThankYouForSigningUpView()
    }
}
