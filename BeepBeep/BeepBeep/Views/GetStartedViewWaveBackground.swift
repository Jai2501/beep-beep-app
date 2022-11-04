//
//  GetStartedView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 3/11/22.
//

import SwiftUI

struct GetStartedViewWaveBackground: View {
    
    @State private var percent = 100.0
    @State private var waveOffset = Angle(degrees: 0)
    @State private var waveOffsetTwo = Angle(degrees: 180)
    
    @State var backgroundColour: Color = Color("b-light-orange")
    @State var backgroundColourGradient: LinearGradient = LinearGradient(
        colors: [Color("b-light-orange").opacity(1), Color("b-light-orange").opacity(0.25)],
        startPoint: .top,
        endPoint: .bottom)
    
    var body: some View {
        ZStack {
            VStack{
//                RoundedRectangle(cornerRadius: 25)
//                    .fill(
//                        LinearGradient(
//                            colors: [.white, Color("b-light-orange")],
//                            startPoint: .top,
//                            endPoint: .bottom
//                        ))
//                    .frame(
//                        width: UIScreen.main.bounds.width,
//                        height: (UIScreen.main.bounds.height / 3))
                
//                Text("Hi")
                
                ZStack {
                    Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: percent / 100)
                        .fill(backgroundColourGradient)
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: (UIScreen.main.bounds.height / 3))
                    
                    Wave(offset: Angle(degrees: self.waveOffsetTwo.degrees), percent: percent / 100)
                        .fill(backgroundColourGradient)
                        .opacity(1)
                        .frame(
                            width: UIScreen.main.bounds.width,
                            height: (UIScreen.main.bounds.height / 3))
                }
                .onAppear {
                    withAnimation(
                        Animation
                            .linear(duration: 10)
                            .repeatForever(autoreverses: false)) {
                                self.waveOffset = Angle(degrees: 360)
                                self.waveOffsetTwo = Angle(degrees: -180)
                            }
                }
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))

                 Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            
//            VStack {
//                    Text("Hi")
//                    Text("Get Started!")
//
////                Spacer()
//            }
//            .foregroundColor(.cyan)
        }
//        .navigationTitle("Get Started")
    }
}

struct Wave: Shape {
    var offset: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue)}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 0.035
        let waveHeight = 0.055 * rect.height
        let yOffset = CGFloat(1 - percent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        
        path.move(to: CGPoint(x: 0, y: yOffset + waveHeight * CGFloat(sin(offset.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 10) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            path.addLine(to: CGPoint(x: x, y: yOffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}

struct GetStartedViewWaveBackground_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedViewWaveBackground()
    }
}
