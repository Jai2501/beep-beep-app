//
//  RideTypesComponent.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 11/11/22.
//

import SwiftUI

struct RideTypesComponent: View {
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<3) { item in
                    GeometryReader { geometry in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.cyan)
                                .frame(width: 150, height: 150)
                                .border(.black)
//                                .padding(.leading, UIScreen.main.bounds.width * (geometry.frame(in: .global).minX / 153) * CGFloat(item.magnitude))
                                .scaleEffect(
                                (geometry.frame(in: .global).minX / 153 >= 0.5) && (geometry.frame(in: .global).minX / 153) <= 1.2 ? 1 : 0.75)
                        }
                        Text("\(geometry.frame(in: .global).minX / 153)")
                    }
                    .frame(width: 105)
                    .frame(maxHeight: .infinity)
                }
            }
        }
    }
}

struct RideTypesComponent_Previews: PreviewProvider {
    static var previews: some View {
        RideTypesComponent()
    }
}
