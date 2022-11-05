//
//  UserProfileComponent.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 5/11/22.
//

import SwiftUI

struct UserProfileSelectionComponent: View {
    
    var selectionImage: Image
    var selectionText: String
    var selectionColor: Color
    var selectionImageHeight: Double
    var selectionImageWidth: Double
    
    @Binding var isTapped: Bool
    
    init(selectionImage: Image, selectionText: String, selectionColor: Color, selectionImageHeight: Double, selectionImageWidth: Double, isTapped: Binding<Bool>) {
        self.selectionImage = selectionImage
        self.selectionText = selectionText
        self.selectionColor = selectionColor
        self.selectionImageHeight = selectionImageHeight
        self.selectionImageWidth = selectionImageWidth
        self._isTapped = isTapped
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(selectionColor, lineWidth: 5)
            .frame(width: 133, height: 133)
            .background(content: {
                if (isTapped) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(selectionColor)
                }
            })
            .overlay {
                VStack(alignment: .center) {
                    selectionImage
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: selectionImageWidth, height: selectionImageHeight)
                        .padding()
                    
                    Text(selectionText)
                        .font(.footnote)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                }
                .foregroundColor(isTapped ? .white : Color("b-gray"))

            }
            .shadow(color: selectionColor, radius: isTapped ? 10 : 0)
//            .onTapGesture {
//                print("Tapped")
//                isTapped.toggle()
//            }
            .padding(.all, 16)
    }
}

//struct UserProfileSelectionComponent_Previews: PreviewProvider {
//    
//    @State var isTapped: Bool = false
//    
//    static var previews: some View {
//        UserProfileSelectionComponent(
//            selectionImage: Image("WheelchairUserProfileSelection"),
//            selectionText: "Wheelchair User",
//            selectionColor: .cyan,
//            selectionImageHeight: 41,
//            selectionImageWidth: 29,
//            isTapped: $isTapped
//        )
//    }
//}
