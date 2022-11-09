//
//  EnterNameAndEmailView.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 6/11/22.
//

import SwiftUI

struct EnterNameAndEmailView: View {
    
    @EnvironmentObject var appTheme: ThemeViewModel
    @EnvironmentObject var user: UserViewModel
    
    @State var name: String = ""
    @State var email: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
        
            Color.clear
        
            Image("GetStartedBackgroundCut")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(appTheme.theme.themeColor.opacity(0.3))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Spacer()
                    
                    Text("Name")
                        .bold()
                        .padding(.trailing, UIScreen.main.bounds.width * 0.59)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("b-light-gray"), lineWidth: 2)
                        .frame(width: 280, height: 45)
                        .overlay {
                            TextField("Name", text: $name)
                                .padding()
                                .keyboardType(.default)
                                .onChange(of: name) { newValue in
                                    print("New Name")
                                    user.updateUserName(name: newValue)
                                }
                        }
                        .padding(.bottom)

                        Text("Email")
                            .bold()
                            .padding(.trailing, UIScreen.main.bounds.width * 0.59)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("b-light-gray"), lineWidth: 2)
                            .frame(width: 280, height: 45)
                            .overlay {
                                TextField("Email", text: $email)
                                    .padding()
                                    .keyboardType(.default)
                                    .onChange(of: email) { newValue in
                                        print("New Email")
                                        user.updateUserEmail(email: newValue)
                                    }
                            }
                    Spacer()
                }
                .padding()
                
                Spacer()
                    
                VStack {
                    Spacer()
                        
                    NavigationLink (
                        destination: ThankYouForSigningUpView().environmentObject(user).environmentObject(appTheme),
                        label: {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 280, height: 40)
                                .foregroundColor(Color("b-orange"))
                                .overlay(
                                    Text("Next")
                                        .foregroundColor(.white)
                                        .bold()
                                )
                                .padding(5)
                                .disabled(!(user.isUserEmailValid() && user.isUserNameValid()))
                                .opacity(user.isUserEmailValid() && user.isUserNameValid() ? 1 : 0.5)
                        })
                        .padding(8)
                        .disabled(!(user.isUserEmailValid() && user.isUserNameValid()))
                        
                        Text("By singing up, you agree to our Privacy Policy and \n Terms & Conditions")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                }
            }
        }
        .ignoresSafeArea(.keyboard, edges: .all)
        .navigationTitle("Profile")
        .onAppear {
            user.updateUserName(name: name)
            user.updateUserEmail(email: email)
        }
    }
}

struct EnterNameAndEmailView_Previews: PreviewProvider {
    static var previews: some View {
        EnterNameAndEmailView()
    }
}
