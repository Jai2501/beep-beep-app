//
//  SearchAndFindAvView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 12/11/22.
//

import SwiftUI

extension Date {
    var millisecondsSince1970: Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}

struct SearchAndFindAvView: View {
    @State var foundAnAv: Bool = false
    @State var currentTime: Int64 = Date().millisecondsSince1970
    
//    @State var millisecondsInFiveMinutes: Int = 300000
//
//    @State var minutes: Int = 5
//    @State var seconds: Int = 0
    
    @ObservedObject var carNumberAndTime: CarNumberAndTimerViewModel = .init()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.clear
            
            ZStack {
                Image("SearchingForAV")
                    .resizable()
                    .scaledToFit()
                    .opacity(foundAnAv ? 0 : 1)
                
                
                Image("FoundAnAV")
                    .resizable()
                    .scaledToFit()
                    .opacity(foundAnAv ? 1 : 0)
//                    .overlay {
//                        RoundedRectangle(cornerRadius: 24)
//                            .fill(.clear)
//                            .frame(height: 300)
//                            .padding(.top, 230)
//
//                        RoundedRectangle(cornerRadius: 24)
//                            .fill(.blue)
//                            .frame(height: 100)
//                    }
            }
            
            // For tapping Purposes to change state
            RoundedRectangle(cornerRadius: 25)
                .fill(.clear)
                .frame(width: UIScreen.main.bounds.width, height: 30)
                .opacity(0.001)
                //.padding(.leading, UIScreen.main.bounds.width * 0.5)
//                .onTapGesture {
//                    foundAnAv = true
//                    carNumberAndTime.carNumber = "SGJ2501L"
//                }
            
            Group {
                // This is for Time
                RoundedRectangle(cornerRadius: 15)
                    .fill(.clear)
                    .frame(width: 100, height: 50)
                    .padding(.top, UIScreen.main.bounds.height * 0.18)
                    .padding(.trailing, UIScreen.main.bounds.width * 0.455)
                    .shadow(radius: 2)
                    .overlay {
                        //                    Text("4:53")
                        //                        .foregroundColor(.black)
                        //                        .onReceive(timer) { _ in
                        //
                        //                        }
                    }
                
                Text("\(carNumberAndTime.minutes):\(carNumberAndTime.seconds < 10 ? "0": "")\(carNumberAndTime.seconds)")
                    .foregroundColor(Color("b-light-turqoise-2"))
                    .font(.largeTitle)
                    .bold()
                    .frame(width: 100, height: 50)
                    .padding(.top, UIScreen.main.bounds.height * 0.165)
                    .padding(.trailing, UIScreen.main.bounds.width * 0.52)
                    .onReceive(timer) { _ in
                        if ((carNumberAndTime.millisecondsInFiveMinutes >= 0) && foundAnAv) {
                            carNumberAndTime.minutes = ((carNumberAndTime.millisecondsInFiveMinutes / 1000) / 60)
                            carNumberAndTime.seconds = ((carNumberAndTime.millisecondsInFiveMinutes / 1000) % 60)
                            carNumberAndTime.millisecondsInFiveMinutes = carNumberAndTime.millisecondsInFiveMinutes - 1000
                            
                            carNumberAndTime.arrivalTime = carNumberAndTime.millisecondsInFiveMinutes
                        }
                    }
                
                // This is for Number
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .frame(width: 108, height: 31)
                    .padding(.top, UIScreen.main.bounds.height * 0.355)
                    .padding(.leading, UIScreen.main.bounds.width * 0.4)
                    .shadow(radius: 2)
                
                Text(carNumberAndTime.carNumber)
                    .foregroundColor(Color("b-teal"))
                    .frame(width: 108, height: 31)
                    .padding(.top, UIScreen.main.bounds.height * 0.355)
                    .padding(.leading, UIScreen.main.bounds.width * 0.4)
                    .bold()
            }
            .opacity(foundAnAv ? 1 : 0)
            
            VStack {
                Spacer()
                
                Text("What to expect in an AV?")
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color("b-light-turqoise-1"))
                    .onTapGesture {
                        foundAnAv = true
                        carNumberAndTime.carNumber = "SGJ2501L"
                    }
                
                AvKnowledgeCardsComponent()
                
                NavigationLink(
                    destination: GuidanceView().environmentObject(carNumberAndTime),
                    label: {
                        BottomTabBar()
                })
                .simultaneousGesture(TapGesture().onEnded {
                    timer.upstream.connect().cancel()
                })
                
//                BottomTabBar()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct SearchAndFindAvView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAndFindAvView()
    }
}
