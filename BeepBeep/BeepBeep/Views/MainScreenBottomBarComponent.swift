//
//  MainScreenBottomBarComponent.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 12/11/22.
//

import SwiftUI

struct MainScreenBottomBarComponent: View {
    @Binding var isBookAvClicked: Bool
    @Binding var isAboutAvsClicked: Bool
    @Binding var isRewardsClicked: Bool
    @Binding var isAccountClicked: Bool
    
    func tappedOnBookAv() {
        isBookAvClicked = true
        
        if (isAboutAvsClicked) {
            isAboutAvsClicked.toggle()
        }
        
        if (isRewardsClicked) {
            isRewardsClicked.toggle()
        }
        
        if (isAccountClicked) {
            isAccountClicked.toggle()
        }
    }
    
    func tappedOnAboutAvs() {
        isAboutAvsClicked = true
        
        if (isBookAvClicked) {
            isBookAvClicked.toggle()
        }
        
        if (isRewardsClicked) {
            isRewardsClicked.toggle()
        }
        
        if (isAccountClicked) {
            isAccountClicked.toggle()
        }
    }
    
    func tappedOnRewards() {
        isRewardsClicked = true
        
        if (isBookAvClicked) {
            isBookAvClicked.toggle()
        }
        
        if (isAboutAvsClicked) {
            isAboutAvsClicked.toggle()
        }
        
        if (isAccountClicked) {
            isAccountClicked.toggle()
        }
    }
    
    func tappedOnAccount() {
        isAccountClicked = true
        
        if (isBookAvClicked) {
            isBookAvClicked.toggle()
        }
        
        if (isAboutAvsClicked) {
            isAboutAvsClicked.toggle()
        }
        
        if (isRewardsClicked) {
            isRewardsClicked.toggle()
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.clear
            
            Rectangle()
                .fill(.white)
                .frame(width: 390, height: 70)
                .shadow(radius: 4)
            
            HStack(alignment: .center) {
                Spacer()
                
                VStack {
                    Image(systemName: "car.fill")
                        .font(.title3)
                        .padding(.bottom, 0.1)

                    Text("Book AV")
                        .font(.caption)
                        .padding(.top, -5)
                }
                .bold()
                .foregroundColor(isBookAvClicked ? Color("b-turqoise") : Color("b-light-gray-1"))
                .onTapGesture {
                    tappedOnBookAv()
                }
                
                Spacer()
                
                VStack {
                    Image(systemName: "info.circle")
                        .font(.title3)
                        .padding(.bottom, 0.1)

                    Text("About AVs")
                        .font(.caption)
                        .padding(.top, -5)
                }
                .bold()
                .foregroundColor(isAboutAvsClicked ? Color("b-turqoise") : Color("b-light-gray-1"))
                .onTapGesture {
                    tappedOnAboutAvs()
                }
                
                
                Spacer()
                
                VStack {
                    Image(systemName: "tag")
                        .font(.title3)
                        .padding(.bottom, 0.1)

                    Text("Rewards")
                        .font(.caption)
                        .padding(.top, -5)
                }
                .bold()
                .foregroundColor(isRewardsClicked ? Color("b-turqoise") : Color("b-light-gray-1"))
                .onTapGesture {
                    tappedOnRewards()
                }
                
                
                Spacer()
                
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.title3)
                        .padding(.bottom, 0)

                    Text("Account")
                        .font(.caption)
                        .padding(.top, -0.1)
                }
                .bold()
                .foregroundColor(isAccountClicked ? Color("b-turqoise") : Color("b-light-gray-1"))
                .onTapGesture {
                    tappedOnAccount()
                }
                
                
                Spacer()
            }
            .padding(.bottom)
            .foregroundColor(Color("b-light-gray-1"))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

//struct MainScreenBottomBarComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        MainScreenBottomBarComponent()
//    }
//}
