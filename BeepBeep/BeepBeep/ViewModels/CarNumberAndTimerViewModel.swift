//
//  CarNumberAndTimerViewModel.swift
//  BeepBeep
//
//  Created by Jai Lulla  on 12/11/22.
//

import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseDatabaseSwift

class CarNumberAndTimerViewModel: ObservableObject {
    // @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var millisecondsInFiveMinutes: Int = 300000
    
    @Published var carNumber: String = ""
    @Published var arrivalTime: Int = 0
    
    @Published var minutes: Int = 5
    @Published var seconds: Int = 0
    
     
    var ref: DatabaseReference!
    
    init() {
        carNumber = "SGJ2501L"
        arrivalTime = 12222221
    }
     
    func getCarNumber() {
        ref = Database.database().reference()
        self.ref.child("berth-live-info/berth-a-1")
    }
     
    func getArrivalTime() {
        ref = Database.database().reference()
        self.ref.child("berth-live-info/berth-a-1-time")
    }
}
