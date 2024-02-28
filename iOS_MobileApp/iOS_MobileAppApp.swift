//
//  iOS_MobileAppApp.swift
//  iOS_MobileApp
//
//  Created by Hakan Shehu on 26.2.24.
//

import SwiftUI
import FirebaseCore

@main
struct iOS_MobileAppApp: App {
    var cartManager = CartManager()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(cartManager)        }
    }
}
