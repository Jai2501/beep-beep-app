//
//  GetStartedView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 4/11/22.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        
        ZStack {
            GetStartedViewWaveBackground()
            
            RoundedRectangle(cornerRadius: 25)
                .blendMode(.destinationOut)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
                .overlay {
                    VStack {
                        Text("Testing")
                            .padding(.top, 200)
                        Spacer()
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .compositingGroup()
        
        }
        .navigationTitle("Get Started")
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
