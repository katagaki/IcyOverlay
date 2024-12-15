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
            Button("Cause overlay to be shown for 2 seconds") {
                progressAlertManager.show(title: "Loading...", message: "Loading content") {
                    Task {
                        try? await Task.sleep(for: .seconds(2))
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
                // HACK: DO NOT REMOVE. Removing this will cause a freeze when isShowing is false.
                Color.clear
            }
        }
    }
}
