//
//  DirectionAndGuidanceView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 8/11/22.
//

import SwiftUI

struct DirectionAndGuidanceComponent: View {
    @ObservedObject var compassHeading = CompassHeading()
    
    @State var directionToHeadTowards: String = ""
    
    func getDirectionToHead() -> Text {
        let heading = self.compassHeading.degrees * (-1)
        
        if (heading >= 0 && heading < 45) {
            return Text("Head **Straight** for **2m**")
        } else if (heading >= 45 && heading < 90) {
            return Text("Turn **Left**")
        } else if (heading >= 90 && heading < 135) {
            return Text("Turn Sharp **Left**")
        } else if (heading >= 135 && heading < 215) {
            return Text("Turn **Around**")
        } else if (heading >= 215 && heading < 270) {
            return Text("Turn Sharp **Right**")
        } else if (heading >= 270 && heading < 315) {
            return Text("Turn **Right**")
        } else if (heading > 315 && heading <= 360) {
            return Text("Head **Straight** for **2m**")
        } else {
            return Text("You are Lost")
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
                        .frame(width: 129, height: 139)
                }
//                .background(Color.orange)
                .rotationEffect(Angle(degrees: 0))
                .padding(.bottom, 205)
//                .background(Color.red)
                
                ZStack {
                    Image("GuidanceArrowCenter_")
                        .resizable()
                        .frame(width: 176, height: 176)
                }
            }
            .rotationEffect(Angle(degrees: self.compassHeading.degrees))
//            .background(Color.cyan)
//            .frame(width: UIScreen.main.bounds.width, height: 350)
            
            getDirectionToHead()
                //.multilineTextAlignment(.center)
                .font(.system(size: 30))
                .foregroundColor(Color("b-light-turqoise-1"))
//                .fontWeight(.semibold)
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct DirectionAndGuidanceView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionAndGuidanceComponent()
    }
}
