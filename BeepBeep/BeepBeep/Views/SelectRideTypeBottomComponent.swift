//
//  SelectRideTypeBottomComponent.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 12/11/22.
//

import SwiftUI

struct SelectRideTypeBottomComponent: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.clear
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 2)
                .frame(width: 390, height: 173)
            
            Image("AVTypeSelection")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 28)
                .padding(.bottom, UIScreen.main.bounds.height * 0.17)
                .shadow(radius: 2)
            
            HStack(alignment: .center) {
                Spacer()
                
                Image("VisaPaymentMethod")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 34, height: 24)
                
                Text("8074")
                
                Spacer()
                
                Capsule()
                    .frame(width: 1, height: 23)
                    .foregroundColor(Color("b-light-gray-1"))
                
                Spacer()
                
                Text("Add a promo")
                
                Spacer()
            }
            .font(.callout)
            .padding(.bottom, 100)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SelectRideTypeBottomComponent_Previews: PreviewProvider {
    static var previews: some View {
        SelectRideTypeBottomComponent()
    }
}
