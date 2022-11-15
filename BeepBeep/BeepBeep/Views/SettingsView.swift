//
//  SettingsView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 15/11/22.
//

import SwiftUI

struct SettingsView: View {
    @State var isVoiceOverRequired: Bool = true
    @State var isBoldTextRequired: Bool = false
    @State var isReachabilityRequired: Bool = false
    @State var isVoiceControlRequired: Bool = true
    @State var isAudioGuideRequired: Bool = true
    @State var isVibrationRequired: Bool = true
    
    var body: some View {
        // Use ZStack for overlaying heading text
        ZStack(alignment: .top) {
            Color.clear
        
            Image("GetStartedBackgroundCut")
                //.renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(.cyan.opacity(0.3))
                .edgesIgnoringSafeArea(.all)
            
            Text("Accessibility Settings")
                .bold()
            
            Text("Vision")
                .padding(.top, UIScreen.main.bounds.height * 0.11)
                .padding(.trailing, UIScreen.main.bounds.width * 0.75)
                .bold()
                .foregroundColor(Color("b-black"))
                .font(.body)
            
            Text("Interaction")
                .padding(.top, UIScreen.main.bounds.height * 0.345)
                .padding(.trailing, UIScreen.main.bounds.width * 0.67)
                .bold()
                .foregroundColor(Color("b-black"))
                .font(.body)
            
            Text("Wayfinding")
                .padding(.top, UIScreen.main.bounds.height * 0.525)
                .padding(.trailing, UIScreen.main.bounds.width * 0.66)
                .bold()
                .foregroundColor(Color("b-black"))
                .font(.body)
            
            Form {
                // Vision
                Section(
                    header: Text(""),
                    footer: Text(""),
                    content: {
                        Toggle(isOn: $isVoiceOverRequired) {
                            Text("VoiceOver")
                        }
                        .tint(Color("b-light-turqoise-1"))
                        
                        Label {
                            HStack {
                                Text("Larger Text")
                                    .foregroundColor(Color("b-black"))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("b-light-gray-2"))
                                    .bold()
                            }
                        } icon: {}
                        
                        Toggle(isOn: $isBoldTextRequired) {
                            Text("Bold Text")
                        }
                        .tint(Color("b-light-turqoise-1"))
                    })
                
                // Interaction
                Section(
                    header: Text(""),
                    footer: Text(""),
                    content: {
                        Toggle(isOn: $isReachabilityRequired) {
                            Text("Reachability")
                        }
                        .tint(Color("b-light-turqoise-1"))
                        
                        Toggle(isOn: $isVoiceControlRequired) {
                            Text("Voice Control")
                        }
                        .tint(Color("b-light-turqoise-1"))
                    })
                
                // Wayfinding
                Section(
                    header: Text(""),
                    footer: Text(""),
                    content: {
                        Toggle(isOn: $isAudioGuideRequired) {
                            Text("Audio Guide")
                        }
                        .tint(Color("b-light-turqoise-1"))
                        
                        Toggle(isOn: $isVibrationRequired) {
                            Text("Vibration when Nearing AV (5m)")
                        }
                        .tint(Color("b-light-turqoise-1"))
                    })
            }
            .padding(.top, UIScreen.main.bounds.height * 0.1)
            .shadow(color: Color("b-light-gray") ,radius: 10)
        }
        .scrollContentBackground(.hidden)
//        .shadow(color: Color("b-light-gray") ,radius: 10)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
