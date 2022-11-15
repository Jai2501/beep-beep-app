//
//  AvKnowledgeCardsComponent.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 12/11/22.
//

import SwiftUI

struct AvKnowledgeCardsComponent: View {
    @State var scrollValue: CGFloat = 0
    
    @State var isOnFirstCard: Bool = true
    @State var isOnSecondCard: Bool = false
    @State var isOnThirdCard: Bool = false
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Image("AvKnowledgeCardOne")
                        .resizable()
                        .scaledToFit()
                        .padding(.leading)

                    Image("AvKnowledgeCardTwo")
                        .resizable()
                        .scaledToFit()

                    Image("AvKnowledgeCardThree")
                        .resizable()
                        .scaledToFit()
                        .padding(.trailing)
                }
                .frame(height: 294)
                .padding(1)
            }
            .gesture(
               DragGesture().onChanged { value in
                   scrollValue = value.translation.width
                   
                   if (scrollValue < 0 && scrollValue > -15) {
                       isOnSecondCard = true
                       
                       isOnFirstCard = false
                       isOnThirdCard = false
                   } else if (scrollValue <= -15) {
                       isOnThirdCard = true
                       
                       isOnFirstCard = false
                       isOnSecondCard = false
                   } else if (scrollValue > 0 && scrollValue < 15) {
                       isOnSecondCard = true
                       
                       isOnFirstCard = false
                       isOnThirdCard = false
                   } else {
                       isOnFirstCard = true
                       
                       isOnSecondCard = false
                       isOnThirdCard = false
                   }
                   
                   if value.translation.width > 0 {
                     print("Scroll Left")
                  } else {
                     print("Scroll Right")
                  }
               }
            )
            
            HStack(spacing: 1) {
                Spacer()
                
                ZStack {
                    Capsule()
                        .rotation(Angle(degrees: 180))
                        .frame(width: 20, height: 6)
                        .padding(1)
                        .opacity(isOnFirstCard ? 1 :0)
                    
                    Circle()
                        .frame(width: 6, height: 6)
                        .padding(1)
                        .opacity(isOnFirstCard ? 0 :1)
                }
                
                ZStack {
                    Capsule()
                        .rotation(Angle(degrees: 180))
                        .frame(width: 20, height: 6)
                        .padding(1)
                        .opacity(isOnSecondCard ? 1 : 0)
                    
                    Circle()
                        .frame(width: 6, height: 6)
                        .padding(1)
                        .opacity(isOnSecondCard ? 0 :1)
                }
                
                ZStack {
                    Capsule()
                        .rotation(Angle(degrees: 180))
                        .frame(width: 20, height: 6)
                        .padding(1)
                        .opacity(isOnThirdCard ? 1 : 0)
                    
                    Circle()
                        .frame(width: 6, height: 6)
                        .padding(1)
                        .opacity(isOnThirdCard ? 0 : 1)
                }
                
                Spacer()
                
//                Text("\(scrollValue)")
//                    .foregroundColor(.black)
            }
            .foregroundColor(Color("b-light-gray"))
            
        }
    }
}

struct AvKnowledgeCardsComponent_Previews: PreviewProvider {
    static var previews: some View {
        AvKnowledgeCardsComponent()
    }
}
