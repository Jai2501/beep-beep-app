//
//  DirectionAndGuidanceView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 8/11/22.
//

import SwiftUI

struct DirectionAndGuidanceView: View {
    @ObservedObject var compassHeading = CompassHeading()
    
    @State var directionToHeadTowards: String = ""
    
    func getDirectionToHead() -> String {
        let heading = self.compassHeading.degrees * (-1)
        
        if (heading >= 0 && heading < 45) {
            return "Head **Straight** \n For **2m**"
        } else if (heading >= 45 && heading < 90) {
            return "Turn **Left**"
        } else if (heading >= 90 && heading < 135) {
            return "Turn Sharp **Left**"
        } else if (heading >= 135 && heading < 215) {
            return "Turn **Around**"
        } else if (heading >= 215 && heading < 270) {
            return "Turn Sharp **Right**"
        } else if (heading >= 270 && heading < 315) {
            return "Turn **Right**"
        } else if (heading > 315 && heading <= 360) {
            return "Head **Straight** \n For **2m**"
        } else {
            return "You are Lost"
        }
    }
    
    var body: some View {
        VStack {
            // Till Zstack only arrow and centre: working
            ZStack {
                    VStack {
                        Image("GuidanceArrow")
                        //                .renderingMode(.template)
                            .resizable()
                            .frame(width: 91, height: 112)
                    }
                    .rotationEffect(Angle(degrees: 0))

                    .padding(.bottom, 155)
                    
                    ZStack {
                        Image("GuidanceArrowCenter")
                            .resizable()
                            .frame(width: 83, height: 83)
                    }
                }
            .rotationEffect(Angle(degrees: self.compassHeading.degrees))
            
            Text(String(getDirectionToHead()))
                .multilineTextAlignment(.center)
                .font(.system(size: 22))
                .foregroundColor(Color("b-light-turqoise-1"))
                .fontWeight(.semibold)
        }
    }
}

struct DirectionAndGuidanceView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionAndGuidanceView()
    }
}
