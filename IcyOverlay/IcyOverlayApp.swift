//
//  IcyOverlayApp.swift
//  IcyOverlay
//
//  Created by シン・ジャスティン on 2024/12/15.
//

import SwiftUI

@main
struct IcyOverlayApp: App {
    
    @State var progressAlertManager = ProgressAlertManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(progressAlertManager)
    }
}
