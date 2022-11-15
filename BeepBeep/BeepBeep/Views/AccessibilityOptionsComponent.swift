//
//  AccessibilityOptionsComponent.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 13/11/22.
//

import SwiftUI

struct AccessibilityOptionsComponent: View {
    @State var isAudioGuideActive: Bool = true
    @State var isVibrationGuideActive: Bool = false
    @State var isRequiringExtraTime: Bool = false
    
    func tappedOnAudioGuide() {
        isAudioGuideActive = true
        
        isVibrationGuideActive = false
        isRequiringExtraTime = false
    }
    
    func tappedOnVibrationGuide() {
        isVibrationGuideActive = true
        
        isAudioGuideActive = false
        isRequiringExtraTime = false
    }
    
    func tappedOnExtraTime() {
        isRequiringExtraTime = true
        
        isVibrationGuideActive = false
        isAudioGuideActive = false
    }
    
    var body: some View {
        HStack(spacing: 38) {
            Spacer()
            
            VStack {
                Circle()
                    .fill(isAudioGuideActive ? Color("b-teal") :Color("b-light-turqoise-2"))
                    .frame(width: 63, height: 63)
                    .overlay {
                        Image(systemName: "speaker.wave.3.fill")
                            .font(.title2)
                            .foregroundColor(isAudioGuideActive ? .white : Color("b-black"))
                }
                
                Text("Audio guide")
                    .foregroundColor(Color("b-black"))
                    .font(.caption2)
                    .bold()
            }
            .onTapGesture {
                tappedOnAudioGuide()
            }
            
            VStack {
                Circle()
                    .fill(isVibrationGuideActive ? Color("b-teal") : Color("b-light-turqoise-2"))
                    .frame(width: 63, height: 63)
                    .overlay {
                        Image("PhoneVibrateIcon")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 28, height: 25)
                            .foregroundColor(isVibrationGuideActive ? .white : Color("b-black"))
                }
                
                Text("Vibration when near")
                    .foregroundColor(Color("b-black"))
                    .font(.caption2)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            .onTapGesture {
                tappedOnVibrationGuide()
            }
            
            VStack {
                Circle()
                    .fill(isRequiringExtraTime ? Color("b-teal") : Color("b-light-turqoise-2"))
                    .frame(width: 63, height: 63)
                    .overlay {
                        Image("ExtraTimeIcon")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 28, height: 25)
                            .foregroundColor(isRequiringExtraTime ? .white : Color("b-black"))
                            .overlay(alignment: .bottomTrailing) {
                                Image(systemName: "plus")
                                    .foregroundColor(isRequiringExtraTime ? .cyan : Color("b-light-turqoise-2"))
                                    .font(.system(size: 8))
                                    .bold()
                                    .padding(.bottom, 2)
                                    .padding(.trailing, 1)
                            }
//                            .overlay(alignment: .bottomTrailing) {
//                                Image(systemName: "plus.circle.fill")
//                                    .padding(50)
//                                    
//                            }
//                            .foregroundColor(.white)
                    }
                
                Text("Extra Time")
                    .foregroundColor(Color("b-black"))
                    .font(.caption2)
                    .bold()
            }
            .onTapGesture {
                tappedOnExtraTime()
            }
            
            Spacer()
        }
    }
}

struct AccessibilityOptionsComponent_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilityOptionsComponent()
    }
}
