//
//  OtpViewModel.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 5/11/22.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseDatabaseSwift

class OtpViewModel: ObservableObject {
    @Published var otpText: String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
    
    // Error Handling Purposes
    @Published var showAlert: Bool = false
    @Published var errorMsg: String = ""
    
    // Phone Number
    @Published var phoneNumber: String = ""
    @Published var countryCode: String = "+65"
    
    // Otp Code
    @Published var otpVerificationCode: String = ""
    
    // Loading
    @Published var isLoading: Bool = false
    
    // Realtime Database
    var ref: DatabaseReference!
    
    func sendOtp() async {
        if (isLoading) {
            return
        }
        
        do {
            self.isLoading = true
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber("+\(countryCode)\(phoneNumber)", uiDelegate: nil)
            DispatchQueue.main.async {
                self.isLoading = false
                self.otpVerificationCode = result
            }
        } catch {
            handleError(error: error.localizedDescription)
        }
    }
    
    func handleError(error: String) {
        DispatchQueue.main.async {
            self.isLoading = false
            self.errorMsg = error
            self.showAlert.toggle()
        }
    }
    
    func updatePhoneNumberInRealtimeDatabase() {
        ref = Database.database().reference()
        
        self.ref.child("user-verification-bypass/phone-number").setValue("phoneNumber")
        self.ref.child("user-verification-bypass/phone-number").setValue(phoneNumber)
    }
}

