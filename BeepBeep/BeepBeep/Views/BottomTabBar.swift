//
//  BottomTabBar.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 8/11/22.
//

import SwiftUI

struct BottomTabBar: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.1)
            .shadow(radius: 2)
            .overlay {
                HStack {
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color("b-light-gray"))
                        .overlay {
                            HStack {
                                Image(systemName: "phone.fill")
                                    .foregroundColor(Color("b-light-gray-1"))
                                
                                Text("Track my AV")
                                    .foregroundColor(Color("b-light-gray-1"))
                            }
                        }
                    //147, 27
                        .frame(width: 140, height: 30)
                        .fontWeight(.semibold)
                        .font(.caption)

                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color("b-light-gray"))
                        .overlay {
                            HStack {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(Color("b-light-gray-1"))
                                
                                Text("Cancel Ride")
                                    .foregroundColor(Color("b-light-gray-1"))
                            }
                        }
                    //147, 27
                        .frame(width: 140, height: 30)
                        .fontWeight(.semibold)
                        .font(.caption)
                    
                    
                    // Trial with a button
//                    Button {
//                        // Dummy Button
//                    } label: {
//                        Image(systemName: "phone.fill")
//                            .foregroundColor(Color("b-light-gray-1"))
//
//                        Text("Track my AV")
//                    }
//                    .padding(4)
//                    .tint(Color("b-light-gray-1"))
//                    .border(Color("b-light-gray-1"))
//                    .cornerRadius(40)
                }
            }
    }
}

struct BottomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBar()
    }
}
