//
//  EnterOtpView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 5/11/22.
//

import SwiftUI

struct EnterOtpView: View {
    var backgroundColor: Color = .red
    var widthOfOtpCodeBox: Double = 25
    var heightOfOtpCodeBox: Double = 100
    
    @State var otpCodeOne: String = "1"
    
    
    var body: some View {
        ZStack {
            VStack {
                Image("GetStartedBackground")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(backgroundColor.opacity(0.3))
                    .frame(width: UIScreen.main.bounds.width * 1.55)
                    .padding(.bottom, UIScreen.main.bounds.height * 1.2)
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    TextField("1", text: $otpCodeOne)
                        .cornerRadius(20)
                        .border(.black, width: 2)
                        .frame(width: widthOfOtpCodeBox, height: heightOfOtpCodeBox)
                    
                    TextField("1", text: $otpCodeOne)
                        .border(.black, width: 2)
                        .frame(width: widthOfOtpCodeBox, height: heightOfOtpCodeBox)
                    
                    TextField("1", text: $otpCodeOne)
                        .border(.black, width: 2)
                        .frame(width: widthOfOtpCodeBox, height: heightOfOtpCodeBox)
                }
            }
        }
    }
}

struct EnterOtpView_Previews: PreviewProvider {
    static var previews: some View {
        EnterOtpView()
    }
}
