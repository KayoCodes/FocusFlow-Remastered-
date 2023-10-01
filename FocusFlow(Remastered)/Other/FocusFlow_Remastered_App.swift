//
//  FocusFlow_Remastered_App.swift
//  FocusFlow(Remastered)
//
//  Created by keenan ray on 9/5/23.
//
import FirebaseCore
import SwiftUI

@main
struct FocusFlow_Remastered_App: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
