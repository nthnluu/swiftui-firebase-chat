//
//  tutorialApp.swift
//  tutorial
//
//  Created by Nathan Luu on 10/16/20.
//

import SwiftUI
import Firebase

@main
struct tutorialApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
