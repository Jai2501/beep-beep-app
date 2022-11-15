//
//  FoundAnAvView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 8/11/22.
//

import SwiftUI

struct FoundAnAvView: View {
    
    @State var backgroundColor: Color = .cyan
    @State var sampleText: String = ""
    
    var body: some View {
        ZStack {
            
            Color.clear
            
            Rectangle()
                .fill(.white)
                .overlay(alignment: .top) {
                    Image("GetStartedBackground")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(.cyan)
                        .rotationEffect(Angle(degrees: 0))
                        .padding(.bottom, 50)
                        //.padding(.leading, 200)
                }
                .ignoresSafeArea()
                .padding(.bottom, 300)
            
//            Image("GetStartedBackground")
//                .renderingMode(.template)
//                .resizable()
//                .scaledToFill()
//                .foregroundColor(backgroundColor.opacity(0.3))
//                .frame(width: UIScreen.main.bounds.width * 1.55)
//                .padding(.bottom, UIScreen.main.bounds.height * 1.2)
            
            TextField("Some Text", text: $sampleText)
                .border(.blue)
                .padding()
                .border(.red)
            
            BottomTabBar()
                .padding(.top, UIScreen.main.bounds.height * 0.87)
        }
        .ignoresSafeArea(.keyboard, edges: .all)
    }
}

struct FoundAnAvView_Previews: PreviewProvider {
    static var previews: some View {
        FoundAnAvView()
    }
}
