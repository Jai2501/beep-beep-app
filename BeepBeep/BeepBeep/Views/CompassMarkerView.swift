//
//  CompassMarkerView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 8/11/22.
//

import SwiftUI

struct CompassMarkerView: View {
    let marker: Marker
    let compassDegress: Double

    var body: some View {
        VStack {
            // 1
            Text(marker.degreeText())
                .fontWeight(.light)
                .rotationEffect(self.textAngle())

            // 2
            Capsule()
                .frame(width: self.capsuleWidth(), height: self.capsuleHeight())
                .foregroundColor(self.capsuleColor())
                    .padding(.bottom, 120)

            // 3
            Text(marker.label)
                .fontWeight(.bold)
                .rotationEffect(self.textAngle())
                .padding(.bottom, 80)
        }
        .rotationEffect(Angle(degrees: marker.degrees)) // 4
    }
    
    // 1
    private func capsuleWidth() -> CGFloat {
        return self.marker.degrees == 0 ? 7 : 3
    }

    // 2
    private func capsuleHeight() -> CGFloat {
        return self.marker.degrees == 0 ? 45 : 30
    }

    // 3
    private func capsuleColor() -> Color {
        return self.marker.degrees == 0 ? .red : .gray
    }

    // 4
    private func textAngle() -> Angle {
        return Angle(degrees: -self.compassDegress - self.marker.degrees)
    }
}

//struct CompassMarkerView_Previews: PreviewProvider {
//    static var previews: some View {
//         CompassMarkerView()
//    }
//}
