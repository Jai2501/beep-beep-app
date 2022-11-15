//
//  GuidanceView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 13/11/22.
//

import SwiftUI

struct GuidanceView: View {
    //@EnvironmentObject var carNumberAndTime: CarNumberAndTimerViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.clear
                .overlay {
                    LinearGradient(colors: [Color("b-light-turqoise").opacity(0.4), .white], startPoint: .top, endPoint: .bottom)
                }
            
            Image("AvArrivalAndNumber")
                .resizable()
                .scaledToFit()
            
            TimeLeftForAvComponent()
            
            AvNumberComponent()
            
            VStack {
                Spacer()
                
                Text("Let’s get you to the pick up point!")
                    .foregroundColor(Color("b-light-turqoise-1"))
                    .font(.headline)
                    .padding(.bottom)
                
                DirectionAndGuidanceComponent()
                
                AccessibilityOptionsComponent()
                    .padding(.vertical, 16)
                
//                NavigationLink(
//                    destination: AvArrivedAndControlView(),
//                    //.environmentObject(carNumberAndTime),
//                    label: {
//                        BottomTabBar()
//                })
                
                BottomTabBar()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct AvNumberComponent: View {
    @EnvironmentObject var carNumberAndTime: CarNumberAndTimerViewModel
    
    var body: some View {
        
        NavigationLink(
            destination: AvArrivedAndControlView()
                .environmentObject(carNumberAndTime),
            label: {
                Text(carNumberAndTime.carNumber)
                    .foregroundColor(Color("b-teal"))
                    .font(.system(size: 8))
                    .frame(width: 108, height: 31)
                    .padding(.top, UIScreen.main.bounds.height * 0.1625)
                    .padding(.leading, UIScreen.main.bounds.width * 0.5325)
                    .bold()
        })
    }
}

struct TimeLeftForAvComponent: View {
    @EnvironmentObject var carNumberAndTime: CarNumberAndTimerViewModel
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("\(carNumberAndTime.minutes):\(carNumberAndTime.seconds < 10 ? "0": "")\(carNumberAndTime.seconds)")
            .foregroundColor(Color("b-teal"))
            .font(.largeTitle)
            .bold()
            .frame(width: 100, height: 50)
            .padding(.top, UIScreen.main.bounds.height * 0.09)
            .padding(.leading, UIScreen.main.bounds.width * 0.14)
            .onReceive(timer) { _ in
                if ((carNumberAndTime.millisecondsInFiveMinutes >= 0)) {
                    carNumberAndTime.minutes = ((carNumberAndTime.millisecondsInFiveMinutes / 1000) / 60)
                    carNumberAndTime.seconds = ((carNumberAndTime.millisecondsInFiveMinutes / 1000) % 60)
                    carNumberAndTime.millisecondsInFiveMinutes = carNumberAndTime.millisecondsInFiveMinutes - 1000
                    
                    carNumberAndTime.arrivalTime = carNumberAndTime.millisecondsInFiveMinutes
                }
            }
    }
}

struct GuidanceView_Previews: PreviewProvider {
    static var previews: some View {
        GuidanceView()
    }
}
