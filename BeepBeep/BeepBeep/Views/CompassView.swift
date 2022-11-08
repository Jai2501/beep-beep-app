//
//  CompassView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 8/11/22.
//

import SwiftUI

struct CompassView: View {
    @ObservedObject var compassHeading = CompassHeading()
    
    var body: some View {
        VStack {
            
            // Later Replace this Capsule with Arrow
            Capsule()
                .frame(width: 5, height: 50)
                .rotationEffect(Angle(degrees: self.compassHeading.degrees))
            
            ZStack {
                ForEach (Marker.markers(), id: \.self) { marker in
                    CompassMarkerView(marker: marker,
                                      compassDegress: 0)
                }
            }
            .frame(width: 300, height: 300)
            .rotationEffect(Angle(degrees: self.compassHeading.degrees)) // 3
            .statusBar(hidden: true)
            
        }
    }
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
