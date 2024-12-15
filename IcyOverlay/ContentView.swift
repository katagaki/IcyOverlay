//
//  ContentView.swift
//  IcyOverlay
//
//  Created by シン・ジャスティン on 2024/12/15.
//

import SwiftUI

struct ContentView: View {
    @Environment(ProgressAlertManager.self) var progressAlertManager

    var body: some View {
        @Bindable var progressAlertManager = progressAlertManager

        List {
            Button("Simulate Content Load") {
                progressAlertManager.show(title: "Loading...", message: "Loading content") {
                    Task {
                        try? await Task.sleep(for: .seconds(1))
                        progressAlertManager.percentage = 50
                        try? await Task.sleep(for: .seconds(1))
                        progressAlertManager.percentage = 100
                        try? await Task.sleep(for: .seconds(1))
                        progressAlertManager.hide()
                    }
                }
            }
        }
        .overlay {
            if progressAlertManager.isShowing {
                ProgressAlert(
                    title: $progressAlertManager.title,
                    message: $progressAlertManager.message
                )
            } else {
                // Removing else part causes freeze
                Color.clear
            }
        }
    }
}
