//
//  PreviousVisitedLocationView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 11/11/22.
//

import SwiftUI

struct PreviousVisitedLocationView: View {
    @State var bottomBorder: Bool
    @State var addressHeading: String
    @State var addressDescription: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 1) {
                Image("locationMarkerSymbol")
                    .resizable()
                    .frame(width: 16, height: 22)
                
                VStack(alignment: .leading) {
                    Text(addressHeading)
                        .bold()
                        .font(.headline)
                    
                    Text(addressDescription)
                        .font(.caption2)
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(Color("b-black"))
                .padding(.horizontal)
            }
            .padding(.vertical, 8)
            .padding(.leading, 10)
            
            Rectangle()
                .fill(Color("b-light-gray"))
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 2)
                .opacity(bottomBorder ? 1 : 0)
        }
    }
}

//struct PreviousVisitedLocationView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviousVisitedLocationView()
//    }
//}
