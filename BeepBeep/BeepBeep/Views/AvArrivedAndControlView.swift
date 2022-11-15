//
//  AvControlView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 13/11/22.
//

import SwiftUI

struct AvArrivedAndControlView: View {
    @EnvironmentObject var carNumberAndTime: CarNumberAndTimerViewModel
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.clear
            
            Image("AvArrivedAndWaiting")
                .resizable()
                .scaledToFit()
            
            Text("\(carNumberAndTime.minutes):\(carNumberAndTime.seconds < 10 ? "0": "")\(carNumberAndTime.seconds)")
                .foregroundColor(Color("b-teal"))
                .font(.largeTitle)
                .bold()
                .frame(width: 100, height: 50)
                .padding(.top, UIScreen.main.bounds.height * 0.175)
                .padding(.trailing, UIScreen.main.bounds.width * 0.52)
                .onReceive(timer) { _ in
                    if ((carNumberAndTime.millisecondsInFiveMinutes >= 0)) {
                        carNumberAndTime.minutes = ((carNumberAndTime.millisecondsInFiveMinutes / 1000) / 60)
                        carNumberAndTime.seconds = ((carNumberAndTime.millisecondsInFiveMinutes / 1000) % 60)
                        carNumberAndTime.millisecondsInFiveMinutes = carNumberAndTime.millisecondsInFiveMinutes - 1000
                        
                        carNumberAndTime.arrivalTime = carNumberAndTime.millisecondsInFiveMinutes
                    }
                }
            
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .frame(width: 108, height: 31)
                .padding(.top, UIScreen.main.bounds.height * 0.35)
                .padding(.leading, UIScreen.main.bounds.width * 0.4)
                .shadow(radius: 2)
            
            Text(carNumberAndTime.carNumber)
                .foregroundColor(Color("b-teal"))
                .frame(width: 108, height: 31)
                .padding(.top, UIScreen.main.bounds.height * 0.35)
                .padding(.leading, UIScreen.main.bounds.width * 0.4)
                .bold()
            
            VStack {
                Spacer()
                
                Image("UnlockAvButtonImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280, height: 280)
                
                Text("Unlock the AV when you are \nwithin 1m of the vehicle")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("b-light-gray-1"))
                    .bold()
                    .font(.footnote)
                    .padding(.top, -30)
                
                HStack(spacing: 30) {
                    VStack {
                        Circle()
                        .fill(Color("b-light-turqoise-2"))
                        .frame(width: 63, height: 63)
                        .overlay {
                            Image(systemName: "bell.fill")
                                .font(.title2)
                                .foregroundColor(Color("b-gray"))
                        }
                        
                        Text("Chime")
                            .font(.caption)
                            .foregroundColor(Color("b-gray"))
                            .bold()
                    }
                    
                    VStack {
                        Circle()
                        .fill(Color("b-light-turqoise-2"))
                        .frame(width: 63, height: 63)
                        .overlay {
                            Image("BootIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        
                        Text("Open Boot")
                            .font(.caption)
                            .foregroundColor(Color("b-gray"))
                            .bold()
                    }
                }
                .padding(.vertical)
                
                NavigationLink(
                    destination: WelcomeOnboardView(),
                    label: {
                        BottomTabBar()
                    })
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct AvControlView_Previews: PreviewProvider {
    static var previews: some View {
        AvArrivedAndControlView()
    }
}
